import XCTest
import SwiftData
import KnowledgeStore
@testable import Pipeline

final class ThemeStrengthCacheTests: XCTestCase {
    private let now = Date(timeIntervalSince1970: 1_800_000_000)

    @MainActor
    private func library() throws -> (ModelContainer, ModelContext, [ThemeNode], KnowledgeStore.Chunk) {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        let context = container.mainContext
        let article = Article(canonicalURL: "https://x.example/1", title: "A")
        context.insert(article)
        let chunk = KnowledgeStore.Chunk(text: "a")
        article.chunks?.append(chunk)
        let nodes = (0..<3).map { ThemeNode(type: "concept", canonicalLabel: "t\($0)") }
        nodes.forEach { context.insert($0) }
        for (index, node) in nodes.enumerated() {
            for day in 0...index {
                let mention = Mention(confidence: 0.5 + Double(day) / 10, createdAt: now - Double(day * 20) * 86_400)
                mention.node = node
                chunk.mentions?.append(mention)
            }
        }
        try context.save()
        return (container, context, nodes, chunk)
    }

    @MainActor
    func testOnePassMatchesPerThemeStrength() throws {
        let (container, context, nodes, _) = try library()
        _ = container
        let entries = try ThemeStrengths.compute(context: context, now: now)
        for node in nodes {
            XCTAssertEqual(entries[node.id]?.strength ?? -1, ThemeStrength.score(of: node, now: now), accuracy: 1e-12)
            XCTAssertEqual(entries[node.id]?.mentions, node.mentions?.count)
        }
    }

    @MainActor
    func testCachedStrengthsDecayExactlyAndRefreshOnChanges() throws {
        let (container, context, nodes, chunk) = try library()
        _ = container
        let cache = ThemeStrengthCache()
        _ = try cache.strengths(context: context, now: now)
        let later = now + 30 * 86_400
        let cached = try cache.strengths(context: context, now: later)
        XCTAssertEqual(cache.hits, 1)
        let fresh = try ThemeStrengths.compute(context: context, now: later)
        for node in nodes {
            XCTAssertEqual(cached[node.id]?.strength ?? -1, fresh[node.id]?.strength ?? -2, accuracy: 1e-12,
                           "rescaling is exact for exponential decay")
        }

        let mention = Mention(confidence: 1, createdAt: later)
        mention.node = nodes[0]
        chunk.mentions?.append(mention)
        try context.save()
        XCTAssertEqual(try cache.strengths(context: context, now: later)[nodes[0].id]?.mentions, 2, "a new mention")
        XCTAssertEqual(cache.misses, 2)

        context.delete(nodes[2])
        try context.save()
        XCTAssertNil(try cache.strengths(context: context, now: later)[nodes[2].id], "a deleted theme")
        XCTAssertEqual(cache.misses, 3)

        let snapshot = try GraphSnapshot.build(context: context, includeDormant: true, now: later, strengths: cache)
        XCTAssertEqual(Set(snapshot.nodes.map(\.label)), ["t0", "t1"])
    }
}

final class IncrementalIndexTests: XCTestCase {

    private func documents(_ range: Range<Int>) -> [SearchDocument] {
        range.map { index in
            SearchDocument(id: "chunk:\(index)", articleID: UUID(), text: "topic\(index % 7) shared words \(index)",
                           vector: [Float(index % 5) + 1, Float(index % 3), 1, 0.5])
        }
    }

    func testAddingInPlaceMatchesBuildingFromScratch() {
        var incremental = HybridSearchIndex(documents: documents(0..<300))
        incremental.add(documents(300..<400))
        let scratch = HybridSearchIndex(documents: documents(0..<400))
        for query in ["topic3 words", "shared", "topic6 399"] {
            XCTAssertEqual(incremental.rankDocuments(query, queryVector: [2, 1, 1, 0.5], limit: 30).map(\.document.id),
                           scratch.rankDocuments(query, queryVector: [2, 1, 1, 0.5], limit: 30).map(\.document.id))
        }
    }

    func testRemovedDocumentsStopMatchingAndEventuallyNeedARebuild() {
        var index = HybridSearchIndex(documents: documents(0..<3_000))
        index.remove(["chunk:10", "chunk:missing"])
        XCTAssertEqual(index.retired, ["chunk:10"])
        XCTAssertFalse(index.rankDocuments("10", queryVector: nil, limit: 100).contains { $0.document.id == "chunk:10" })
        XCTAssertFalse(index.needsRebuild)
        index.remove((0..<700).map { "chunk:\($0)" })
        XCTAssertTrue(index.needsRebuild, "over a fifth retired")
    }

    @MainActor
    func testCorpusUpdateLoadsOnlyWhatChanged() throws {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        let context = container.mainContext
        func article(_ name: String) -> Article {
            let article = Article(canonicalURL: "https://x.example/\(name)", title: name)
            context.insert(article)
            article.chunks?.append(KnowledgeStore.Chunk(text: "\(name) body"))
            return article
        }
        let kept = article("kept")
        let gone = article("gone")
        try context.save()
        let index = HybridSearchIndex(documents: try SearchCorpus.documents(context: context, embeddingModelID: nil))

        XCTAssertTrue(try SearchCorpus.update(for: nil, context: context, embeddingModelID: nil).rebuild)
        XCTAssertTrue(try SearchCorpus.update(for: index, context: context, embeddingModelID: nil).isEmpty)

        let goneIDs: Set<String> = ["article:\(gone.id.uuidString)", "chunk:\(gone.chunks!.first!.id.uuidString)"]
        context.delete(gone)
        let fresh = article("fresh")
        try context.save()
        let update = try SearchCorpus.update(for: index, context: context, embeddingModelID: nil)
        XCTAssertFalse(update.rebuild)
        XCTAssertEqual(update.remove, goneIDs)
        XCTAssertEqual(Set(update.add.map(\.id)),
                       ["article:\(fresh.id.uuidString)", "chunk:\(fresh.chunks!.first!.id.uuidString)"])
        XCTAssertFalse(update.add.contains { $0.articleID == kept.id })
    }
}

final class SampleLibraryTests: XCTestCase {

    @MainActor
    func testLoadsMarkedDataAndRemovesOnlyThat() async throws {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        let context = container.mainContext
        let mine = Article(canonicalURL: "https://mine.example/1", title: "Mine")
        context.insert(mine)
        let myTheme = ThemeNode(type: "tool", canonicalLabel: "vLLM")
        context.insert(myTheme)
        try context.save()

        var fractions: [Double] = []
        try await SampleLibrary.load(SampleLibrary.Size(chunks: 900, chunksPerArticle: 5, themes: 40, edges: 120),
                                     embeddingModelID: "fake-v1", dimension: 16, container: container) {
            fractions.append($0)
        }
        XCTAssertTrue(SampleLibrary.isLoaded(context: context))
        XCTAssertEqual(fractions.last, 1)
        XCTAssertEqual(try context.fetchCount(FetchDescriptor<KnowledgeStore.Chunk>()), 900)
        XCTAssertEqual(try context.fetchCount(FetchDescriptor<Article>()), 181)
        XCTAssertEqual(try context.fetchCount(FetchDescriptor<Mention>()), 1_800)
        XCTAssertEqual(try context.fetchCount(FetchDescriptor<ThemeNode>()), 41)
        let chunk = try XCTUnwrap(context.fetch(FetchDescriptor<KnowledgeStore.Chunk>()).first)
        XCTAssertEqual(chunk.embeddingModel, "fake-v1")
        XCTAssertEqual(VectorCoding.vector(from: chunk.vector ?? Data()).count, 16)

        let documents = try SearchCorpus.documents(context: context, embeddingModelID: "fake-v1")
        XCTAssertEqual(documents.filter { $0.vector != nil }.count, 900, "sample vectors match the embedder")

        let removed = try await SampleLibrary.remove(container: container)
        XCTAssertEqual(removed, 180)
        XCTAssertFalse(SampleLibrary.isLoaded(context: context))
        XCTAssertEqual(try context.fetch(FetchDescriptor<Article>()).map(\.title), ["Mine"])
        XCTAssertEqual(try context.fetch(FetchDescriptor<ThemeNode>()).map(\.canonicalLabel), ["vLLM"])
        XCTAssertEqual(try context.fetchCount(FetchDescriptor<ThemeEdge>()), 0)
        XCTAssertEqual(try context.fetchCount(FetchDescriptor<Mention>()), 0)
    }
}

final class PerfTraceTests: XCTestCase {

    func testMeasuresAndSummarizes() async {
        PerfTrace.reset()
        for value in [5.0, 1, 3, 2, 4] {
            PerfTrace.record("Test", milliseconds: value)
        }
        let result = PerfTrace.measure("Measured") { 42 }
        XCTAssertEqual(result, 42)
        let asyncResult = await PerfTrace.measureAsync("Measured") { 7 }
        XCTAssertEqual(asyncResult, 7)

        XCTAssertEqual(PerfTrace.summary("Test"), PerfTrace.Summary(count: 5, p50: 3, p95: 5, max: 5))
        XCTAssertEqual(PerfTrace.summary("Measured")?.count, 2)
        XCTAssertEqual(PerfTrace.names, ["Measured", "Test"])
        XCTAssertNil(PerfTrace.summary("Missing"))
        PerfTrace.reset()
        XCTAssertTrue(PerfTrace.samples.isEmpty)
    }
}
