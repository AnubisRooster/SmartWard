import XCTest
import SwiftData
import RetrievalKit
import KnowledgeStore
@testable import Pipeline

/// A small deterministic generator, so scale runs are repeatable.
struct SeededRandom: RandomNumberGenerator {
    private var state: UInt64
    init(_ seed: UInt64) { state = seed }
    mutating func next() -> UInt64 {
        state &+= 0x9E37_79B9_7F4A_7C15
        var z = state
        z = (z ^ (z >> 30)) &* 0xBF58_476D_1CE4_E5B9
        z = (z ^ (z >> 27)) &* 0x94D0_49BB_1331_11EB
        return z ^ (z >> 31)
    }
}

/// `TopK` is qualified: RetrievalKit has one too.
final class TopKTests: XCTestCase {

    func testKeepsTheBestInOrderWithoutSortingEverything() {
        var random = SeededRandom(7)
        let values = (0..<5_000).map { _ in Int.random(in: 0..<1_000, using: &random) }
        var best = Pipeline.TopK<Int>(25, ranksHigher: >)
        values.forEach { best.insert($0) }
        XCTAssertEqual(best.sorted(), Array(values.sorted(by: >).prefix(25)))

        var none = Pipeline.TopK<Int>(0, ranksHigher: >)
        none.insert(1)
        XCTAssertEqual(none.sorted(), [])
        var few = Pipeline.TopK<Int>(10, ranksHigher: >)
        [3, 1, 2].forEach { few.insert($0) }
        XCTAssertEqual(few.sorted(), [3, 2, 1])
    }
}

/// The performance pass (PLAN Phase 5): search and the graph at library
/// sizes well past what the other tests use. Timings are printed for the CI
/// log; the bounds only catch a return to per-document work on every query.
final class PerformanceTests: XCTestCase {

    private func elapsed(_ label: String, _ work: () throws -> Void) rethrows -> TimeInterval {
        let start = Date()
        try work()
        let seconds = Date().timeIntervalSince(start)
        print("⏱ \(label): \(String(format: "%.3f", seconds)) s")
        return seconds
    }

    func testMatrixSearchMatchesBruteForceCosine() {
        var random = SeededRandom(42)
        var documents: [SearchDocument] = []
        for index in 0..<2_000 {
            let vector = (0..<64).map { _ in Float.random(in: -1...1, using: &random) }
            documents.append(SearchDocument(id: "d\(index)", articleID: UUID(), text: "doc \(index)", vector: vector))
        }
        documents.append(SearchDocument(id: "zero", articleID: UUID(), text: "", vector: Array(repeating: 0, count: 64)))
        documents.append(SearchDocument(id: "short", articleID: UUID(), text: "", vector: [1, 0, 0]))
        let index = HybridSearchIndex(documents: documents)
        let query = (0..<64).map { _ in Float.random(in: -1...1, using: &random) }

        let expected = documents
            .compactMap { document -> (id: String, similarity: Float)? in
                guard let vector = document.vector, vector.count == 64 else { return nil }
                let similarity = CosineSimilarity.score(query, vector)
                return similarity >= HybridSearchIndex.minimumSimilarity ? (document.id, similarity) : nil
            }
            .sorted { $0.similarity > $1.similarity }
            .prefix(50)
        let actual = index.semanticMatches(query, limit: 50)
        XCTAssertEqual(actual.map(\.id), expected.map(\.id))
        for (a, e) in zip(actual, expected) {
            XCTAssertEqual(a.similarity, e.similarity, accuracy: 1e-4)
        }
        XCTAssertFalse(actual.contains { $0.id == "zero" || $0.id == "short" })
        XCTAssertTrue(index.semanticMatches([1, 2], limit: 5).isEmpty, "a query of another size matches nothing")
    }

    func testSearchAtOneHundredThousandChunks() {
        var random = SeededRandom(1)
        let vocabulary = (0..<5_000).map { "term\($0)" } + ["vllm", "speculative", "decoding", "lora", "swe-bench"]
        let dimension = 128
        var documents: [SearchDocument] = []
        documents.reserveCapacity(100_000)
        for index in 0..<100_000 {
            let words = (0..<12).map { _ in vocabulary[Int.random(in: 0..<vocabulary.count, using: &random)] }
            let vector = (0..<dimension).map { _ in Float.random(in: -1...1, using: &random) }
            documents.append(SearchDocument(id: "chunk:\(index)", articleID: UUID(),
                                            text: words.joined(separator: " "), vector: vector))
        }
        var index: HybridSearchIndex!
        let build = elapsed("build index, 100k chunks") { index = HybridSearchIndex(documents: documents) }
        let query = (0..<dimension).map { _ in Float.random(in: -1...1, using: &random) }
        var results: [HybridSearchIndex.RankedDocument] = []
        let search = elapsed("20 hybrid queries, 100k chunks") {
            for _ in 0..<20 {
                results = index.rankDocuments("speculative decoding with vllm", queryVector: query, limit: 25)
            }
        }
        XCTAssertEqual(results.count, 25)
        XCTAssertTrue(results.contains { $0.matchedBy.contains(.keyword) })
        XCTAssertLessThan(build, 120, "debug-build index construction regressed badly")
        XCTAssertLessThan(search / 20, 2, "a query should stay well under a second on a debug build")
    }

    @MainActor
    func testGraphQueriesDoNotScaleWithTheWholeGraph() throws {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        let context = container.mainContext
        var random = SeededRandom(9)
        let now = Date(timeIntervalSince1970: 1_800_000_000)

        var nodes: [ThemeNode] = []
        try elapsed("insert 3k themes, 30k edges, 6k chunks") {
            for index in 0..<3_000 {
                let node = ThemeNode(type: ExtractedGraph.entityTypes[index % 8], canonicalLabel: "theme \(index)")
                context.insert(node)
                nodes.append(node)
            }
            nodes[0].canonicalLabel = "vLLM"
            nodes[0].normalizedKey = ThemeNode.normalizedKey(type: nodes[0].type, label: "vLLM")
            nodes[1].aliases?.append(EntityAlias(alias: "Spec Decoding"))
            for _ in 0..<30_000 {
                let a = nodes[Int.random(in: 0..<nodes.count, using: &random)]
                let b = nodes[Int.random(in: 0..<nodes.count, using: &random)]
                context.insert(ThemeEdge(sourceNodeID: a.id, targetNodeID: b.id, type: "RELATES_TO"))
            }
            for index in 0..<1_500 {
                let article = Article(canonicalURL: "https://x.example/\(index)", title: "Article \(index)")
                article.stage = .linked
                context.insert(article)
                for ordinal in 0..<4 {
                    let chunk = KnowledgeStore.Chunk(text: "Chunk \(ordinal) of article \(index)", ordinal: ordinal)
                    article.chunks?.append(chunk)
                    let mention = Mention(confidence: 1, createdAt: now - Double(index) * 600)
                    mention.node = nodes[(index * 4 + ordinal) % nodes.count]
                    chunk.mentions?.append(mention)
                }
            }
            try context.save()
        }

        let retriever = GraphRetriever()
        var named: [ThemeNode] = []
        let lookup = try elapsed("20 named-theme lookups") {
            for _ in 0..<20 { named = try retriever.namedNodes(in: "How does vLLM compare with spec decoding?", context: context) }
        }
        XCTAssertEqual(Set(named.map(\.id)), [nodes[0].id, nodes[1].id], "by label and by alias")

        var passages: [RetrievedPassage] = []
        let retrieval = try elapsed("20 GraphRAG retrievals") {
            for _ in 0..<20 {
                passages = try retriever.retrieve(query: "vLLM", queryVector: nil, index: nil, context: context)
            }
        }
        XCTAssertFalse(passages.isEmpty, "the named theme and its neighbors bring passages")

        var neighborhood = ""
        let neighbors = try elapsed("20 graph_neighbors calls") {
            for _ in 0..<20 {
                neighborhood = try GraphNeighborsTool.theme(named: "Spec Decoding", context: context)?.canonicalLabel ?? ""
            }
        }
        XCTAssertEqual(neighborhood, "theme 1")

        var snapshot = GraphSnapshot(nodes: [], edges: [])
        let graph = try elapsed("graph snapshot") {
            snapshot = try GraphSnapshot.build(context: context, now: now)
        }
        XCTAssertEqual(snapshot.nodes.count, 80)

        XCTAssertLessThan(lookup / 20, 1)
        XCTAssertLessThan(retrieval / 20, 2)
        XCTAssertLessThan(neighbors / 20, 1)
        XCTAssertLessThan(graph, 30)
    }
}
