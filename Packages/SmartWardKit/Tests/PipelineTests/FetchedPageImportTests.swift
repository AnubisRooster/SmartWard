import XCTest
import SwiftData
import IngestKit
import KnowledgeStore
@testable import Pipeline

final class FetchedPageImportTests: XCTestCase {
    private let now = Date(timeIntervalSince1970: 1_800_000_000)
    private let url = URL(string: "https://vllm.ai/blog/spec-decode")!

    private func page(text: String = "Draft models predict tokens the target model checks.") -> ExtractedArticle {
        ExtractedArticle(title: "Spec decode in vLLM", text: text)
    }

    @MainActor
    func testSavesAFetchedPageAsAnArticleUnderItsOwnSource() throws {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        let context = container.mainContext

        let article = try FetchedPageImport.save(page(), url: url, localOnly: false, context: context, now: now)
        XCTAssertEqual(article.title, "Spec decode in vLLM")
        XCTAssertEqual(article.canonicalURL, "https://vllm.ai/blog/spec-decode")
        XCTAssertEqual(article.stage, .cleaned, "the full text is already in hand")
        XCTAssertEqual(article.relevance, 1)
        XCTAssertFalse(article.localOnly)

        let source = try XCTUnwrap(article.source)
        XCTAssertEqual(source.sourceKind, .manual)
        XCTAssertEqual(source.title, FetchedPageImport.sourceTitle)
    }

    @MainActor
    func testFetchingTheSamePageAgainResurfacesInsteadOfDuplicating() throws {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        let context = container.mainContext

        let first = try FetchedPageImport.save(page(), url: url, localOnly: false, context: context, now: now)
        first.isRead = true
        first.stage = .triagedOut
        try context.save()

        let second = try FetchedPageImport.save(page(text: "Longer, updated text about speculative decoding, plainly."),
                                                 url: URL(string: "https://vllm.ai/blog/spec-decode#section")!,
                                                 localOnly: false, context: context, now: now + 60)
        XCTAssertEqual(second.id, first.id, "the fragment doesn't make it a new page")
        XCTAssertFalse(second.isRead)
        XCTAssertEqual(second.stage, .cleaned, "you asked for it directly: triage's old verdict no longer applies")
        XCTAssertTrue(second.cleanedText.contains("Longer, updated text"))
        XCTAssertEqual(try context.fetchCount(FetchDescriptor<Article>()), 1)
    }

    @MainActor
    func testLocalOnlyIsStickyOnceSet() throws {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        let context = container.mainContext

        try FetchedPageImport.save(page(), url: url, localOnly: true, context: context, now: now)
        let resaved = try FetchedPageImport.save(page(), url: url, localOnly: false, context: context, now: now + 60)
        XCTAssertTrue(resaved.localOnly, "an off-the-record fetch's article never turns public again")
    }

    @MainActor
    func testDoesNotCollideWithAnotherManualSource() throws {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        let context = container.mainContext

        // IngestKit's SharedImport (the share extension's inbox) keeps its
        // own `.manual` source, "Shared with SmartWard"; fetch_url's
        // articles must land in a distinct one, not whichever comes back
        // first from a kind-only lookup.
        let shared = Source(kind: "manual", url: "", title: "Shared with SmartWard")
        context.insert(shared)
        shared.articles?.append(Article(canonicalURL: "https://blog.example/shared", title: "Shared post"))
        try context.save()

        try FetchedPageImport.save(page(), url: url, localOnly: false, context: context, now: now)

        let manualSources = try context.fetch(FetchDescriptor<Source>(predicate: #Predicate { $0.kind == "manual" }))
        XCTAssertEqual(Set(manualSources.map(\.title)), ["Shared with SmartWard", FetchedPageImport.sourceTitle])
        XCTAssertEqual(shared.articles?.count, 1, "untouched by the fetched-page import")

        let readInChat = try XCTUnwrap(manualSources.first { $0.title == FetchedPageImport.sourceTitle })
        XCTAssertEqual(readInChat.articles?.count, 1)
    }
}
