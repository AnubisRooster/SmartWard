import Foundation
import SwiftUI
import SwiftData
import FoundationModels
import BYOKLLMKit
import KnowledgeStore
import Pipeline
import StrategistCore

/// T1 extraction (PLAN §5.3): Apple Foundation Models, on-device. The
/// fallback for articles when your provider can't take them, and the only
/// tier that ever sees private-repo content or off-the-record chats.
struct FoundationModelsEntityExtractor: EntityExtracting {
    let tier = ExtractionTier.onDevice
    /// Leaves room in the 4,096-token window for instructions and the answer,
    /// even for dense text (code, tables, links) that takes more tokens per character.
    let maxInputCharacters = 3_000
    /// The list asked for fits well within this; without a limit the model
    /// could keep listing until it ran out of room and failed.
    static let maxResponseTokens = 700

    /// Plain text first, with Apple's relaxed guardrails (meant for
    /// transforming text you were given): the default ones, which apply to
    /// guided generation, turn down plenty of harmless articles as "unsafe".
    /// When the answer can't be read, guided generation, whose shape is
    /// guaranteed, gets a turn. Text that doesn't fit the window is tried
    /// again with its first half.
    func extract(_ text: String) async throws -> ExtractionOutput {
        do {
            return try await extract(text, limit: maxInputCharacters)
        } catch let error as LanguageModelSession.GenerationError {
            if let busy = Self.busy(error) { throw busy }
            guard case .exceededContextWindowSize = error else { throw error }
            return try await extract(text, limit: maxInputCharacters / 2)
        }
    }

    private func extract(_ text: String, limit: Int) async throws -> ExtractionOutput {
        let prompt = ExtractionPrompt.user(String(text.prefix(limit)))
        let model = SystemLanguageModel(useCase: .general, guardrails: .permissiveContentTransformations)
        let session = LanguageModelSession(model: model, instructions: ExtractionText.instructions)
        var options = GenerationOptions()
        options.maximumResponseTokens = Self.maxResponseTokens
        let reply = try await session.respond(to: prompt, options: options).content
        if let graph = ExtractionText.parse(reply) { return ExtractionOutput(graph: graph) }

        // The answer had no lines that could be read (or was a refusal in words).
        let shape = ExtractionText.shape(of: reply)
        let guided = LanguageModelSession(instructions: ExtractionPrompt.instructions)
        var guidedOptions = GenerationOptions()
        guidedOptions.maximumResponseTokens = Self.maxResponseTokens + 300
        do {
            let graph = try await guided.respond(to: prompt, generating: GuidedGraph.self, options: guidedOptions)
                .content.graph.sanitized()
            guard !graph.entities.isEmpty else { throw ExtractionDeclined(shape: shape, guided: "no entities") }
            return ExtractionOutput(graph: graph)
        } catch let error as LanguageModelSession.GenerationError {
            if let busy = Self.busy(error) { throw busy }
            throw ExtractionDeclined(shape: shape, guided: Self.reason(error))
        }
    }

    /// Not this article's fault: try it again on a later run.
    private static func busy(_ error: LanguageModelSession.GenerationError) -> ExtractionBusy? {
        switch error {
        case .rateLimited, .concurrentRequests, .assetsUnavailable:
            return ExtractionBusy("Apple Intelligence is busy or limited right now: \(error.localizedDescription)")
        default:
            return nil
        }
    }

    private static func reason(_ error: LanguageModelSession.GenerationError) -> String {
        switch error {
        case .guardrailViolation: return "turned down by Apple's safety guardrails"
        case .exceededContextWindowSize: return "too long"
        case .decodingFailure: return "couldn't be decoded"
        default: return error.localizedDescription
        }
    }
}

/// The graph's shape for guided generation: the model can only answer in it.
@Generable
struct GuidedGraph {
    @Generable
    struct Entity {
        @Guide(description: "The entity's most common name")
        var name: String
        @Guide(.anyOf(ExtractedGraph.entityTypes))
        var type: String
    }

    @Generable
    struct Relation {
        @Guide(description: "The name of a listed entity")
        var source: String
        @Guide(.anyOf(ExtractedGraph.relationTypes))
        var type: String
        @Guide(description: "The name of another listed entity")
        var target: String
    }

    @Guide(description: "The specific things the document is about", .maximumCount(15))
    var entities: [Entity]
    @Guide(description: "Relations the document states between listed entities", .maximumCount(15))
    var relations: [Relation]

    var graph: ExtractedGraph {
        ExtractedGraph(entities: entities.map { .init(name: $0.name, type: $0.type) },
                       relations: relations.map { .init(source: $0.source, target: $0.target, type: $0.type) })
    }
}

/// The on-device model answered without a usable graph, either way.
struct ExtractionDeclined: LocalizedError {
    /// What the plain-text answer looked like (`ExtractionText.shape`).
    var shape: String
    /// Why guided generation didn't help.
    var guided: String

    var errorDescription: String? {
        "The on-device model didn't extract anything (its answer: \(shape); structured retry: \(guided))."
    }
}

/// Which provider and model do T2 extraction (D2).
enum ExtractionSettings {
    static let useProviderKey = "extraction.useProvider"
    static let providerKey = "extraction.provider"
    static let modelKey = "extraction.model"

    /// The provider and model for background work (extraction and digest
    /// summaries), unless you turned your provider off for it; defaults to
    /// the provider and model you chat with.
    static func byokSettings() -> (provider: LLMProvider, model: String)? {
        let defaults = UserDefaults.standard
        if defaults.object(forKey: useProviderKey) != nil, !defaults.bool(forKey: useProviderKey) { return nil }
        let providerRaw = defaults.string(forKey: providerKey) ?? defaults.string(forKey: "chat.lastProvider") ?? ""
        guard let provider = LLMProvider(rawValue: providerRaw), LLMKeychainStore.shared.hasKey(for: provider) else {
            return nil
        }
        let chosen = defaults.string(forKey: modelKey)?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let fallback = defaults.string(forKey: "chat.lastModel") ?? provider.exampleModelID
        return (provider, chosen.isEmpty ? fallback : chosen)
    }

    /// Your provider may extract conversations and public repo docs (D2).
    @MainActor
    static func byokExtractor() -> BYOKExtractor? {
        guard let settings = byokSettings() else { return nil }
        return BYOKExtractor(client: ModelCatalogController.shared.fallbackLLM(), provider: settings.provider,
                             model: settings.model)
    }

    /// The extractors available right now.
    @MainActor
    static func tiers() -> ExtractionTiers? {
        var tiers = ExtractionTiers()
        if SystemLanguageModel.default.isAvailable {
            tiers.onDevice = FoundationModelsEntityExtractor()
        }
        tiers.byok = byokExtractor()
        return tiers.onDevice == nil && tiers.byok == nil ? nil : tiers
    }
}

/// Settings → Knowledge graph.
struct KnowledgeGraphSettingsSection: View {
    @AppStorage(ExtractionSettings.useProviderKey) private var useProvider = true
    @AppStorage(ExtractionSettings.providerKey) private var providerRaw = ""
    @AppStorage(ExtractionSettings.modelKey) private var model = ""

    private var providersWithKeys: [LLMProvider] {
        LLMProvider.allCases.filter { LLMKeychainStore.shared.hasKey(for: $0) }
    }

    var body: some View {
        Section {
            Toggle("Use my provider for chats and repo docs", isOn: $useProvider)
            if useProvider {
                Picker("Provider", selection: $providerRaw) {
                    Text("Same as chat").tag("")
                    ForEach(providersWithKeys) { provider in
                        Text(provider.displayName).tag(provider.rawValue)
                    }
                }
                TextField("Model (blank: same as chat)", text: $model)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
            }
        } header: {
            Text("Knowledge graph")
        } footer: {
            Text("Articles, chats and public repo docs are added to the knowledge graph by your provider (one call per article, counted in Usage and the daily budget); a cheap model is plenty. When the provider fails or today\u{2019}s budget is spent, Apple Intelligence on this device does it instead; after a rate limit, a slow answer or a few failures in a row, the provider is skipped for 10 minutes. Free models are often rate-limited or don\u{2019}t answer in the format needed. An article that fails twice is left out of the graph but stays searchable. Off-the-record chats and private repos are never sent.")
        }
    }
}

/// The themes an article was linked to, as chips.
struct ThemesRow: View {
    let article: Article

    private var nodes: [ThemeNode] {
        var seen = Set<UUID>()
        var result: [ThemeNode] = []
        for chunk in (article.chunks ?? []).sorted(by: { $0.ordinal < $1.ordinal }) {
            for mention in chunk.mentions ?? [] {
                guard let node = mention.node, seen.insert(node.id).inserted else { continue }
                result.append(node)
            }
        }
        return result
    }

    var body: some View {
        let nodes = self.nodes
        if !nodes.isEmpty {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 6) {
                    ForEach(nodes) { node in
                        Label(node.canonicalLabel, systemImage: ThemeStyle.systemImage(for: node.type))
                            .font(.caption)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(ThemeStyle.color(for: node.type).opacity(0.15), in: Capsule())
                    }
                }
            }
        }
    }
}

enum ThemeStyle {
    static func systemImage(for type: String) -> String {
        switch type {
        case "technique": return "wand.and.stars"
        case "model": return "cpu"
        case "paper": return "doc.text"
        case "org": return "building.2"
        case "person": return "person"
        case "tool": return "wrench.and.screwdriver"
        case "dataset": return "tablecells"
        default: return "lightbulb"
        }
    }

    static func color(for type: String) -> Color {
        switch type {
        case "technique": return .purple
        case "model": return .blue
        case "paper": return .orange
        case "org": return .teal
        case "person": return .pink
        case "tool": return .green
        case "dataset": return .brown
        default: return .gray
        }
    }
}
