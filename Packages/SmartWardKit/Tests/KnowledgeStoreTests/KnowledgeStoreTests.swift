import XCTest
import SwiftData
@testable import KnowledgeStore

/// Each test owns its in-memory container; the container must outlive the
/// context, so tests keep a local reference to it.
@MainActor
private func makeContext() throws -> (ModelContainer, ModelContext) {
    let container = try KnowledgeSchema.makeContainer(inMemory: true)
    return (container, container.mainContext)
}

final class SchemaTests: XCTestCase {

    func testEveryModelIsInTheSchema() {
        let names = Set(KnowledgeSchema.schema.entities.map(\.name))
        XCTAssertEqual(names.count, KnowledgeSchema.models.count)
        for expected in ["Project", "Conversation", "Message", "Article", "Chunk", "ThemeNode", "Mention"] {
            XCTAssertTrue(names.contains(expected), "\(expected) missing from schema")
        }
    }

    @MainActor
    func testProjectGraphRoundTripsAndCascades() throws {
        let (container, context) = try makeContext()
        defer { _ = container }
        let project = Project(name: "SmartWard", goal: "Ship v1")
        let conversation = Conversation(title: "Kickoff")
        let message = Message(role: "user", content: "What should Phase 1 include?")
        let link = ProjectLink(kind: .githubRepo, url: "https://github.com/AnubisRooster/SmartWard",
                               repoFullName: "AnubisRooster/SmartWard")
        let decision = StrategyItem(kind: .decision, text: "BYOK-first strategist")
        context.insert(project)
        project.conversations?.append(conversation)
        conversation.messages?.append(message)
        project.links?.append(link)
        project.items?.append(decision)
        project.brief = ProjectBrief(markdown: "# SmartWard")
        try context.save()

        let fetched = try context.fetch(FetchDescriptor<Project>())
        XCTAssertEqual(fetched.count, 1)
        XCTAssertEqual(fetched.first?.conversations?.first?.messages?.first?.content,
                       "What should Phase 1 include?")
        XCTAssertEqual(fetched.first?.items?.first?.kind, .decision)
        XCTAssertEqual(fetched.first?.links?.first?.kind, .githubRepo)
        XCTAssertEqual(fetched.first?.brief?.markdown, "# SmartWard")

        context.delete(project)
        try context.save()
        XCTAssertEqual(try context.fetchCount(FetchDescriptor<Conversation>()), 0)
        XCTAssertEqual(try context.fetchCount(FetchDescriptor<Message>()), 0)
        XCTAssertEqual(try context.fetchCount(FetchDescriptor<ProjectLink>()), 0)
        XCTAssertEqual(try context.fetchCount(FetchDescriptor<StrategyItem>()), 0)
        XCTAssertEqual(try context.fetchCount(FetchDescriptor<ProjectBrief>()), 0)
    }

    @MainActor
    func testDeletingSourceKeepsArticles() throws {
        let (container, context) = try makeContext()
        defer { _ = container }
        let source = Source(kind: "rss", url: "https://example.com/feed.xml")
        let article = Article(canonicalURL: "https://example.com/a", title: "A")
        context.insert(source)
        source.articles?.append(article)
        try context.save()

        context.delete(source)
        try context.save()
        let articles = try context.fetch(FetchDescriptor<Article>())
        XCTAssertEqual(articles.count, 1)
        XCTAssertNil(articles.first?.source)
    }

    @MainActor
    func testNodeMentionsLinkToChunks() throws {
        let (container, context) = try makeContext()
        defer { _ = container }
        let article = Article(canonicalURL: "https://example.com/lora", title: "LoRA")
        let chunk = Chunk(text: "LoRA adapters are small.")
        let node = ThemeNode(type: "technique", canonicalLabel: "LoRA")
        let mention = Mention(confidence: 0.9)
        context.insert(article)
        article.chunks?.append(chunk)
        context.insert(node)
        node.mentions?.append(mention)
        chunk.mentions?.append(mention)
        try context.save()

        XCTAssertEqual(mention.node?.canonicalLabel, "LoRA")
        XCTAssertEqual(mention.chunk?.article?.title, "LoRA")
    }

    @MainActor
    func testEnumBackedFieldsFallBackOnUnknownRawValues() throws {
        let (container, _) = try makeContext()
        defer { _ = container }
        let item = StrategyItem(kind: .risk, text: "x")
        item.statusRaw = "something-new"
        XCTAssertEqual(item.status, .open)
        item.status = .done
        XCTAssertEqual(item.statusRaw, "done")

        let conversation = Conversation(title: "t", mode: .researchPlan)
        XCTAssertEqual(conversation.modeRaw, "research_plan")
    }
}

final class NormalizedKeyTests: XCTestCase {
    func testNormalizesCaseSpacingHyphensAndUnderscores() {
        XCTAssertEqual(ThemeNode.normalizedKey(type: "model", label: "GPT-4o"), "model:gpt-4o")
        XCTAssertEqual(ThemeNode.normalizedKey(type: "model", label: "  GPT 4o "), "model:gpt-4o")
        XCTAssertEqual(ThemeNode.normalizedKey(type: "Tool", label: "swift_data  --  kit"), "tool:swift-data-kit")
    }
}

final class ContextPolicyTests: XCTestCase {

    @MainActor
    func testPrivateContentNeverLeavesTheDevice() throws {
        let (container, context) = try makeContext()
        defer { _ = container }
        let publicChunk = Chunk(text: "public")
        let flaggedChunk = Chunk(text: "flagged", localOnly: true)
        let privateArticle = Article(canonicalURL: "https://github.com/me/private", title: "p", localOnly: true)
        let inheritedChunk = Chunk(text: "from private article")
        context.insert(privateArticle)
        privateArticle.chunks?.append(inheritedChunk)
        context.insert(publicChunk)
        context.insert(flaggedChunk)
        try context.save()

        let allowed = ContextPolicy.chunksAllowedForBYOK([publicChunk, flaggedChunk, inheritedChunk])
        XCTAssertEqual(allowed.map(\.text), ["public"])
    }

    @MainActor
    func testPrivateRepoLinksIgnoreTheExtractionToggle() throws {
        let (container, _) = try makeContext()
        defer { _ = container }
        let privateRepo = ProjectLink(kind: .githubRepo, url: "u", isPrivate: true)
        privateRepo.includeInExtraction = true
        XCTAssertFalse(privateRepo.sendsContentToBYOK)

        let publicRepo = ProjectLink(kind: .githubRepo, url: "u")
        XCTAssertTrue(publicRepo.sendsContentToBYOK)
        publicRepo.includeInExtraction = false
        XCTAssertFalse(publicRepo.sendsContentToBYOK)
    }

    @MainActor
    func testOffTheRecordConversationsStayOnDevice() throws {
        let (container, _) = try makeContext()
        defer { _ = container }
        let conversation = Conversation(title: "t")
        XCTAssertTrue(ContextPolicy.mayExtractWithBYOK(conversation))
        conversation.offTheRecord = true
        XCTAssertFalse(ContextPolicy.mayExtractWithBYOK(conversation))
    }

    @MainActor
    func testOffTheRecordTurnsNeverLeaveTheDevice() throws {
        let (container, context) = try makeContext()
        defer { _ = container }
        let conversation = Conversation(title: "t")
        context.insert(conversation)
        let turn = Message(role: "user", content: "our plan")
        conversation.messages?.append(turn)
        let chunk = Chunk(text: "our plan")
        turn.chunks?.append(chunk)
        try context.save()
        XCTAssertTrue(ContextPolicy.mayLeaveDevice(chunk))
        XCTAssertTrue(ContextPolicy.messageMayLeaveDevice(turn))

        // Even a chunk indexed before it was marked local-only.
        conversation.offTheRecord = true
        XCTAssertFalse(ContextPolicy.mayLeaveDevice(chunk))
        XCTAssertFalse(ContextPolicy.messageMayLeaveDevice(turn))
    }
}

final class ThemeStrengthTests: XCTestCase {
    private let now = Date(timeIntervalSince1970: 1_800_000_000)
    private let day: TimeInterval = 24 * 60 * 60

    func testHalvesEveryHalfLife() {
        let fresh = ThemeStrength.score(mentions: [(confidence: 1, createdAt: now)], now: now, halfLife: 10 * day)
        let old = ThemeStrength.score(mentions: [(confidence: 1, createdAt: now - 10 * day)], now: now, halfLife: 10 * day)
        XCTAssertEqual(fresh, 1, accuracy: 1e-9)
        XCTAssertEqual(old, 0.5, accuracy: 1e-9)
    }

    func testSumsConfidenceWeightedMentions() {
        let score = ThemeStrength.score(mentions: [
            (confidence: 0.5, createdAt: now),
            (confidence: 1, createdAt: now - 20 * day),
        ], now: now, halfLife: 10 * day)
        XCTAssertEqual(score, 0.5 + 0.25, accuracy: 1e-9)
    }

    func testFutureMentionsCountAtFullWeightAndBadHalfLifeIsZero() {
        XCTAssertEqual(ThemeStrength.score(mentions: [(confidence: 1, createdAt: now + day)], now: now), 1, accuracy: 1e-9)
        XCTAssertEqual(ThemeStrength.score(mentions: [(confidence: 1, createdAt: now)], now: now, halfLife: 0), 0)
    }
}
