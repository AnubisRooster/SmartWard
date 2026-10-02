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

    /// Plain text with Apple's relaxed guardrails (meant for transforming text
    /// you were given): the default ones, which apply to guided generation,
    /// turn down plenty of harmless articles as "unsafe", and every refusal
    /// used to leave an article retried forever. Text that still doesn't fit
    /// the window is tried again with its first half.
    func extract(_ text: String) async throws -> ExtractionOutput {
        do {
            return try await extract(text, limit: maxInputCharacters)
        } catch let error as LanguageModelSession.GenerationError {
            guard case .exceededContextWindowSize = error else { throw error }
            return try await extract(text, limit: maxInputCharacters / 2)
        }
    }

    private func extract(_ text: String, limit: Int) async throws -> ExtractionOutput {
        let model = SystemLanguageModel(useCase: .general, guardrails: .permissiveContentTransformations)
        let session = LanguageModelSession(model: model, instructions: ExtractionText.instructions)
        let prompt = ExtractionPrompt.user(String(text.prefix(limit)))
        var options = GenerationOptions()
        options.maximumResponseTokens = Self.maxResponseTokens
        let reply: String
        do {
            reply = try await session.respond(to: prompt, options: options).content
        } catch let error as LanguageModelSession.GenerationError {
            switch error {
            // Not this article's fault: try it again on a later run.
            case .rateLimited, .concurrentRequests, .assetsUnavailable:
                throw ExtractionBusy("Apple Intelligence is busy or limited right now: \(error.localizedDescription)")
            default:
                throw error
            }
        }
        // A refusal in words has no ENTITY lines: that's a failure, so the next extractor gets a turn.
        guard let graph = ExtractionText.parse(reply) else { throw ExtractionDeclined() }
        return ExtractionOutput(graph: graph)
    }
}

/// The on-device model answered without a usable graph.
struct ExtractionDeclined: LocalizedError {
    var errorDescription: String? { "The on-device model didn't extract anything from this article." }
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
