import XCTest
import SwiftData
import KnowledgeStore
@testable import Pipeline

/// What the app says back to "how many unread?", "which sources are failing?",
/// "tell me about vLLM" and the like.
final class VoiceAnswersTests: XCTestCase {
    func testUnread() {
        XCTAssertEqual(VoiceAnswers.unread(0), "You're all caught up. Nothing is unread.")
        XCTAssertEqual(VoiceAnswers.unread(1), "You have 1 unread article.")
        XCTAssertEqual(VoiceAnswers.unread(23), "You have 23 unread articles.")
    }

    func testRefresh() {
        XCTAssertEqual(VoiceAnswers.refresh(isRefreshing: true, lastSummary: "5 new items"), "Still refreshing.")
        XCTAssertEqual(VoiceAnswers.refresh(isRefreshing: false, lastSummary: "5 new items · 1 source failed"),
                       "The refresh is done: 5 new items, 1 source failed.")
        XCTAssertEqual(VoiceAnswers.refresh(isRefreshing: false, lastSummary: nil),
                       "Nothing has been refreshed since the app opened.")
        XCTAssertEqual(VoiceAnswers.refresh(isRefreshing: false, lastSummary: "  "),
                       "Nothing has been refreshed since the app opened.")
    }

    func testFailingSources() {
        XCTAssertEqual(VoiceAnswers.failingSources([]), "All your sources are working.")
        XCTAssertEqual(VoiceAnswers.failingSources(["The Blog"]), "One source is failing: The Blog.")
        XCTAssertEqual(VoiceAnswers.failingSources(["A", "B", "C"]), "3 sources are failing: A, B and C.")
        XCTAssertEqual(VoiceAnswers.failingSources(["A", "B", "C", "D", "E"]),
                       "5 sources are failing, including A, B and C.")
    }

    func testMoneyIsSaidAsWords() {
        XCTAssertEqual(VoiceAnswers.money(0.12), "12 cents")
        XCTAssertEqual(VoiceAnswers.money(0.01), "1 cent")
        XCTAssertEqual(VoiceAnswers.money(1), "1 dollar")
        XCTAssertEqual(VoiceAnswers.money(3.05), "3 dollars and 5 cents")
        XCTAssertEqual(VoiceAnswers.money(0.999), "1 dollar", "rounding carries into the dollars")
    }

    func testSpend() {
        XCTAssertEqual(VoiceAnswers.spend(spent: 0.12, cap: 1), "You've spent 12 cents today. Your daily budget is 1 dollar.")
        XCTAssertEqual(VoiceAnswers.spend(spent: 0, cap: 1), "You haven't spent anything today. Your daily budget is 1 dollar.")
        XCTAssertEqual(VoiceAnswers.spend(spent: 0.5, cap: nil), "You've spent 50 cents today. There's no daily cap.")
        XCTAssertEqual(VoiceAnswers.spend(spent: 2, cap: 2), "You've spent 2 dollars today. That's your whole 2 dollars daily budget.")
    }

    func testThemesAndSearchResults() {
        XCTAssertEqual(VoiceAnswers.topThemes([]), "There aren't any themes in your graph yet.")
        XCTAssertEqual(VoiceAnswers.topThemes(["vLLM", "RAG", "Agents"]), "Your top themes are vLLM, RAG and Agents.")
        XCTAssertEqual(VoiceAnswers.searchResults(query: "rust", titles: [], total: 0), "I found nothing for rust.")
        XCTAssertEqual(VoiceAnswers.searchResults(query: "rust", titles: ["Rust 2027"], total: 1),
                       "I found 1 result for rust. Number one: Rust 2027.")
        XCTAssertEqual(VoiceAnswers.searchResults(query: "rust", titles: ["A", "B", "C", "D"], total: 9),
                       "I found 9 results for rust. Number one: A. Number two: B. Number three: C.")
    }

    func testAboutATheme() {
        let full = ThemeDescription(label: "vLLM", type: "tool", articleCount: 4, projects: ["Home lab", "Inference stack"],
                                    recentTitles: ["Speculative decoding in vLLM", "Older"])
        XCTAssertEqual(VoiceAnswers.about(full),
                       "vLLM is a tool. It's in 4 articles. Pinned by Home lab and Inference stack. The latest is Speculative decoding in vLLM.")
        let bare = ThemeDescription(label: "Rust", type: "", articleCount: 0, projects: [], recentTitles: [])
        XCTAssertEqual(VoiceAnswers.about(bare), "Rust is a theme. It isn't in any articles yet.")
    }

    // MARK: From the library

    @MainActor
    private struct World {
        /// Kept so the store outlives the context.
        let container: ModelContainer
        let context: ModelContext
        let vllm: ThemeNode
        let rag: ThemeNode
    }

    @MainActor
    private func makeWorld() throws -> World {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        let context = container.mainContext
        let feed = Source(kind: "rss", url: "https://blog.example/feed", title: "Blog")
        let repo = Source(kind: "github_repo", url: "https://github.com/me/stack", title: "me/stack")
        context.insert(feed)
        context.insert(repo)
        let vllm = ThemeNode(type: "tool", canonicalLabel: "vLLM")
        let rag = ThemeNode(type: "technique", canonicalLabel: "Retrieval augmented generation")
        context.insert(vllm)
        context.insert(rag)
        let project = Project(name: "Inference stack")
        context.insert(project)
        vllm.pinnedByProjects?.append(project)

        func add(_ title: String, source: Source, days: Double, read: Bool = false, stage: ArticleStage = .linked,
                 themes: [ThemeNode]) {
            let article = Article(canonicalURL: "https://blog.example/" + title, title: title, cleanedText: "Body")
            article.source = source
            article.isRead = read
            article.stage = stage
            article.publishedAt = Date(timeIntervalSince1970: 1_800_000_000 - days * 86_400)
            context.insert(article)
            let chunk = KnowledgeStore.Chunk(text: title, ordinal: 0)
            article.chunks?.append(chunk)
            for node in themes {
                let mention = Mention(createdAt: Date(timeIntervalSince1970: 1_800_000_000))
                mention.node = node
                chunk.mentions?.append(mention)
            }
        }
        add("Speculative decoding", source: feed, days: 1, themes: [vllm])
        add("Serving at scale", source: feed, days: 3, themes: [vllm, rag])
        add("Read already", source: feed, days: 2, read: true, themes: [vllm])
        add("Filtered out", source: feed, days: 2, stage: .triagedOut, themes: [])
        add("Repo doc", source: repo, days: 2, themes: [])
        try context.save()
        return World(container: container, context: context, vllm: vllm, rag: rag)
    }

    @MainActor
    func testUnreadCountSkipsReadFilteredAndRepoDocs() throws {
        let world = try makeWorld()
        let articles = try world.context.fetch(FetchDescriptor<Article>())
        XCTAssertEqual(LibraryVoiceQueries.unreadCount(in: articles), 2)
    }

    @MainActor
    func testTopThemesAreTheStrongestFirst() throws {
        let world = try makeWorld()
        let now = Date(timeIntervalSince1970: 1_800_000_000)
        XCTAssertEqual(LibraryVoiceQueries.topThemes(context: world.context, limit: 5, now: now),
                       ["vLLM", "Retrieval augmented generation"])
        XCTAssertEqual(LibraryVoiceQueries.topThemes(context: world.context, limit: 1, now: now), ["vLLM"])
    }

    @MainActor
    func testATopicYouNameFindsItsTheme() throws {
        let world = try makeWorld()
        let found = try XCTUnwrap(LibraryVoiceQueries.describeTheme(matching: "vllm", context: world.context))
        XCTAssertEqual(found.label, "vLLM")
        XCTAssertEqual(found.type, "tool")
        XCTAssertEqual(found.articleCount, 3)
        XCTAssertEqual(found.projects, ["Inference stack"])
        XCTAssertEqual(found.recentTitles, ["Speculative decoding", "Read already", "Serving at scale"], "newest first")
        XCTAssertEqual(LibraryVoiceQueries.describeTheme(matching: "retrieval augmented", context: world.context)?.label,
                       "Retrieval augmented generation")
        XCTAssertNil(LibraryVoiceQueries.describeTheme(matching: "kubernetes", context: world.context))
    }

    // MARK: Spoken answers

    @MainActor
    func testAnAnswerBecomesSegmentsPerParagraphInOneGroup() {
        let segments = SpokenAnswer.segments("First paragraph here.\n\nSecond paragraph here.")
        XCTAssertEqual(segments.map(\.text), ["First paragraph here.", "Second paragraph here."])
        XCTAssertEqual(segments.map(\.group), [0, 0])
        XCTAssertEqual(segments.map(\.anchor), [.note, .note])
        XCTAssertEqual(segments.map(\.id), [0, 1])
        XCTAssertTrue(SpokenAnswer.segments("  \n\n ").isEmpty)
    }
}
