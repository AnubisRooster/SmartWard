import XCTest
import SwiftData
import BYOKLLMKit
import KnowledgeStore
@testable import Pipeline

/// Records requests and answers with a fixed summary.
final class FakeSummarizer: DigestSummarizing, @unchecked Sendable {
    let tier: ExtractionTier
    var usage: LLMUsage?
    private(set) var requests: [DigestSummaryRequest] = []

    init(tier: ExtractionTier, usage: LLMUsage? = nil) {
        self.tier = tier
        self.usage = usage
    }

    func summarize(_ request: DigestSummaryRequest) async throws -> DigestSummary {
        requests.append(request)
        return DigestSummary(text: "\(tier.rawValue): \(request.themes.first ?? "")", usage: usage,
                             provider: tier == .byok ? "openrouter" : nil, model: tier == .byok ? "cheap" : nil)
    }
}

@MainActor
final class DigestFixture {
    let container: ModelContainer
    let context: ModelContext
    let project: Project
    let since: Date
    let now: Date

    init() throws {
        let now = Date(timeIntervalSince1970: 1_800_000_000)
        let since = now - 86_400
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        let context = container.mainContext

        func node(_ label: String, createdAt: Date) -> ThemeNode {
            let node = ThemeNode(type: "concept", canonicalLabel: label)
            node.createdAt = createdAt
            context.insert(node)
            return node
        }
        let llm = node("LLM", createdAt: since - 1_000)
        let vllm = node("vLLM", createdAt: now - 10)
        let spec = node("speculative decoding", createdAt: now - 10)
        let medusa = node("Medusa", createdAt: now - 10)
        let bread = node("Sourdough", createdAt: now - 10)
        let old = node("Expert systems", createdAt: now - 5 * 86_400)

        func article(_ title: String, _ themes: [ThemeNode], at date: Date? = nil,
                     localOnly: Bool = false) -> Article {
            let article = Article(canonicalURL: "https://x.example/\(title.hashValue)", title: title,
                                  localOnly: localOnly)
            article.stage = .linked
            context.insert(article)
            let chunk = KnowledgeStore.Chunk(text: "\(title) body text.", localOnly: localOnly)
            article.chunks?.append(chunk)
            for theme in themes {
                let mention = Mention(confidence: 1, createdAt: date ?? now - 60)
                mention.node = theme
                chunk.mentions?.append(mention)
            }
            return article
        }

        let project = Project(name: "Inference")
        context.insert(project)
        project.pinnedNodes?.append(vllm)

        _ = article("vLLM adds speculative decoding", [llm, vllm, spec])
        _ = article("Medusa heads", [llm, spec, medusa])
        _ = article("Internal Medusa notes", [medusa], localOnly: true)
        let baking = article("Sourdough at scale", [llm, bread])
        baking.projectID = project.id
        // Left out: older than the window, off-topic, and your own repo docs.
        _ = article("Expert systems retrospective", [old], at: now - 4 * 86_400)
        article("Off topic", [bread]).stage = .triagedOut
        let repo = Source(kind: "github_repo", url: "https://github.com/me/app")
        context.insert(repo)
        article("README", [vllm]).source = repo
        try context.save()

        self.container = container
        self.context = context
        self.project = project
        self.since = since
        self.now = now
    }
}

final class DigestBuilderTests: XCTestCase {

    @MainActor
    func testClustersByNonHubThemesAndRanksAgainstProjects() throws {
        let fixture = try DigestFixture()
        let builder = DigestBuilder(onDevice: nil, byok: nil, now: { fixture.now })
        let clusters = try builder.clusters(context: fixture.context, since: fixture.since, until: fixture.now)

        XCTAssertEqual(clusters.count, 2, "LLM is in most new articles, so it doesn't join the baking article to the rest")
        let serving = clusters[0]
        XCTAssertEqual(serving.title, "Medusa · speculative decoding", "titled by its own themes, not the hub")
        XCTAssertEqual(serving.articleCount, 3)
        XCTAssertEqual(Set(serving.themes), ["LLM", "speculative decoding", "Medusa", "vLLM"])
        XCTAssertEqual(serving.novelty, 0.75, accuracy: 1e-9, "only LLM existed before")
        XCTAssertEqual(serving.relevance, 0.25, accuracy: 1e-9, "one of four themes is pinned to the project")
        XCTAssertEqual(serving.projects.map(\.name), ["Inference"])

        let baking = clusters[1]
        XCTAssertEqual(baking.title, "Sourdough")
        XCTAssertEqual(baking.articleCount, 1)
        XCTAssertEqual(baking.relevance, 0.5, accuracy: 1e-9, "shared to the project")
        XCTAssertLessThan(baking.score, serving.score)

        let titles = Set(clusters.flatMap { $0.articles.map(\.title) })
        XCTAssertFalse(titles.contains("Expert systems retrospective"))
        XCTAssertFalse(titles.contains("Off topic"))
        XCTAssertFalse(titles.contains("README"), "your own repo docs aren't news")
    }

    @MainActor
    func testTopClustersGoToYourProviderWithoutPrivateContent() async throws {
        let fixture = try DigestFixture()
        let onDevice = FakeSummarizer(tier: .onDevice)
        let byok = FakeSummarizer(tier: .byok, usage: LLMUsage(inputTokens: 200, outputTokens: 40, costUSD: 0.0002))
        var builder = DigestBuilder(onDevice: onDevice, byok: byok, now: { fixture.now })
        builder.providerSummaries = 1

        let built = try await builder.build(context: fixture.context)
        let digest = try XCTUnwrap(built)
        XCTAssertEqual(digest.periodStart, fixture.now - 3 * 86_400, "the first digest looks back three days")
        let clusters = digest.clusters
        XCTAssertEqual(clusters.map(\.summaryTier), ["byok", "onDevice"])
        XCTAssertEqual(clusters[0].summary, "byok: LLM")

        let sent = try XCTUnwrap(byok.requests.first)
        XCTAssertFalse(sent.excerpts.contains { $0.title == "Internal Medusa notes" }, "private content stays on-device (D5)")
        XCTAssertEqual(sent.excerpts.count, 2)
        XCTAssertEqual(sent.projects, ["Inference"])
        XCTAssertEqual(onDevice.requests.count, 1)

        let usage = try fixture.context.fetch(FetchDescriptor<UsageRecord>())
        XCTAssertEqual(usage.map(\.feature), ["digest"])

        // The next digest starts where this one ended: nothing new yet.
        let again = try await builder.build(context: fixture.context)
        XCTAssertNil(again)
        XCTAssertEqual(try DigestBuilder.latest(context: fixture.context)?.id, digest.id)
    }

    @MainActor
    func testOverBudgetOrWithoutModelsItStillBuilds() async throws {
        let fixture = try DigestFixture()
        UsageLedger.record(provider: "openrouter", model: "m", feature: "chat", inputTokens: 1, outputTokens: 1,
                           reportedCostUSD: 5, context: fixture.context, now: fixture.now)
        let onDevice = FakeSummarizer(tier: .onDevice)
        let byok = FakeSummarizer(tier: .byok)
        let budgeted = DigestBuilder(onDevice: onDevice, byok: byok, budget: DailyBudget(capUSD: 1), now: { fixture.now })
        let built = try await budgeted.build(context: fixture.context)
        let digest = try XCTUnwrap(built)
        XCTAssertTrue(byok.requests.isEmpty, "over budget, nothing goes to your provider")
        XCTAssertEqual(digest.clusters.map(\.summaryTier), ["onDevice", "onDevice"])

        let other = try DigestFixture()
        let bare = DigestBuilder(onDevice: nil, byok: nil, now: { other.now })
        let bareBuilt = try await bare.build(context: other.context)
        let plain = try XCTUnwrap(bareBuilt)
        XCTAssertEqual(plain.clusters.last?.summaryTier, "none")
        XCTAssertEqual(plain.clusters.last?.summary, "Sourdough at scale")
    }
}
