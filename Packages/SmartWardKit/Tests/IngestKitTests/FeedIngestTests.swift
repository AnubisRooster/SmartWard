import XCTest
import SwiftData
import KnowledgeStore
@testable import IngestKit

final class FeedIngestTests: XCTestCase {
    private let now = Date(timeIntervalSince1970: 1_800_000_000)
    private let longText = String(repeating: "Retrieval-augmented generation grounds answers in documents. ", count: 30)

    @MainActor
    func testAddsDedupesAndRecordsTheFetch() throws {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        let context = container.mainContext
        let source = Source(kind: "rss", url: "https://blog.example")
        context.insert(source)

        let items = [
            RawItem(url: "https://blog.example/a", title: "A", summary: "Teaser", publishedAt: now - 3600),
            RawItem(url: "https://blog.example/b", title: "B", content: longText, publishedAt: now - 7200),
            RawItem(url: "https://blog.example/a", title: "A again"),
            RawItem(url: "https://blog.example/old", title: "Old", publishedAt: now - 90 * 86_400),
        ]
        let fetched = FetchedSource(items: items, title: "Blog", etag: "\"e1\"",
                                    discoveredFeedURL: "https://blog.example/feed.xml")
        let result = try FeedIngest.apply(fetched, to: source, context: context, now: now)

        XCTAssertEqual(result, FeedIngest.Result(added: 2, duplicates: 1, skippedOld: 1))
        XCTAssertEqual(source.title, "Blog")
        XCTAssertEqual(source.url, "https://blog.example/feed.xml")
        XCTAssertEqual(source.etag, "\"e1\"")
        XCTAssertEqual(source.lastFetchedAt, now)
        XCTAssertNil(source.lastError)

        let articles = try context.fetch(FetchDescriptor<Article>(sortBy: [SortDescriptor(\.canonicalURL)]))
        XCTAssertEqual(articles.map(\.canonicalURL), ["https://blog.example/a", "https://blog.example/b"])
        XCTAssertEqual(articles[0].stage, .fetched, "a teaser still needs its full text")
        XCTAssertEqual(articles[0].summary, "Teaser")
        XCTAssertEqual(articles[1].stage, .cleaned)
        XCTAssertTrue(articles[1].summary.hasSuffix("…"))
        XCTAssertFalse(articles[1].contentHash.isEmpty)
        XCTAssertTrue(articles.allSatisfy { $0.source?.id == source.id && !$0.localOnly })

        // A second fetch of the same items adds nothing.
        let again = try FeedIngest.apply(fetched, to: source, context: context, now: now)
        XCTAssertEqual(again.added, 0)
        XCTAssertEqual(try context.fetchCount(FetchDescriptor<Article>()), 2)
    }

    @MainActor
    func testSameStoryFromAnotherSourceIsADuplicate() throws {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        let context = container.mainContext
        let arxiv = Source(kind: "arxiv", url: "cs.CL")
        let papers = Source(kind: "hf_papers", url: "")
        let blog = Source(kind: "rss", url: "https://mirror.example/feed")
        for source in [arxiv, papers, blog] { context.insert(source) }

        let paper = RawItem(url: "https://arxiv.org/abs/2409.01234", title: "Paper", summary: "Abstract.")
        try FeedIngest.apply(FetchedSource(items: [paper]), to: arxiv, context: context, now: now)
        let fromHF = try FeedIngest.apply(FetchedSource(items: [paper]), to: papers, context: context, now: now)
        XCTAssertEqual(fromHF.duplicates, 1, "same canonical URL")

        try FeedIngest.apply(FetchedSource(items: [RawItem(url: "https://blog.example/post", title: "Post", content: longText)]),
                             to: blog, context: context, now: now)
        let mirrored = try FeedIngest.apply(
            FetchedSource(items: [RawItem(url: "https://mirror.example/post", title: "Post", content: longText)]),
            to: blog, context: context, now: now)
        XCTAssertEqual(mirrored.duplicates, 1, "same body under another URL")

        let stored = try context.fetch(FetchDescriptor<Article>())
        XCTAssertEqual(stored.count, 2)
        XCTAssertEqual(stored.first { $0.canonicalURL.contains("arxiv") }?.stage, .cleaned, "papers are read as abstracts")
    }

    @MainActor
    func testWatchedPageUpdatesWhenItChanges() throws {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        let context = container.mainContext
        let site = Source(kind: "site", url: "https://lab.example/research")
        context.insert(site)
        let url = "https://lab.example/research"

        try FeedIngest.apply(FetchedSource(items: [RawItem(url: url, title: "Research", content: longText)]),
                             to: site, context: context, now: now)
        let article = try XCTUnwrap(try context.fetch(FetchDescriptor<Article>()).first)
        article.isRead = true

        let changed = longText + " New: a paper on sparse attention."
        let result = try FeedIngest.apply(FetchedSource(items: [RawItem(url: url, title: "Research", content: changed)]),
                                          to: site, context: context, now: now + 60)
        XCTAssertEqual(result.updated, 1)
        XCTAssertEqual(article.cleanedText, changed)
        XCTAssertFalse(article.isRead, "a change resurfaces the page")
        XCTAssertEqual(try context.fetchCount(FetchDescriptor<Article>()), 1)
    }

    @MainActor
    func testCapsNewItemsPerFetchKeepingTheNewest() throws {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        let context = container.mainContext
        let source = Source(kind: "hn", url: "agents")
        context.insert(source)
        let items = (0..<60).map { index in
            RawItem(url: "https://news.example/\(index)", title: "\(index)", publishedAt: now - Double(index) * 60)
        }
        let result = try FeedIngest.apply(FetchedSource(items: items), to: source, context: context, now: now)
        XCTAssertEqual(result.added, FeedIngest.maxNewItemsPerFetch)
        let titles = Set(try context.fetch(FetchDescriptor<Article>()).map(\.title))
        XCTAssertTrue(titles.contains("0"))
        XCTAssertFalse(titles.contains("59"))
    }

    @MainActor
    func testFullTextReplacesATeaserOnlyWhenLonger() throws {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        let context = container.mainContext
        let article = Article(canonicalURL: "https://blog.example/a", title: "A", cleanedText: "Teaser")
        context.insert(article)

        XCTAssertFalse(FeedIngest.applyFullText(ExtractedArticle(title: "A", text: "Too short"), to: article))
        XCTAssertEqual(article.stage, .fetched)

        let page = ExtractedArticle(title: "A", byline: "Ada", text: longText, publishedAt: now)
        XCTAssertTrue(FeedIngest.applyFullText(page, to: article))
        XCTAssertEqual(article.stage, .cleaned)
        XCTAssertEqual(article.cleanedText, longText)
        XCTAssertEqual(article.byline, "Ada")
        XCTAssertEqual(article.publishedAt, now)
        XCTAssertFalse(article.summary.isEmpty)
        XCTAssertFalse(article.contentHash.isEmpty)
    }

    @MainActor
    func testRecordFailure() throws {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        let context = container.mainContext
        let source = Source(kind: "rss", url: "https://x.example")
        context.insert(source)
        FeedIngest.recordFailure(IngestError.notAFeed, on: source, context: context, now: now)
        XCTAssertEqual(source.lastError, IngestError.notAFeed.errorDescription)
        XCTAssertEqual(source.lastFetchedAt, now)
    }

    @MainActor
    func testSourceKindFallsBackAndKnowsWhatIsPolled() throws {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        _ = container.mainContext
        XCTAssertEqual(Source(kind: "mystery", url: "").sourceKind, .rss)
        XCTAssertEqual(Source(kind: "hf_papers", url: "").sourceKind, .hfPapers)
        XCTAssertFalse(SourceKind.githubRepo.isPolled)
        XCTAssertFalse(SourceKind.manual.isPolled)
        XCTAssertTrue(SourceKind.site.isPolled)
    }
}
