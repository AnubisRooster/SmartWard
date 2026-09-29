import XCTest
import SwiftData
import RetrievalKit
import KnowledgeStore
import IngestKit
@testable import Pipeline

/// Bag-of-words hashing embedder: texts sharing words point the same way.
struct FakeEmbedder: EmbeddingProviding {
    var dimension: Int { 256 }

    func embed(_ text: String) async -> [Float]? {
        let words = text.lowercased().split(whereSeparator: { !$0.isLetter && !$0.isNumber })
        guard !words.isEmpty else { return nil }
        var vector = [Float](repeating: 0, count: dimension)
        for word in words where word.count > 2 {
            var hash: UInt32 = 2_166_136_261
            for byte in word.utf8 { hash = (hash ^ UInt32(byte)) &* 16_777_619 }
            vector[Int(hash % UInt32(dimension))] += 1
        }
        return vector
    }
}

struct FakeFullText: FullTextFetching {
    var pages: [String: ExtractedArticle] = [:]
    var backingOff: Set<String> = []

    func fetchArticle(_ url: URL) async throws -> ExtractedArticle {
        if backingOff.contains(url.absoluteString) {
            throw IngestError.backingOff(host: url.host ?? "", until: .distantFuture)
        }
        guard let page = pages[url.absoluteString] else { throw IngestError.http(status: 404) }
        return page
    }
}

struct FixedJudge: RelevanceJudging {
    let verdict: Bool?
    func isRelevant(title: String, summary: String, interests: String) async -> Bool? { verdict }
}

let fakeModel = EmbeddingModel(id: "fake-v1", provider: FakeEmbedder())

final class VectorCodingTests: XCTestCase {
    func testRoundTripAndMean() {
        let vector: [Float] = [0.5, -1.25, 3, 0]
        let data = VectorCoding.data(from: vector)
        XCTAssertEqual(data.count, 16)
        XCTAssertEqual(VectorCoding.vector(from: data), vector)
        XCTAssertEqual(VectorCoding.vector(from: Data([1, 2, 3])), [])
        XCTAssertEqual(VectorCoding.mean([[1, 2], [3, 4]]), [2, 3])
        XCTAssertNil(VectorCoding.mean([[1], [1, 2]]))
        XCTAssertNil(VectorCoding.mean([]))
    }
}

final class TriageTests: XCTestCase {
    private func vector(_ text: String) async -> [Float] {
        await FakeEmbedder().embed(text) ?? []
    }

    func testSimilarityDependenciesAndMutes() async {
        let model = InterestModel(
            interests: [.init(label: "agents", vector: await vector("autonomous coding agents planning tools"))],
            dependencies: ["swiftsoup": ["SmartWard"]],
            mutedTopics: ["crypto"])

        let onTopic = Triage.score(title: "Coding agents that plan", summary: "Autonomous agents use tools",
                                   vector: await vector("Coding agents that plan. Autonomous agents use tools"),
                                   model: model)
        let offTopic = Triage.score(title: "Sourdough baking", summary: "Flour and water",
                                    vector: await vector("Sourdough baking. Flour and water"), model: model)
        XCTAssertGreaterThan(onTopic.score, 0.5)
        XCTAssertEqual(onTopic.reason, "Matches agents")
        XCTAssertLessThan(offTopic.score, Triage.Strength.balanced.threshold)

        let dependency = Triage.score(title: "SwiftSoup 3.0 released", summary: "",
                                      vector: await vector("SwiftSoup released"), model: model)
        XCTAssertEqual(dependency.score, 0.9)
        XCTAssertEqual(dependency.reason, "Mentions swiftsoup, used by SmartWard")
        XCTAssertEqual(Triage.score(title: "Soupy news", summary: "", vector: nil, model: model).score,
                       Triage.neutralScore, "whole words only; no vector is neutral")

        let muted = Triage.score(title: "Coding agents for crypto trading", summary: "",
                                 vector: await vector("Coding agents for crypto trading"), model: model)
        XCTAssertLessThan(muted.score, onTopic.score * 0.5)
        XCTAssertEqual(muted.reason, "Muted topic: crypto")
    }

    func testReadingFeedbackNudgesScores() async {
        let base = InterestModel(interests: [.init(label: "x", vector: await vector("databases gossip storage"))])
        var withFeedback = base
        withFeedback.liked = await vector("vector search embeddings retrieval")
        withFeedback.disliked = await vector("celebrity gossip")

        let article = await vector("vector search with embeddings")
        let before = Triage.score(title: "a", summary: "", vector: article, model: base).score
        let after = Triage.score(title: "a", summary: "", vector: article, model: withFeedback)
        XCTAssertGreaterThan(after.score, before)
        XCTAssertEqual(after.reason, "Similar to what you've been reading")

        let gossip = await vector("celebrity gossip roundup")
        XCTAssertLessThan(Triage.score(title: "b", summary: "", vector: gossip, model: withFeedback).score,
                          Triage.score(title: "b", summary: "", vector: gossip, model: base).score)
    }

    func testEmptyModelIsNeutral() {
        XCTAssertEqual(Triage.score(title: "t", summary: "", vector: [1, 0], model: InterestModel()).score,
                       Triage.neutralScore)
    }
}

final class PipelineRunnerTests: XCTestCase {
    private let now = Date(timeIntervalSince1970: 1_800_000_000)
    private let longText = String(repeating: "Coding agents plan with tools and verify their work. ", count: 12)

    @MainActor
    private func makeStore() throws -> (ModelContainer, ModelContext) {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        let context = container.mainContext
        let profile = InterestProfile(statement: "Autonomous coding agents, planning and tool use")
        profile.mutedTopics = ["crypto"]
        context.insert(profile)
        let project = Project(name: "SmartWard", goal: "Research strategist for coding agents")
        context.insert(project)
        let tool = ThemeNode(type: "tool", canonicalLabel: "SwiftSoup")
        context.insert(tool)
        project.pinnedNodes?.append(tool)
        try context.save()
        return (container, context)
    }

    @MainActor
    private func article(_ url: String, _ title: String, summary: String = "", text: String = "",
                         stage: ArticleStage, source: Source? = nil, context: ModelContext) -> Article {
        let article = Article(canonicalURL: url, title: title, cleanedText: text)
        article.summary = summary
        article.stage = stage
        context.insert(article)
        article.source = source
        return article
    }

    @MainActor
    func testRunsTheStagesAndEmbeds() async throws {
        let (container, context) = try makeStore()
        _ = container
        let repo = Source(kind: "github_repo", url: "https://github.com/me/private")
        context.insert(repo)

        let teaser = article("https://blog.example/agents", "Coding agents that plan",
                             summary: "Agents plan tool use.", text: "Agents plan tool use.",
                             stage: .fetched, context: context)
        let full = article("https://blog.example/tools", "Tool use for coding agents",
                           summary: "Agents and tools", text: longText, stage: .cleaned, context: context)
        let offTopic = article("https://food.example/bread", "Sourdough baking at home",
                               summary: "Flour water salt", text: "Flour water salt.", stage: .cleaned, context: context)
        let privateDoc = article("https://github.com/me/private/blob/main/README.md", "me/private/README.md",
                                 text: "Internal notes about bread.", stage: .cleaned, source: repo, context: context)
        privateDoc.localOnly = true
        try context.save()

        let fullText = FakeFullText(pages: ["https://blog.example/agents": ExtractedArticle(title: "t", text: longText)])
        let runner = PipelineRunner(embedder: fakeModel, fullText: fullText, now: { self.now })
        let report = try await runner.run(context: context, until: now + 60)

        XCTAssertEqual(report, PipelineRunner.Report(triaged: 3, triagedOut: 1, fullTextFetched: 1, embedded: 3, remaining: 0))
        XCTAssertEqual(teaser.stage, .embedded)
        XCTAssertEqual(teaser.cleanedText, longText, "the teaser was replaced by the page")
        XCTAssertEqual(full.stage, .embedded)
        XCTAssertEqual(offTopic.stage, .triagedOut)
        XCTAssertTrue(offTopic.chunks?.isEmpty ?? true, "off-topic items aren't embedded")
        XCTAssertEqual(privateDoc.stage, .embedded, "linked-repo docs skip triage")
        XCTAssertEqual(privateDoc.relevance, 1)

        let chunks = try XCTUnwrap(full.chunks)
        XCTAssertFalse(chunks.isEmpty)
        XCTAssertTrue(chunks.allSatisfy { $0.embeddingModel == "fake-v1" && $0.vector != nil && !$0.localOnly })
        XCTAssertTrue(chunks.contains { $0.text.hasPrefix("Tool use for coding agents") }, "the title is indexed")
        XCTAssertTrue((privateDoc.chunks ?? []).allSatisfy(\.localOnly), "private content stays local-only (D5)")
        XCTAssertFalse(full.relevanceReason.isEmpty)
    }

    @MainActor
    func testUnreadablePageKeepsTheTeaserAndBackoffDefers() async throws {
        let (container, context) = try makeStore()
        _ = container
        let missing = article("https://blog.example/gone", "Coding agents that plan",
                              summary: "Agents plan tool use.", stage: .fetched, context: context)
        let busy = article("https://busy.example/agents", "Planning coding agents",
                           summary: "Agents plan.", stage: .fetched, context: context)
        try context.save()

        let runner = PipelineRunner(embedder: fakeModel,
                                    fullText: FakeFullText(backingOff: ["https://busy.example/agents"]),
                                    now: { self.now })
        let report = try await runner.run(context: context, until: now + 60)

        XCTAssertEqual(missing.stage, .embedded)
        XCTAssertEqual(missing.cleanedText, "Agents plan tool use.")
        XCTAssertEqual(busy.stage, .fetched, "retried on a later run")
        XCTAssertEqual(report.remaining, 1)
    }

    @MainActor
    func testStopsAtTheDeadlineAndResumes() async throws {
        let (container, context) = try makeStore()
        _ = container
        for index in 0..<3 {
            _ = article("https://blog.example/\(index)", "Coding agents \(index)", text: longText,
                        stage: .cleaned, context: context)
        }
        try context.save()

        let expired = PipelineRunner(embedder: fakeModel, fullText: nil, now: { self.now })
        let none = try await expired.run(context: context, until: now)
        XCTAssertEqual(none.remaining, 3, "nothing runs past the deadline")

        let runner = PipelineRunner(embedder: fakeModel, fullText: nil, now: { self.now })
        let report = try await runner.run(context: context, until: now + 60)
        XCTAssertEqual(report.embedded, 3)
        XCTAssertEqual(report.remaining, 0)

        // Running again is a no-op.
        let again = try await runner.run(context: context, until: now + 60)
        XCTAssertEqual(again, PipelineRunner.Report())
    }

    @MainActor
    func testReportsProgressAndCountsWhatIsWaiting() async throws {
        let (container, context) = try makeStore()
        _ = container
        for index in 0..<3 {
            _ = article("https://blog.example/\(index)", "Coding agents \(index)", text: longText,
                        stage: .cleaned, context: context)
        }
        _ = article("https://blog.example/ready", "Coding agents ready", text: longText,
                    stage: .triaged, context: context)
        try context.save()
        XCTAssertEqual(try PipelineRunner.waitingCount(context: context, includesLinking: false), 4)

        var done: [Int] = []
        var totals: [Int] = []
        let runner = PipelineRunner(embedder: fakeModel, fullText: nil, now: { self.now })
        let report = try await runner.run(context: context, until: now + 60) { completed, total in
            done.append(completed)
            totals.append(total)
        }

        // Three articles need triage then embedding, one only embedding.
        XCTAssertEqual(totals, Array(repeating: 7, count: 8), "the total is known when the run starts")
        XCTAssertEqual(done, Array(0...7), "reported at the start, then one step at a time, never backwards")
        XCTAssertEqual(report.embedded, 4)
        XCTAssertEqual(report.remaining, 0)
        XCTAssertEqual(try PipelineRunner.waitingCount(context: context, includesLinking: false), 0)
    }

    @MainActor
    func testJudgeDecidesBorderlineItemsAndOffDisablesFiltering() async throws {
        let (container, context) = try makeStore()
        _ = container
        // Shares one word with the interests: just under the balanced threshold.
        let borderline = article("https://food.example/1", "Coding sourdough baking home flour", text: "Flour.",
                                 stage: .cleaned, context: context)
        try context.save()

        let unfiltered = PipelineRunner(embedder: fakeModel, fullText: nil, strength: .off, now: { self.now })
        _ = try await unfiltered.run(context: context, until: now + 60)
        XCTAssertEqual(borderline.stage, .embedded, "with the filter off everything is kept")

        let threshold = Triage.Strength.balanced.threshold
        XCTAssertLessThan(borderline.relevance, threshold)
        XCTAssertLessThan(threshold - borderline.relevance, PipelineRunner.borderline)

        borderline.stage = .cleaned
        _ = try await PipelineRunner(embedder: fakeModel, fullText: nil, now: { self.now })
            .run(context: context, until: now + 60)
        XCTAssertEqual(borderline.stage, .triagedOut, "no judge: the score decides")

        borderline.stage = .cleaned
        let clearMiss = article("https://food.example/2", "Sourdough baking at home", text: "Flour.",
                                stage: .cleaned, context: context)
        try context.save()
        _ = try await PipelineRunner(embedder: fakeModel, fullText: nil, judge: FixedJudge(verdict: true),
                                     now: { self.now })
            .run(context: context, until: now + 60)
        XCTAssertEqual(borderline.stage, .embedded, "the judge rescued a borderline item")
        XCTAssertEqual(clearMiss.stage, .triagedOut, "clear misses never reach the judge")
    }

    @MainActor
    func testInterestModelUsesProfileProjectsDependenciesAndSignals() async throws {
        let (container, context) = try makeStore()
        _ = container
        let liked = article("https://blog.example/liked", "Liked", text: longText, stage: .triaged, context: context)
        try context.save()
        await ArticleIndexer(embedder: fakeModel).index(liked, context: context)
        context.insert(ReadingSignal(articleID: liked.id, kind: "star"))
        try context.save()

        let model = try await InterestModel.build(context: context, embedder: fakeModel)
        XCTAssertEqual(Set(model.interests.map(\.label)), ["your interests", "SmartWard"])
        XCTAssertEqual(model.dependencies, ["swiftsoup": ["SmartWard"]])
        XCTAssertEqual(model.mutedTopics, ["crypto"])
        XCTAssertNotNil(model.liked)
        XCTAssertNil(model.disliked)
        XCTAssertTrue(model.promptSummary.contains("Project SmartWard"))
    }

    @MainActor
    func testReindexingReplacesChunks() async throws {
        let (container, context) = try makeStore()
        _ = container
        let doc = article("https://blog.example/doc", "Doc", text: longText, stage: .triaged, context: context)
        try context.save()
        let indexer = ArticleIndexer(embedder: fakeModel)
        let first = await indexer.index(doc, context: context)
        try context.save()
        let second = await indexer.index(doc, context: context)
        try context.save()
        XCTAssertEqual(first, second)
        XCTAssertEqual(try context.fetchCount(FetchDescriptor<KnowledgeStore.Chunk>()), second)
        XCTAssertEqual(doc.chunks?.map(\.ordinal).sorted(), Array(0..<second))
    }
}

final class TriageDisplayTests: XCTestCase {
    @MainActor
    func testACardShowsTheScoreOnlyWhereTriageMeasuredIt() throws {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        let context = container.mainContext
        let feed = Source(kind: "rss", url: "https://feed.example")
        let shared = Source(kind: "manual", url: "")
        let repo = Source(kind: "github_repo", url: "https://github.com/me/x")
        for source in [feed, shared, repo] { context.insert(source) }

        func article(_ number: Int, _ stage: ArticleStage, _ relevance: Double,
                     reason: String = "Matches agents", source: Source) -> Article {
            let article = Article(canonicalURL: "https://x.example/\(number)", title: "t\(number)")
            context.insert(article)
            article.source = source
            article.stage = stage
            article.relevance = relevance
            article.relevanceReason = reason
            return article
        }

        XCTAssertEqual(Triage.displayPercent(for: article(1, .embedded, 0.347, source: feed)), 35, "rounded")
        XCTAssertEqual(Triage.displayPercent(for: article(2, .triaged, 0.9, source: feed)), 90)
        XCTAssertEqual(Triage.displayPercent(for: article(3, .triagedOut, 0.1, source: feed)), 10,
                       "off-topic items show why they were filtered")
        XCTAssertEqual(Triage.displayPercent(for: article(4, .linked, 0.5, source: feed)), 50,
                       "a neutral-looking score with a reason is a real score")

        XCTAssertNil(Triage.displayPercent(for: article(5, .fetched, 0, reason: "", source: feed)), "not scored yet")
        XCTAssertNil(Triage.displayPercent(for: article(6, .cleaned, 0, reason: "", source: feed)), "not scored yet")
        XCTAssertNil(Triage.displayPercent(for: article(7, .embedded, Triage.neutralScore, reason: "", source: feed)),
                     "nothing to compare against: neutral isn't a measurement")
        XCTAssertNil(Triage.displayPercent(for: article(8, .embedded, 1, reason: "You shared this", source: shared)),
                     "relevant by definition")
        XCTAssertNil(Triage.displayPercent(for: article(9, .embedded, 1, reason: "From a linked repo", source: repo)))
    }
}
