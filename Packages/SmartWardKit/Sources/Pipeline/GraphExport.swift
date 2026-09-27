import Foundation
import GraphKit
import KnowledgeStore

/// The knowledge graph as GraphML for Gephi and similar tools (NFR-3),
/// written by OnDeviceKit's GraphKit (PLAN B1: GraphKit is the export path).
/// Built from a `LibraryArchive`, so it leaves out exactly what the archive
/// does (private-only themes, D5).
public enum GraphExport {

    public static func graphML(_ archive: LibraryArchive, now: Date = Date()) -> String {
        GraphExporter.graphML(graph: GraphExporter.aggregate(sessions: [session(archive, now: now)]))
    }

    /// One "session" holding the whole graph: nodes with their decayed
    /// strength, and one edge per (source, target, type) weighted by how
    /// many times it was found.
    static func session(_ archive: LibraryArchive, now: Date) -> SessionGraph {
        var mentions: [UUID: [(confidence: Double, createdAt: Date)]] = [:]
        for mention in archive.mentions {
            guard let nodeID = mention.nodeID else { continue }
            mentions[nodeID, default: []].append((mention.confidence, mention.createdAt))
        }
        let nodes = archive.themeNodes.map { node in
            SessionGraph.Node(id: node.id.uuidString, type: node.type, label: node.canonicalLabel,
                              strength: Float(ThemeStrength.score(mentions: mentions[node.id] ?? [], now: now)))
        }

        var counts: [String: (source: UUID, target: UUID, type: String, count: Int)] = [:]
        for edge in archive.edges where edge.sourceNodeID != edge.targetNodeID {
            let key = "\(edge.sourceNodeID.uuidString)|\(edge.targetNodeID.uuidString)|\(edge.type)"
            var entry = counts[key] ?? (source: edge.sourceNodeID, target: edge.targetNodeID, type: edge.type, count: 0)
            entry.count += 1
            counts[key] = entry
        }
        let edges = counts.keys.sorted().compactMap { key -> SessionGraph.Edge? in
            guard let entry = counts[key] else { return nil }
            return SessionGraph.Edge(sourceNodeID: entry.source.uuidString, targetNodeID: entry.target.uuidString,
                                     type: entry.type, weight: Float(entry.count))
        }
        return SessionGraph(nodes: nodes, edges: edges)
    }
}
