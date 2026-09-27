import XCTest
import SwiftData
@testable import KnowledgeStore

final class UsageLedgerTests: XCTestCase {
    private let now = Date(timeIntervalSince1970: 1_800_000_000)
    private var utc: Calendar {
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone(identifier: "UTC")!
        return calendar
    }

    func testPriceKeysMatchTheSameModelAcrossProviders() {
        XCTAssertEqual(PriceBook.key("anthropic/claude-sonnet-4.5"), "claude-sonnet-4-5")
        XCTAssertEqual(PriceBook.key("claude-sonnet-4-5-20250929"), "claude-sonnet-4-5")
        XCTAssertEqual(PriceBook.key("x-ai/grok-4"), PriceBook.key("grok-4"))
        XCTAssertNotEqual(PriceBook.key("openai/gpt-oss-20b:free"), PriceBook.key("openai/gpt-oss-20b"))
    }

    func testReportedCostWinsThenCatalogPriceThenAHighDefault() {
        let book = PriceBook(prices: ["anthropic/claude-sonnet-4.5": .init(inputPerToken: 1e-6, outputPerToken: 2e-6)])
        let reported = book.cost(model: "anything", inputTokens: 1_000, outputTokens: 100, reported: 0.01)
        XCTAssertEqual(reported.usd, 0.01)
        XCTAssertFalse(reported.estimated)

        let priced = book.cost(model: "claude-sonnet-4-5-20250929", inputTokens: 1_000, outputTokens: 100, reported: nil)
        XCTAssertEqual(priced.usd, 0.0012, accuracy: 1e-12)
        XCTAssertTrue(priced.estimated)

        let unknown = book.cost(model: "mystery-model", inputTokens: 1_000, outputTokens: 100, reported: nil)
        XCTAssertEqual(unknown.usd, 0.0045, accuracy: 1e-12, "$3 in and $15 out per million")
        XCTAssertTrue(unknown.estimated)
    }

    @MainActor
    func testLedgerTotalsAndTheDailyBudget() throws {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        let context = container.mainContext
        let prices = PriceBook()
        UsageLedger.record(provider: "openrouter", model: "a", feature: "chat", inputTokens: 100, outputTokens: 10,
                           reportedCostUSD: 0.6, context: context, prices: prices, now: now - 86_400)
        UsageLedger.record(provider: "openrouter", model: "a", feature: "chat", inputTokens: 100, outputTokens: 10,
                           reportedCostUSD: 0.5, context: context, prices: prices, now: now)
        let estimated = UsageLedger.record(provider: "anthropic", model: "b", feature: "extraction",
                                           inputTokens: 1_000, outputTokens: 100, reportedCostUSD: nil,
                                           context: context, prices: prices, now: now)
        XCTAssertTrue(estimated.costEstimated)
        XCTAssertEqual(estimated.costUSD, 0.0045, accuracy: 1e-12)

        let budget = DailyBudget(capUSD: 0.5)
        XCTAssertEqual(try budget.spentToday(context: context, now: now, calendar: utc), 0.5045, accuracy: 1e-9,
                       "yesterday doesn't count")
        XCTAssertTrue(budget.isExhausted(context: context, now: now, calendar: utc))
        XCTAssertFalse(DailyBudget(capUSD: 1).isExhausted(context: context, now: now, calendar: utc))
        XCTAssertFalse(DailyBudget(capUSD: nil).isExhausted(context: context, now: now, calendar: utc))

        let all = try UsageLedger.records(since: now - 7 * 86_400, context: context)
        let byFeature = UsageLedger.summary(all) { $0.feature }
        XCTAssertEqual(byFeature.map(\.name), ["chat", "extraction"], "most expensive first")
        XCTAssertEqual(byFeature.first?.calls, 2)
        XCTAssertEqual(byFeature.first?.costUSD ?? 0, 1.1, accuracy: 1e-9)
        XCTAssertEqual(byFeature.map(\.estimated), [false, true])
    }
}
