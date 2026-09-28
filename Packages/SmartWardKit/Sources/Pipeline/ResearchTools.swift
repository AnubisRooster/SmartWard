import Foundation
import SwiftData
import BYOKLLMKit
import KnowledgeStore
import StrategistCore

/// Every passage shown to the strategist in one turn, numbered R1, R2, ...
/// across the upfront context and later `search_corpus` calls, so ids never
/// collide and `open_article` can resolve them.
@MainActor
public final class ReferenceLedger {
    public private(set) var passages: [RetrievedPassage] = []

    public init() {}

    /// Renumbers `found` to continue this turn's sequence, skipping chunks
    /// already shown, and returns the new ones.
    @discardableResult
    public func register(_ found: [RetrievedPassage]) -> [RetrievedPassage] {
        var added: [RetrievedPassage] = []
        let shown = Set(passages.map(\.chunkID))
        for var passage in found where !shown.contains(passage.chunkID) {
            passage.id = "R\(passages.count + 1)"
            passages.append(passage)
            added.append(passage)
        }
        return added
    }

    public func passage(id: String) -> RetrievedPassage? {
        passages.first { $0.id.caseInsensitiveCompare(id) == .orderedSame }
    }
}

/// `search_corpus`: GraphRAG over the library (FR-12), read-only.
public struct SearchCorpusTool: StrategistTool {
    public typealias Search = @MainActor (String) async -> [RetrievedPassage]

    private let search: Search
    private let ledger: ReferenceLedger

    public init(ledger: ReferenceLedger, search: @escaping Search) {
        self.ledger = ledger
        self.search = search
    }

    public var definition: LLMTool {
        let query: JSONValue = ["type": "string", "description": "What to look for, in a few words."]
        let properties: JSONValue = ["query": query]
        return LLMTool(name: "search_corpus",
                       description: "Searches the user's library (articles, papers, repo docs and past conversations) by words, meaning and related themes. Returns cited passages.",
                       inputSchema: ["type": "object", "properties": properties, "required": ["query"]])
    }

    private struct Arguments: Decodable { let query: String }

    @MainActor
    public func run(arguments: JSONValue) async throws -> String {
        guard let query = try? arguments.decode(as: Arguments.self).query,
              !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            throw ProjectToolError.invalidArguments("expected {query}")
        }
        let added = ledger.register(await search(query))
        return added.isEmpty ? "Nothing new in the library for that." : ReferenceContext.render(added)
    }
}

/// `graph_neighbors`: how a theme connects to others (FR-12), read-only.
public struct GraphNeighborsTool: StrategistTool {
    private let context: ModelContext
    public var limit = 12

    public init(context: ModelContext) {
        self.context = context
    }

    public var definition: LLMTool {
        let entity: JSONValue = ["type": "string", "description": "A theme, technique, model, tool, paper, org or person."]
        let properties: JSONValue = ["entity": entity]
        return LLMTool(name: "graph_neighbors",
                       description: "Shows a theme from the user's knowledge graph: how often it comes up, and the themes it connects to with how they relate.",
                       inputSchema: ["type": "object", "properties": properties, "required": ["entity"]])
    }

    private struct Arguments: Decodable { let entity: String }

    @MainActor
    public func run(arguments: JSONValue) async throws -> String {
        guard let name = try? arguments.decode(as: Arguments.self).entity else {
            throw ProjectToolError.invalidArguments("expected {entity}")
        }
        guard let node = try Self.theme(named: name, context: context) else {
            return "No theme called \"\(name)\" in the user's library yet."
        }
        var connections: [String: (node: ThemeNode, types: [String: Int])] = [:]
        let nodeID = node.id
        let edges = try context.fetch(FetchDescriptor<ThemeEdge>(predicate: #Predicate {
            $0.sourceNodeID == nodeID || $0.targetNodeID == nodeID
        }))
        // Only the neighbors, not every theme.
        let neighborIDs = Array(Set(edges.map { $0.sourceNodeID == nodeID ? $0.targetNodeID : $0.sourceNodeID }))
        var byID: [UUID: ThemeNode] = [:]
        for other in try context.fetch(FetchDescriptor<ThemeNode>(predicate: #Predicate { neighborIDs.contains($0.id) })) {
            byID[other.id] = other
        }
        for edge in edges {
            let outgoing = edge.sourceNodeID == nodeID
            guard let other = byID[outgoing ? edge.targetNodeID : edge.sourceNodeID] else { continue }
            let label = outgoing ? edge.type : "\(edge.type) (from)"
            var entry = connections[other.canonicalLabel] ?? (node: other, types: [:])
            entry.types[label, default: 0] += 1
            connections[other.canonicalLabel] = entry
        }

        let mentions = node.mentions?.count ?? 0
        let strength = ThemeStrength.score(of: node)
        var lines = ["\(node.canonicalLabel) (\(node.type)): mentioned \(mentions) times, current strength \(String(format: "%.1f", strength))."]
        let aliases = (node.aliases ?? []).map(\.alias)
        if !aliases.isEmpty { lines.append("Also called: \(aliases.prefix(6).joined(separator: ", ")).") }
        if connections.isEmpty {
            lines.append("No connections recorded yet.")
        } else {
            lines.append("Connections (evidence count):")
            let sorted = connections.values.sorted {
                $0.types.values.reduce(0, +) > $1.types.values.reduce(0, +)
            }
            for entry in sorted.prefix(limit) {
                let relations = entry.types.sorted { $0.value > $1.value }
                    .map { "\($0.key) ×\($0.value)" }
                    .joined(separator: ", ")
                lines.append("- \(entry.node.canonicalLabel) (\(entry.node.type)): \(relations)")
            }
        }
        return lines.joined(separator: "\n")
    }
}

extension GraphNeighborsTool {
    /// The theme whose label or alias is `name`: labels through the stored
    /// "type:key" index, then aliases.
    @MainActor
    static func theme(named name: String, context: ModelContext) throws -> ThemeNode? {
        let key = EntityResolver.key(name)
        guard !key.isEmpty else { return nil }
        let candidates = ExtractedGraph.entityTypes.map { "\($0):\(key)" }
        var byLabel = FetchDescriptor<ThemeNode>(predicate: #Predicate { candidates.contains($0.normalizedKey) },
                                                 sortBy: [SortDescriptor(\.createdAt)])
        byLabel.fetchLimit = 1
        if let node = try context.fetch(byLabel).first { return node }
        return try context.fetch(FetchDescriptor<EntityAlias>())
            .first { EntityResolver.key($0.alias) == key && $0.node != nil }?
            .node
    }
}

/// `open_article`: one library item in full (FR-12), read-only. Private
/// (local-only) documents are refused (D5).
public struct OpenArticleTool: StrategistTool {
    private let ledger: ReferenceLedger
    private let context: ModelContext
    public var maxCharacters = 8_000

    public init(ledger: ReferenceLedger, context: ModelContext) {
        self.ledger = ledger
        self.context = context
    }

    public var definition: LLMTool {
        let id: JSONValue = ["type": "string", "description": "A reference id such as R2."]
        let properties: JSONValue = ["id": id]
        return LLMTool(name: "open_article",
                       description: "Reads a library item cited as a reference (by its id, like R2) in full.",
                       inputSchema: ["type": "object", "properties": properties, "required": ["id"]])
    }

    private struct Arguments: Decodable { let id: String }

    @MainActor
    public func run(arguments: JSONValue) async throws -> String {
        guard let id = try? arguments.decode(as: Arguments.self).id else {
            throw ProjectToolError.invalidArguments("expected {id}")
        }
        guard let passage = ledger.passage(id: id) else {
            return "No reference \(id) in this conversation turn."
        }
        let text: String
        if let articleID = passage.articleID {
            guard let article = try context.fetch(FetchDescriptor<Article>(predicate: #Predicate { $0.id == articleID })).first else {
                return "Reference \(id) is no longer in the library."
            }
            guard !article.localOnly, (article.chunks ?? []).allSatisfy(ContextPolicy.mayLeaveDevice) else {
                return "Reference \(id) is private to this device and can't be shared."
            }
            text = article.cleanedText.isEmpty ? article.summary : article.cleanedText
        } else if let messageID = passage.messageID {
            guard let message = try context.fetch(FetchDescriptor<Message>(predicate: #Predicate { $0.id == messageID })).first else {
                return "Reference \(id) is no longer in the library."
            }
            guard ContextPolicy.messageMayLeaveDevice(message) else {
                return "Reference \(id) is private to this device and can't be shared."
            }
            text = message.content
        } else {
            text = passage.text
        }
        var full = passage
        full.text = text.count > maxCharacters ? String(text.prefix(maxCharacters)) + "…" : text
        return ReferenceContext.render([full])
    }
}
