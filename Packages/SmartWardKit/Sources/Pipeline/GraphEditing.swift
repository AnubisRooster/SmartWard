import Foundation
import SwiftData
import KnowledgeStore

/// Your corrections to entity resolution (PLAN §5.3, FR-7). Both write
/// `EntityAlias(origin: "user")`, which the resolver always honors, so
/// extraction never undoes them.
@MainActor
public enum GraphEditing {

    /// Merges `node` into `target`: its mentions, edges, aliases and project
    /// pins move over, its label becomes a user alias of `target`, and it is
    /// deleted. Edges that would become self-loops are dropped.
    public static func merge(_ node: ThemeNode, into target: ThemeNode, context: ModelContext) throws {
        guard node.id != target.id else { return }
        let nodeID = node.id
        let targetID = target.id

        let moved = node.mentions ?? []
        for mention in moved {
            mention.node = target
        }
        // Detach before deleting so the cascade can't take the moved mentions.
        node.mentions = []
        let edges = try context.fetch(FetchDescriptor<ThemeEdge>(predicate: #Predicate {
            $0.sourceNodeID == nodeID || $0.targetNodeID == nodeID
        }))
        for edge in edges {
            if edge.sourceNodeID == nodeID { edge.sourceNodeID = targetID }
            if edge.targetNodeID == nodeID { edge.targetNodeID = targetID }
            if edge.sourceNodeID == edge.targetNodeID { context.delete(edge) }
        }

        let existing = Set((target.aliases ?? []).map { EntityResolver.key($0.alias) } + [EntityResolver.key(target.canonicalLabel)])
        let incoming = [node.canonicalLabel] + (node.aliases ?? []).map(\.alias)
        var added = Set<String>()
        for alias in incoming {
            let key = EntityResolver.key(alias)
            guard !existing.contains(key), added.insert(key).inserted else { continue }
            target.aliases?.append(EntityAlias(alias: alias, origin: "user"))
        }

        for project in node.pinnedByProjects ?? [] where !(project.pinnedNodes ?? []).contains(where: { $0.id == targetID }) {
            project.pinnedNodes?.append(target)
        }

        for suggestion in try suggestions(involving: nodeID, context: context) {
            let pair = Set([suggestion.nodeID, suggestion.candidateID])
            if pair == Set([nodeID, targetID]) {
                suggestion.status = "merged"
            } else {
                context.delete(suggestion)
            }
        }
        context.delete(node)
    }

    /// Splits `alias` off `node` into a node of its own, with the alias as
    /// a user alias so it stays split. Mentions whose text names the alias
    /// but not the original label move to the new node.
    @discardableResult
    public static func split(_ alias: EntityAlias, from node: ThemeNode, context: ModelContext) -> ThemeNode {
        let label = alias.alias
        let fresh = ThemeNode(type: node.type, canonicalLabel: label)
        context.insert(fresh)
        fresh.aliases?.append(EntityAlias(alias: label, origin: "user"))
        context.delete(alias)

        for mention in node.mentions ?? [] {
            guard let text = mention.chunk?.text, text.localizedCaseInsensitiveContains(label) else { continue }
            // "gpt-4o mini" contains "gpt-4o": look for the original label
            // only in what's left once the alias is taken out.
            let remainder = text.replacingOccurrences(of: label, with: " ", options: .caseInsensitive)
            guard !remainder.localizedCaseInsensitiveContains(node.canonicalLabel) else { continue }
            mention.node = fresh
        }
        return fresh
    }

    /// "Keep separate": the resolver stops asking about this pair.
    public static func dismiss(_ suggestion: MergeSuggestion) {
        suggestion.status = "dismissed"
    }

    static func suggestions(involving id: UUID, context: ModelContext) throws -> [MergeSuggestion] {
        try context.fetch(FetchDescriptor<MergeSuggestion>(predicate: #Predicate {
            $0.nodeID == id || $0.candidateID == id
        }))
    }
}

/// A drawable slice of the graph (FR-15): nodes with decayed strength, edges
/// weighted by evidence, limited to a scope and the strongest nodes.
public struct GraphSnapshot: Equatable, Sendable {
    public enum Scope: Equatable, Sendable {
        case all
        /// Themes pinned to the project or mentioned in its conversations or linked repos.
        case project(UUID)
        /// Themes mentioned in one source's articles.
        case source(UUID)
        /// Themes mentioned in the last `days` days.
        case recent(days: Int)
    }

    public struct Node: Equatable, Sendable, Identifiable {
        public var id: UUID
        public var label: String
        public var type: String
        public var strength: Double
        public var mentions: Int

        public init(id: UUID, label: String, type: String, strength: Double, mentions: Int) {
            self.id = id
            self.label = label
            self.type = type
            self.strength = strength
            self.mentions = mentions
        }
    }

    public struct Edge: Equatable, Sendable {
        public var source: UUID
        public var target: UUID
        /// The most common relation type between the two.
        public var type: String
        public var weight: Int

        public init(source: UUID, target: UUID, type: String, weight: Int) {
            self.source = source
            self.target = target
            self.type = type
            self.weight = weight
        }
    }

    public var nodes: [Node]
    public var edges: [Edge]

    public init(nodes: [Node], edges: [Edge]) {
        self.nodes = nodes
        self.edges = edges
    }

    /// Below this decayed strength a theme is dormant: hidden unless asked for.
    public static let dormantStrength = 0.25

    @MainActor
    public static func build(context: ModelContext, scope: Scope = .all, limit: Int = 80,
                             includeDormant: Bool = false, now: Date = Date()) throws -> GraphSnapshot {
        let allNodes = try context.fetch(FetchDescriptor<ThemeNode>())
        let inScope = try scopedIDs(scope, nodes: allNodes, context: context, now: now)

        var nodes: [Node] = []
        for node in allNodes where inScope?.contains(node.id) ?? true {
            let strength = ThemeStrength.score(of: node, now: now)
            let count = node.mentions?.count ?? 0
            guard count > 0, includeDormant || strength >= dormantStrength else { continue }
            nodes.append(Node(id: node.id, label: node.canonicalLabel, type: node.type, strength: strength, mentions: count))
        }
        nodes.sort { $0.strength != $1.strength ? $0.strength > $1.strength : $0.label < $1.label }
        nodes = Array(nodes.prefix(limit))
        let kept = Set(nodes.map(\.id))

        var grouped: [String: (source: UUID, target: UUID, types: [String: Int])] = [:]
        for edge in try context.fetch(FetchDescriptor<ThemeEdge>())
        where kept.contains(edge.sourceNodeID) && kept.contains(edge.targetNodeID) && edge.sourceNodeID != edge.targetNodeID {
            let (a, b) = edge.sourceNodeID.uuidString < edge.targetNodeID.uuidString
                ? (edge.sourceNodeID, edge.targetNodeID) : (edge.targetNodeID, edge.sourceNodeID)
            let key = "\(a.uuidString)|\(b.uuidString)"
            var entry = grouped[key] ?? (source: edge.sourceNodeID, target: edge.targetNodeID, types: [:])
            entry.types[edge.type, default: 0] += 1
            grouped[key] = entry
        }
        var edges: [Edge] = []
        for entry in grouped.values {
            let weight = entry.types.values.reduce(0, +)
            let type = entry.types.max { $0.value != $1.value ? $0.value < $1.value : $0.key > $1.key }?.key ?? "RELATES_TO"
            edges.append(Edge(source: entry.source, target: entry.target, type: type, weight: weight))
        }
        edges.sort { $0.weight != $1.weight ? $0.weight > $1.weight : $0.source.uuidString < $1.source.uuidString }
        return GraphSnapshot(nodes: nodes, edges: edges)
    }

    /// `nil` means everything.
    @MainActor
    static func scopedIDs(_ scope: Scope, nodes: [ThemeNode], context: ModelContext, now: Date) throws -> Set<UUID>? {
        switch scope {
        case .all:
            return nil
        case .recent(let days):
            let cutoff = now.addingTimeInterval(-Double(days) * 86_400)
            return Set(nodes.filter { ($0.mentions ?? []).contains { $0.createdAt >= cutoff } }.map(\.id))
        case .source(let sourceID):
            return Set(nodes.filter { node in
                (node.mentions ?? []).contains { $0.chunk?.article?.source?.id == sourceID }
            }.map(\.id))
        case .project(let projectID):
            guard let project = try context.fetch(FetchDescriptor<Project>(predicate: #Predicate { $0.id == projectID })).first else {
                return []
            }
            var ids = Set((project.pinnedNodes ?? []).map(\.id))
            let conversationIDs = Set((project.conversations ?? []).map(\.id))
            let sourceIDs = Set((project.links ?? []).compactMap(\.sourceID))
            for node in nodes {
                let belongs = (node.mentions ?? []).contains { mention in
                    if let conversation = mention.chunk?.message?.conversation?.id, conversationIDs.contains(conversation) {
                        return true
                    }
                    if let source = mention.chunk?.article?.source?.id, sourceIDs.contains(source) { return true }
                    return false
                }
                if belongs { ids.insert(node.id) }
            }
            return ids
        }
    }
}

/// Deterministic force-directed layout (Fruchterman–Reingold) in a unit
/// square, for drawing a `GraphSnapshot`.
public enum ForceLayout {
    public struct Point: Equatable, Sendable {
        public var x: Double
        public var y: Double
    }

    public static func layout(_ snapshot: GraphSnapshot, iterations: Int = 200) -> [UUID: Point] {
        let count = snapshot.nodes.count
        guard count > 0 else { return [:] }
        if count == 1 { return [snapshot.nodes[0].id: Point(x: 0.5, y: 0.5)] }

        // Start on a circle, strongest first, so the result is stable.
        var positions = snapshot.nodes.enumerated().map { index, _ in
            let angle = 2 * Double.pi * Double(index) / Double(count)
            return Point(x: 0.5 + 0.35 * cos(angle), y: 0.5 + 0.35 * sin(angle))
        }
        var indexOf: [UUID: Int] = [:]
        for (index, node) in snapshot.nodes.enumerated() { indexOf[node.id] = index }
        let links: [(Int, Int, Double)] = snapshot.edges.compactMap { edge in
            guard let a = indexOf[edge.source], let b = indexOf[edge.target] else { return nil }
            return (a, b, Double(edge.weight))
        }

        let k = sqrt(1.0 / Double(count))
        var temperature = 0.1
        for _ in 0..<iterations {
            var displacement = [Point](repeating: Point(x: 0, y: 0), count: count)
            for i in 0..<count {
                for j in (i + 1)..<count {
                    var dx = positions[i].x - positions[j].x
                    var dy = positions[i].y - positions[j].y
                    var distance = sqrt(dx * dx + dy * dy)
                    if distance < 1e-6 {
                        dx = 1e-3 * Double(i - j)
                        dy = 1e-3
                        distance = sqrt(dx * dx + dy * dy)
                    }
                    let force = k * k / distance
                    displacement[i].x += dx / distance * force
                    displacement[i].y += dy / distance * force
                    displacement[j].x -= dx / distance * force
                    displacement[j].y -= dy / distance * force
                }
            }
            for (a, b, weight) in links {
                let dx = positions[a].x - positions[b].x
                let dy = positions[a].y - positions[b].y
                let distance = max(sqrt(dx * dx + dy * dy), 1e-6)
                let force = distance * distance / k * min(1 + log(weight), 3)
                displacement[a].x -= dx / distance * force
                displacement[a].y -= dy / distance * force
                displacement[b].x += dx / distance * force
                displacement[b].y += dy / distance * force
            }
            for i in 0..<count {
                let length = max(sqrt(displacement[i].x * displacement[i].x + displacement[i].y * displacement[i].y), 1e-9)
                let step = min(length, temperature)
                positions[i].x = min(0.95, max(0.05, positions[i].x + displacement[i].x / length * step))
                positions[i].y = min(0.95, max(0.05, positions[i].y + displacement[i].y / length * step))
            }
            temperature = max(0.005, temperature * 0.97)
        }

        var result: [UUID: Point] = [:]
        for (index, node) in snapshot.nodes.enumerated() { result[node.id] = positions[index] }
        return result
    }
}
