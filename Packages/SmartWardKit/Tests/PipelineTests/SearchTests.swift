import XCTest
import SwiftData
import KnowledgeStore
@testable import Pipeline

final class LexicalIndexTests: XCTestCase {
    func testTokensKeepCompoundTermsAndTheirParts() {
        XCTAssertEqual(LexicalIndex.tokens("SWE-bench, GPT-4o and vLLM!"),
                       ["swe-bench", "swe", "bench", "gpt-4o", "gpt", "4o", "and", "vllm"])
        XCTAssertEqual(LexicalIndex.tokens("Llama 3.1."), ["llama", "3.1", "3", "1"])
        XCTAssertEqual(LexicalIndex.tokens("  "), [])
    }

    func testBM25RanksRareTermsAndShortDocsHigher() {
        var index = LexicalIndex()
        index.add(id: "a", text: "LoRA fine-tuning for small models")
        index.add(id: "b", text: "Fine-tuning large models with full parameter updates and lots of other words here")
        index.add(id: "c", text: "Retrieval augmented generation")
        let hits = index.search("LoRA fine-tuning", limit: 10)
        XCTAssertEqual(hits.first?.id, "a")
        XCTAssertEqual(Set(hits.map(\.id)), ["a", "b"])
        XCTAssertTrue(index.search("quantum", limit: 10).isEmpty)
        XCTAssertTrue(index.search("", limit: 10).isEmpty)
    }
}

final class HybridSearchTests: XCTestCase {
    private let articleA = UUID()
    private let articleB = UUID()
    private let articleC = UUID()

    private func documents() async -> [SearchDocument] {
        let embedder = FakeEmbedder()
        return [
            SearchDocument(id: "article:a", articleID: articleA, text: "Speculative decoding explained"),
            SearchDocument(id: "chunk:a1", articleID: articleA,
                           text: "A draft model proposes tokens and the target model verifies them in parallel.",
                           vector: await embedder.embed("draft model proposes tokens target model verifies parallel")),
            SearchDocument(id: "article:b", articleID: articleB, text: "vLLM 0.9 released"),
            SearchDocument(id: "chunk:b1", articleID: articleB,
                           text: "vLLM adds speculative decoding support with draft models.",
                           vector: await embedder.embed("vllm speculative decoding draft models")),
            SearchDocument(id: "article:c", articleID: articleC, text: "Sourdough at home",
                           vector: await embedder.embed("sourdough bread baking")),
        ]
    }

    func testFusesKeywordAndSemanticHitsPerArticle() async {
        let index = HybridSearchIndex(documents: await documents())
        XCTAssertEqual(index.documentCount, 5)

        let query = "speculative decoding"
        let hits = index.search(query, queryVector: await FakeEmbedder().embed("speculative decoding draft models"))
        XCTAssertEqual(Set(hits.map(\.articleID)), [articleA, articleB], "one hit per article; bread doesn't match")
        let b = try? XCTUnwrap(hits.first { $0.articleID == articleB })
        XCTAssertEqual(b?.matchedBy, [.keyword, .semantic])
        XCTAssertTrue(b?.snippet.localizedCaseInsensitiveContains("speculative") ?? false)
    }

    func testExactTokensWorkWithoutVectors() async {
        let index = HybridSearchIndex(documents: await documents())
        let hits = index.search("vLLM", queryVector: nil)
        XCTAssertEqual(hits.map(\.articleID), [articleB])
        XCTAssertEqual(hits.first?.matchedBy, .keyword)
    }

    func testSemanticOnlyMatch() async {
        let index = HybridSearchIndex(documents: await documents())
        let hits = index.search("verifying proposals", queryVector: await FakeEmbedder().embed("target model verifies draft tokens"))
        XCTAssertEqual(hits.first?.articleID, articleA)
        XCTAssertEqual(hits.first?.matchedBy, .semantic)
    }

    func testSnippetWindowsAroundTheMatch() {
        let text = String(repeating: "filler ", count: 60) + "the KEY idea is here " + String(repeating: "tail ", count: 80)
        let snippet = HybridSearchIndex.snippet(text, query: "key idea")
        XCTAssertTrue(snippet.hasPrefix("…"))
        XCTAssertTrue(snippet.hasSuffix("…"))
        XCTAssertTrue(snippet.contains("KEY idea"))
        XCTAssertEqual(HybridSearchIndex.snippet("Short text", query: "zzz"), "Short text")
    }

    @MainActor
    func testCorpusIncludesArticlesAndOnlyCurrentModelVectors() async throws {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        let context = container.mainContext
        let article = Article(canonicalURL: "https://x.example/1", title: "Title", cleanedText: "Body text.")
        article.summary = "Summary"
        article.stage = .triaged
        context.insert(article)
        let offTopic = Article(canonicalURL: "https://x.example/2", title: "Off topic")
        offTopic.stage = .triagedOut
        context.insert(offTopic)
        try context.save()
        await ArticleIndexer(embedder: fakeModel).index(article, context: context)
        let stale = KnowledgeStore.Chunk(text: "old", ordinal: 9)
        stale.vector = VectorCoding.data(from: [1, 2])
        stale.embeddingModel = "old-model"
        article.chunks?.append(stale)
        try context.save()

        let documents = try SearchCorpus.documents(context: context, embeddingModelID: "fake-v1")
        XCTAssertTrue(documents.contains { $0.id == "article:\(offTopic.id.uuidString)" }, "off-topic stays searchable")
        XCTAssertEqual(documents.first { $0.id == "article:\(article.id.uuidString)" }?.text, "Title\nSummary")
        let chunkDocs = documents.filter { $0.id.hasPrefix("chunk:") }
        XCTAssertEqual(chunkDocs.count, 2)
        XCTAssertEqual(chunkDocs.filter { $0.vector != nil }.count, 1, "vectors from another model are left out")
    }
}
