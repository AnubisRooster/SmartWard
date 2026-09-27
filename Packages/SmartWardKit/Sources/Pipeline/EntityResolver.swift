import Foundation
import SwiftData
import RetrievalKit
import KnowledgeStore

/// Maps an extracted name to a `ThemeNode` (PLAN §5.3), in order:
/// 1. a user alias (your merges and splits always win),
/// 2. an exact canonical label or automatic alias, whatever the type (types
///    from models are noisy; "LoRA" as a concept and as a technique is one node),
/// 3. embedding similarity to nodes of the same type: merge above
///    `autoMerge`, suggest for review above `suggest`, else a new node.
///
/// Names that differ in their numbers ("GPT-4" vs "GPT-4o", "Llama 3" vs
/// "Llama 3.1") are never auto-merged, however similar they embed: versions
/// are different things.
@MainActor
public final class EntityResolver {
    public static let autoMerge: Float = 0.92
    public static let suggest: Float = 0.82

    public struct Resolution {
        public let node: ThemeNode
        public let created: Bool
    }

    let context: ModelContext
    private let embedder: EmbeddingModel?
    private var byKey: [String: ThemeNode] = [:]
    private var nodesByType: [String: [ThemeNode]] = [:]
    private var vectors: [UUID: [Float]] = [:]

    public private(set) var suggestionsAdded = 0

    public init(context: ModelContext, embedder: EmbeddingModel?) throws {
        self.context = context
        self.embedder = embedder
        let nodes = try context.fetch(FetchDescriptor<ThemeNode>(sortBy: [SortDescriptor(\.createdAt)]))
        for node in nodes {
            nodesByType[node.type, default: []].append(node)
            let key = Self.key(node.canonicalLabel)
            if byKey[key] == nil { byKey[key] = node }
        }
        let aliases = try context.fetch(FetchDescriptor<EntityAlias>())
        for alias in aliases where alias.origin != "user" {
            let key = Self.key(alias.alias)
            if byKey[key] == nil, let node = alias.node { byKey[key] = node }
        }
        for alias in aliases where alias.origin == "user" {
            guard let node = alias.node else { continue }
            let key = Self.key(alias.alias)
            byKey[key] = node
        }
    }

    /// Case-, spacing-, hyphen- and underscore-insensitive label key.
    public static func key(_ label: String) -> String {
        String(ThemeNode.normalizedKey(type: "", label: label).dropFirst())
    }

    /// The version-like tokens in a label: "Llama 3.1 8B" → ["3", "1", "8b"],
    /// "GPT-4o" → ["4o"].
    static func versionTokens(in label: String) -> [String] {
        label.lowercased()
            .split(whereSeparator: { !$0.isLetter && !$0.isNumber })
            .map(String.init)
            .filter { $0.contains(where: \.isNumber) }
    }

    public func resolve(name: String, type: String) async -> Resolution {
        let key = Self.key(name)
        if let node = byKey[key] {
            return Resolution(node: node, created: false)
        }

        var suggestion: (node: ThemeNode, similarity: Float)?
        if let embedder, let vector = await embedder.provider.embed(name) {
            var best: (node: ThemeNode, similarity: Float)?
            for candidate in nodesByType[type] ?? [] {
                guard let candidateVector = await labelVector(of: candidate, embedder: embedder) else { continue }
                let similarity = CosineSimilarity.score(vector, candidateVector)
                if similarity > (best?.similarity ?? -1) { best = (candidate, similarity) }
            }
            if let best, best.similarity >= Self.suggest {
                let sameNumbers = Self.versionTokens(in: name) == Self.versionTokens(in: best.node.canonicalLabel)
                if best.similarity >= Self.autoMerge && sameNumbers {
                    addAlias(name, to: best.node)
                    return Resolution(node: best.node, created: false)
                }
                suggestion = best
            }
            let node = insertNode(name: name, type: type, vector: vector)
            if let suggestion {
                context.insert(MergeSuggestion(nodeID: node.id, candidateID: suggestion.node.id,
                                               similarity: Double(suggestion.similarity)))
                suggestionsAdded += 1
            }
            return Resolution(node: node, created: true)
        }
        return Resolution(node: insertNode(name: name, type: type, vector: nil), created: true)
    }

    /// Records `surface` as an automatic alias of `node` when it isn't
    /// already its label or an alias.
    public func addAlias(_ surface: String, to node: ThemeNode) {
        let key = Self.key(surface)
        guard !key.isEmpty, Self.key(node.canonicalLabel) != key else { return }
        if byKey[key] == nil { byKey[key] = node }
        guard !(node.aliases ?? []).contains(where: { Self.key($0.alias) == key }) else { return }
        node.aliases?.append(EntityAlias(alias: surface, origin: "auto"))
    }

    private func insertNode(name: String, type: String, vector: [Float]?) -> ThemeNode {
        let node = ThemeNode(type: type, canonicalLabel: name)
        context.insert(node)
        if let vector, let embedder {
            node.labelVector = VectorCoding.data(from: vector)
            node.labelVectorModel = embedder.id
            vectors[node.id] = vector
        }
        byKey[Self.key(name)] = node
        nodesByType[type, default: []].append(node)
        return node
    }

    /// The node's label vector, computed and stored on first use.
    private func labelVector(of node: ThemeNode, embedder: EmbeddingModel) async -> [Float]? {
        if let cached = vectors[node.id] { return cached }
        if node.labelVectorModel == embedder.id, let data = node.labelVector {
            let vector = VectorCoding.vector(from: data)
            if !vector.isEmpty {
                vectors[node.id] = vector
                return vector
            }
        }
        guard let vector = await embedder.provider.embed(node.canonicalLabel) else { return nil }
        node.labelVector = VectorCoding.data(from: vector)
        node.labelVectorModel = embedder.id
        vectors[node.id] = vector
        return vector
    }
}
