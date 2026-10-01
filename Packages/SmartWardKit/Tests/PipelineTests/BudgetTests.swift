import XCTest
import SwiftData
import BYOKLLMKit
import KnowledgeStore
@testable import Pipeline

/// NFR-9: once today's budget is spent, background extraction stays on-device.
final class BudgetTests: XCTestCase {
    private let now = Date(timeIntervalSince1970: 1_800_000_000)
    private let graph = ExtractedGraph(entities: [.init(name: "vLLM", type: "tool")])

    @MainActor
    private func seed(_ context: ModelContext, spent: Double, url: String = "https://x.example/1") throws -> (article: Article, turn: Message) {
        UsageLedger.record(provider: "openrouter", model: "m", feature: "chat", inputTokens: 1, outputTokens: 1,
                           reportedCostUSD: spent, context: context, now: now)
        let article = Article(canonicalURL: url, title: "Serving", cleanedText: "vLLM serving notes.")
        article.stage = .triaged
        context.insert(article)
        let conversation = Conversation(title: "Plan")
        context.insert(conversation)
        let turn = Message(role: "user", content: "Should we adopt vLLM?")
        turn.createdAt = now - 60
        conversation.messages?.append(turn)
        try context.save()
        return (article, turn)
    }

    @MainActor
    func testOverBudgetTurnsGoOnDeviceAndProviderOnlyWorkWaits() async throws {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        let context = container.mainContext
        let (article, turn) = try seed(context, spent: 2)

        // Apple Intelligence is on for turns, but only the provider could take the article.
        let onDevice = FakeExtractor(tier: .onDevice, graph: graph)
        let byok = FakeExtractor(tier: .byok, graph: graph, usage: LLMUsage(inputTokens: 10, outputTokens: 1))
        let runner = PipelineRunner(embedder: fakeModel, fullText: nil, strength: .off,
                                    extraction: ExtractionTiers(onDevice: onDevice, byok: byok),
                                    budget: DailyBudget(capUSD: 1), now: { self.now })
        _ = try await runner.run(context: context, until: now + 60)
        XCTAssertTrue(byok.inputs.isEmpty, "nothing goes to the provider once the budget is spent")
        XCTAssertNotNil(turn.indexedAt, "the turn fell back to on-device extraction")
        XCTAssertEqual(article.stage, .linked, "over budget, articles fall back to the device model")
        XCTAssertEqual(try context.fetchCount(FetchDescriptor<UsageRecord>()), 1)

        // With only the provider available, over-budget work waits.
        let (waiting, _) = try seed(context, spent: 0, url: "https://x.example/2")
        let byokOnly = FakeExtractor(tier: .byok, graph: graph)
        let blocked = PipelineRunner(embedder: fakeModel, fullText: nil, strength: .off,
                                     extraction: ExtractionTiers(byok: byokOnly),
                                     budget: DailyBudget(capUSD: 1), now: { self.now })
        let report = try await blocked.run(context: context, until: now + 60)
        XCTAssertTrue(byokOnly.inputs.isEmpty)
        XCTAssertEqual(waiting.stage, .embedded)
        XCTAssertGreaterThan(report.remaining, 0)
    }

    @MainActor
    func testUnderBudgetTheProviderStillExtractsTurns() async throws {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        let context = container.mainContext
        _ = try seed(context, spent: 0.1)
        let onDevice = FakeExtractor(tier: .onDevice, graph: graph)
        let byok = FakeExtractor(tier: .byok, graph: graph)
        let runner = PipelineRunner(embedder: fakeModel, fullText: nil, strength: .off,
                                    extraction: ExtractionTiers(onDevice: onDevice, byok: byok),
                                    budget: DailyBudget(capUSD: 1), now: { self.now })
        _ = try await runner.run(context: context, until: now + 60)
        XCTAssertEqual(byok.inputs.count, 2, "the conversation turn (D2) and the article go to your provider")
    }
}
