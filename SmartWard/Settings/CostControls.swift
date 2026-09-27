import Foundation
import Observation
import SwiftUI
import SwiftData
import BYOKLLMKit
import ModelCatalogKit
import KnowledgeStore
import StrategistCore

/// The daily budget (NFR-9). Stored in dollars; 0 means no cap.
enum BudgetSettings {
    static let capKey = "budget.dailyCapUSD"
    static let defaultCap = 1.0
    static let choices: [Double] = [0.25, 0.5, 1, 2, 5, 10, 20, 0]

    static var current: DailyBudget {
        let defaults = UserDefaults.standard
        let cap = defaults.object(forKey: capKey) == nil ? defaultCap : defaults.double(forKey: capKey)
        return DailyBudget(capUSD: cap > 0 ? cap : nil)
    }

    static func label(_ cap: Double) -> String {
        cap > 0 ? cap.formatted(.currency(code: "USD")) + " a day" : "No cap"
    }
}

/// The OpenRouter model catalog (ModelCatalogKit): prices for the usage
/// ledger's estimates, and candidates for model fallback (NFR-5).
@MainActor
@Observable
final class ModelCatalogController {
    static let shared = ModelCatalogController()

    nonisolated static let fallbackEnabledKey = "fallback.enabled"
    nonisolated static func fallbackModelsKey(_ provider: LLMProvider) -> String { "fallback.models.\(provider.rawValue)" }

    private(set) var catalog: [CatalogEntry] = []
    private(set) var lastRefreshed: Date?
    private(set) var isRefreshing = false
    var errorMessage: String?

    private let cache = CatalogCache()
    private let fetcher = CatalogFetcher()

    /// Loads the cached catalog, and refreshes it when it's older than 12
    /// hours (or `force`) and you have an OpenRouter key.
    func load(force: Bool = false) async {
        if catalog.isEmpty, let cached = await cache.load() {
            apply(cached.entries, refreshed: cached.lastRefreshed)
        }
        let stale = await cache.needsRefresh()
        guard force || stale,
              let key = LLMKeychainStore.shared.get(for: .openrouter), !isRefreshing else { return }
        isRefreshing = true
        defer { isRefreshing = false }
        do {
            let entries = try await fetcher.fetch(apiKey: key)
            try await cache.save(entries: entries)
            apply(entries, refreshed: Date())
            errorMessage = nil
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    private func apply(_ entries: [CatalogEntry], refreshed: Date) {
        catalog = entries
        lastRefreshed = refreshed
        var prices: [String: PriceBook.Price] = [:]
        for entry in entries where entry.pricing.prompt >= 0 && entry.pricing.completion >= 0 && !entry.id.hasSuffix(":free") {
            prices[entry.id] = PriceBook.Price(inputPerToken: entry.pricing.prompt, outputPerToken: entry.pricing.completion)
        }
        PriceBook.current = PriceBook(prices: prices)
    }

    var fallback: ModelFallback {
        let defaults = UserDefaults.standard
        let enabled = defaults.object(forKey: Self.fallbackEnabledKey) == nil || defaults.bool(forKey: Self.fallbackEnabledKey)
        var mine: [LLMProvider: [String]] = [:]
        for provider in LLMProvider.allCases {
            let list = (defaults.string(forKey: Self.fallbackModelsKey(provider)) ?? "")
                .split(separator: ",")
                .map { $0.trimmingCharacters(in: .whitespaces) }
                .filter { !$0.isEmpty }
            if !list.isEmpty { mine[provider] = list }
        }
        return ModelFallback(isEnabled: enabled, userFallbacks: mine, catalog: catalog)
    }

    /// `LLMService.shared`, retrying on fallback models when the chosen one
    /// is rate-limited or down.
    func fallbackLLM() -> FallbackLLM {
        let fallback = self.fallback
        return FallbackLLM(base: LLMService.shared) { fallback.alternatives(for: $0) }
    }
}

/// Settings → Usage & budget (FR-17, NFR-9, NFR-5).
struct UsageView: View {
    @Environment(\.modelContext) private var context
    @AppStorage(BudgetSettings.capKey) private var cap = BudgetSettings.defaultCap
    @AppStorage(ModelCatalogController.fallbackEnabledKey) private var fallbackEnabled = true
    @State private var catalog = ModelCatalogController.shared
    @State private var days = 30

    private var providersWithKeys: [LLMProvider] {
        LLMProvider.allCases.filter { LLMKeychainStore.shared.hasKey(for: $0) }
    }

    var body: some View {
        let budget = DailyBudget(capUSD: cap > 0 ? cap : nil)
        let today = (try? budget.spentToday(context: context)) ?? 0
        let start = Calendar.current.date(byAdding: .day, value: -days, to: Calendar.current.startOfDay(for: Date())) ?? Date()
        let records = (try? UsageLedger.records(since: start, context: context)) ?? []
        let total = records.reduce(0) { $0 + $1.costUSD }
        let anyEstimated = records.contains(where: \.costEstimated)
        Form {
            Section {
                LabeledContent("Spent today", value: Self.money(today, estimated: false))
                if cap > 0 {
                    ProgressView(value: min(today / cap, 1))
                        .tint(today >= cap ? .red : .accentColor)
                }
                Picker("Daily budget", selection: $cap) {
                    ForEach(BudgetSettings.choices, id: \.self) { choice in
                        Text(BudgetSettings.label(choice)).tag(choice)
                    }
                }
            } header: {
                Text("Today")
            } footer: {
                if budget.isExhausted(context: context) {
                    Text("Today's budget is used up. Background work stays on-device until midnight; chats and suggestions you start still use your provider.")
                } else {
                    Text("When today's spend reaches the budget, background work (like extracting your chats into the graph) switches to on-device until midnight.")
                }
            }

            Section {
                Picker("Period", selection: $days) {
                    Text("7 days").tag(7)
                    Text("30 days").tag(30)
                }
                .pickerStyle(.segmented)
                LabeledContent("Total", value: Self.money(total, estimated: anyEstimated))
                LabeledContent("Calls", value: records.count.formatted())
            } header: {
                Text("History")
            } footer: {
                if anyEstimated {
                    Text("≈ marks estimates: your provider didn't report a cost, so it's priced from the OpenRouter catalog, or high on purpose when the model isn't listed.")
                }
            }
            breakdown("By feature", UsageLedger.summary(records) { $0.feature.capitalized })
            breakdown("By model", UsageLedger.summary(records) { "\($0.model.isEmpty ? "Unknown" : $0.model) (\($0.provider))" })

            Section {
                Toggle("Try other models when one is busy", isOn: $fallbackEnabled)
                if fallbackEnabled {
                    ForEach(providersWithKeys) { provider in
                        FallbackModelsRow(provider: provider)
                    }
                }
                HStack {
                    Text(catalog.lastRefreshed.map { "Catalog updated \($0.formatted(.relative(presentation: .named)))" }
                         ?? "No catalog yet")
                        .foregroundStyle(.secondary)
                    Spacer()
                    if catalog.isRefreshing {
                        ProgressView()
                    } else {
                        Button("Refresh") { Task { await catalog.load(force: true) } }
                            .disabled(!LLMKeychainStore.shared.hasKey(for: .openrouter))
                    }
                }
            } header: {
                Text("Model fallback")
            } footer: {
                Text("When a model is rate-limited or down, SmartWard retries with your fallback models in order. On OpenRouter it then tries up to two catalog models that support the same features and cost no more, starting with the same maker's. \(catalog.errorMessage ?? "")")
            }
        }
        .navigationTitle("Usage & budget")
        .task { await catalog.load() }
    }

    @ViewBuilder
    private func breakdown(_ title: String, _ lines: [UsageLedger.Line]) -> some View {
        if !lines.isEmpty {
            Section(title) {
                ForEach(lines) { line in
                    VStack(alignment: .leading, spacing: 2) {
                        HStack {
                            Text(line.name).lineLimit(1)
                            Spacer()
                            Text(Self.money(line.costUSD, estimated: line.estimated)).monospacedDigit()
                        }
                        Text("\(line.calls) calls · \(line.inputTokens.formatted()) in · \(line.outputTokens.formatted()) out")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
    }

    static func money(_ value: Double, estimated: Bool) -> String {
        let text = value.formatted(.currency(code: "USD").precision(.fractionLength(value < 1 ? 4 : 2)))
        return estimated ? "≈" + text : text
    }
}

private struct FallbackModelsRow: View {
    let provider: LLMProvider
    @AppStorage private var models: String

    init(provider: LLMProvider) {
        self.provider = provider
        _models = AppStorage(wrappedValue: "", ModelCatalogController.fallbackModelsKey(provider))
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(provider.displayName).font(.subheadline)
            TextField("Fallback model IDs, comma-separated", text: $models)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .font(.callout.monospaced())
        }
    }
}
