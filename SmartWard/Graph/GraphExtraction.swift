import Foundation
import SwiftUI
import SwiftData
import FoundationModels
import BYOKLLMKit
import KnowledgeStore
import Pipeline

/// T1 extraction (PLAN §5.3): Apple Foundation Models with guided
/// generation, on-device. The default for articles, and the only tier that
/// ever sees private-repo content or off-the-record chats.
struct FoundationModelsEntityExtractor: EntityExtracting {
    let tier = ExtractionTier.onDevice
    /// Leaves room in the 4,096-token window for instructions and output.
    let maxInputCharacters = 4_000

    @Generable
    struct GeneratedEntity {
        @Guide(description: "The entity's most common name")
        var name: String
        @Guide(description: "What kind of entity it is",
               .anyOf(["concept", "technique", "model", "paper", "org", "person", "tool", "dataset"]))
        var type: String
    }

    @Generable
    struct GeneratedRelation {
        @Guide(description: "Name of an entity from the entities list")
        var source: String
        @Guide(description: "Name of another entity from the entities list")
        var target: String
        @Guide(description: "How the source relates to the target",
               .anyOf(["RELATES_TO", "BUILDS_ON", "IMPROVES_ON", "COMPETES_WITH", "USES",
                       "EVALUATED_ON", "AUTHORED_BY", "RELEASED_BY"]))
        var type: String
    }

    @Generable
    struct GeneratedGraph {
        @Guide(description: "The specific things the document is about", .maximumCount(15))
        var entities: [GeneratedEntity]
        @Guide(description: "Relations the document states between listed entities", .maximumCount(15))
        var relations: [GeneratedRelation]
    }

    func extract(_ text: String) async throws -> ExtractionOutput {
        let session = LanguageModelSession(instructions: ExtractionPrompt.instructions)
        let prompt = ExtractionPrompt.user(String(text.prefix(maxInputCharacters)))
        let generated = try await session.respond(to: prompt, generating: GeneratedGraph.self).content
        let graph = ExtractedGraph(
            entities: generated.entities.map { ExtractedGraph.Entity(name: $0.name, type: $0.type) },
            relations: generated.relations.map { ExtractedGraph.Relation(source: $0.source, target: $0.target, type: $0.type) })
        return ExtractionOutput(graph: graph.sanitized())
    }
}

/// Which provider and model do T2 extraction (D2).
enum ExtractionSettings {
    static let useProviderKey = "extraction.useProvider"
    static let providerKey = "extraction.provider"
    static let modelKey = "extraction.model"

    /// Your provider may extract conversations and public repo docs unless
    /// you turned it off; defaults to the provider and model you chat with.
    static func byokExtractor() -> BYOKExtractor? {
        let defaults = UserDefaults.standard
        if defaults.object(forKey: useProviderKey) != nil, !defaults.bool(forKey: useProviderKey) { return nil }
        let providerRaw = defaults.string(forKey: providerKey) ?? defaults.string(forKey: "chat.lastProvider") ?? ""
        guard let provider = LLMProvider(rawValue: providerRaw), LLMKeychainStore.shared.hasKey(for: provider) else {
            return nil
        }
        let chosen = defaults.string(forKey: modelKey)?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let fallback = defaults.string(forKey: "chat.lastModel") ?? provider.exampleModelID
        return BYOKExtractor(client: LLMService.shared, provider: provider, model: chosen.isEmpty ? fallback : chosen)
    }

    /// The extractors available right now.
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
            Text("Articles are read on-device with Apple Intelligence. Chats and public repo docs go to your provider for richer themes; a cheap model is plenty. Off-the-record chats and private repos are never sent.")
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
