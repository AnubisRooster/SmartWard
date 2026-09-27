import Foundation
import SwiftData

/// Per-token prices by model, for providers that don't report what a call
/// cost (only OpenRouter does). Filled from the OpenRouter catalog.
public struct PriceBook: Equatable, Sendable {
    public struct Price: Equatable, Sendable {
        public var inputPerToken: Double
        public var outputPerToken: Double

        public init(inputPerToken: Double, outputPerToken: Double) {
            self.inputPerToken = inputPerToken
            self.outputPerToken = outputPerToken
        }
    }

    /// Used when a model's price is unknown: high on purpose ($3 in, $15 out
    /// per million tokens), so an estimate errs toward staying under budget.
    public static let conservative = Price(inputPerToken: 3e-6, outputPerToken: 15e-6)

    /// The prices the ledger uses. The app replaces it when the catalog loads.
    @MainActor public static var current = PriceBook()

    public private(set) var prices: [String: Price] = [:]

    public init(prices: [String: Price] = [:]) {
        for (model, price) in prices {
            let key = Self.key(model)
            if self.prices[key] == nil { self.prices[key] = price }
        }
    }

    /// One key for the same model across providers: "anthropic/claude-sonnet-4.5"
    /// and "claude-sonnet-4-5-20250929" both become "claude-sonnet-4-5".
    public static func key(_ model: String) -> String {
        var key = model.lowercased().trimmingCharacters(in: .whitespaces)
        if let slash = key.lastIndex(of: "/") { key = String(key[key.index(after: slash)...]) }
        if let date = key.range(of: #"-20\d{6}$"#, options: .regularExpression) { key.removeSubrange(date) }
        return key.replacingOccurrences(of: ".", with: "-")
    }

    public func price(for model: String) -> Price? {
        prices[Self.key(model)]
    }

    /// The reported cost when there is one, else an estimate.
    public func cost(model: String, inputTokens: Int, outputTokens: Int,
                     reported: Double?) -> (usd: Double, estimated: Bool) {
        if let reported { return (reported, false) }
        let price = price(for: model) ?? Self.conservative
        return (Double(inputTokens) * price.inputPerToken + Double(outputTokens) * price.outputPerToken, true)
    }
}

/// Every provider call is recorded here (FR-17), and the daily budget is
/// checked against it (NFR-9).
@MainActor
public enum UsageLedger {

    @discardableResult
    public static func record(provider: String, model: String, feature: String,
                              inputTokens: Int, outputTokens: Int, reportedCostUSD: Double?,
                              context: ModelContext, prices: PriceBook? = nil,
                              now: Date = Date()) -> UsageRecord {
        // `PriceBook.current` is main-actor state, so it can't be a default argument.
        let book: PriceBook
        if let prices {
            book = prices
        } else {
            book = PriceBook.current
        }
        let cost = book.cost(model: model, inputTokens: inputTokens, outputTokens: outputTokens,
                               reported: reportedCostUSD)
        let record = UsageRecord(provider: provider, model: model, feature: feature,
                                 inputTokens: inputTokens, outputTokens: outputTokens, costUSD: cost.usd)
        record.costEstimated = cost.estimated
        record.createdAt = now
        context.insert(record)
        return record
    }

    public static func records(since start: Date, context: ModelContext) throws -> [UsageRecord] {
        try context.fetch(FetchDescriptor<UsageRecord>(predicate: #Predicate { $0.createdAt >= start }))
    }

    /// What was spent from `start` on, in USD.
    public static func spent(since start: Date, context: ModelContext) throws -> Double {
        try records(since: start, context: context).reduce(0) { $0 + $1.costUSD }
    }

    public struct Line: Equatable, Identifiable, Sendable {
        public var name: String
        public var calls: Int
        public var inputTokens: Int
        public var outputTokens: Int
        public var costUSD: Double
        /// Some of the cost is estimated.
        public var estimated: Bool

        public var id: String { name }
    }

    /// Totals grouped by `key` (for example feature, or provider and model),
    /// most expensive first.
    public static func summary(_ records: [UsageRecord], by key: (UsageRecord) -> String) -> [Line] {
        var lines: [String: Line] = [:]
        for record in records {
            let name = key(record)
            var line = lines[name] ?? Line(name: name, calls: 0, inputTokens: 0, outputTokens: 0, costUSD: 0, estimated: false)
            line.calls += 1
            line.inputTokens += record.inputTokens
            line.outputTokens += record.outputTokens
            line.costUSD += record.costUSD
            line.estimated = line.estimated || record.costEstimated
            lines[name] = line
        }
        return lines.values.sorted { $0.costUSD != $1.costUSD ? $0.costUSD > $1.costUSD : $0.name < $1.name }
    }
}

/// A cap on what your provider may be paid per day (NFR-9). Once today's
/// spend reaches it, background work stays on-device until midnight; things
/// you start yourself (chat, brief suggestions) still run.
public struct DailyBudget: Equatable, Sendable {
    /// `nil` means no cap.
    public var capUSD: Double?

    public init(capUSD: Double?) {
        self.capUSD = capUSD
    }

    @MainActor
    public func spentToday(context: ModelContext, now: Date = Date(), calendar: Calendar = .current) throws -> Double {
        try UsageLedger.spent(since: calendar.startOfDay(for: now), context: context)
    }

    /// Whether background work must stay on-device. If spend can't be read,
    /// it errs toward on-device.
    @MainActor
    public func isExhausted(context: ModelContext, now: Date = Date(), calendar: Calendar = .current) -> Bool {
        guard let capUSD else { return false }
        guard let spent = try? spentToday(context: context, now: now, calendar: calendar) else { return true }
        return spent >= capUSD
    }
}
