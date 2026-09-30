import XCTest
import SwiftData
import KnowledgeStore
@testable import Pipeline

/// "Brief me": which unread articles, and what is said about each.
final class BriefingTests: XCTestCase {
    private let now = Date(timeIntervalSince1970: 1_800_000_000)

    private struct Fixture {
        /// Kept so the store outlives the context.
        let container: ModelContainer
        let context: ModelContext
        let feed: Source
        let repo: Source
    }

    @MainActor
    private func makeFixture() throws -> Fixture {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        let feed = Source(kind: "rss", url: "https://blog.example/feed", title: "The Blog")
        let repo = Source(kind: "github_repo", url: "https://github.com/me/stack", title: "me/stack")
        container.mainContext.insert(feed)
        container.mainContext.insert(repo)
        return Fixture(container: container, context: container.mainContext, feed: feed, repo: repo)
    }

    @MainActor
    private func article(_ fixture: Fixture, _ title: String, relevance: Double = 0.5, daysAgo: Double = 0,
                         read: Bool = false, stage: ArticleStage = .linked, source: Source? = nil,
                         teaser: String = "", summarized: Bool = false) -> Article {
        let article = Article(canonicalURL: "https://blog.example/" + title.replacingOccurrences(of: " ", with: "-"),
                              title: title, cleanedText: "Body of \(title).")
        article.source = source ?? fixture.feed
        article.relevance = relevance
        article.isRead = read
        article.stage = stage
        article.summary = teaser
        article.publishedAt = now.addingTimeInterval(-daysAgo * 86_400)
        if summarized {
            let draft = ArticleSummary.Draft(about: ["A study of \(title)", "A second point"],
                                             says: ["It finds a big win"], matters: ["Cheaper"], remember: ["Caveats"])
            let summary = ArticleSummary(draft: draft, fingerprint: ArticleSummary.fingerprint(of: article.cleanedText),
                                         partial: false, writtenBy: "On this device")
            article.summaryJSON = try? summary.encoded()
        }
        fixture.context.insert(article)
        return article
    }

    // MARK: Which articles

    @MainActor
    func testTheQueueIsTheUnreadWorthReadingMostRelevantFirstThenNewest() throws {
        let fixture = try makeFixture()
        let old = article(fixture, "Old but strong", relevance: 0.9, daysAgo: 5)
        let fresh = article(fixture, "Fresh and strong", relevance: 0.9, daysAgo: 1)
        let weak = article(fixture, "Weak", relevance: 0.2)
        _ = article(fixture, "Already read", relevance: 1, read: true)
        _ = article(fixture, "Filtered out", relevance: 1, stage: .triagedOut)
        _ = article(fixture, "Repo doc", relevance: 1, source: fixture.repo)

        let all = try fixture.context.fetch(FetchDescriptor<Article>())
        let queue = withExtendedLifetime(fixture.container) { ArticleBriefing.queue(from: all) }
        XCTAssertEqual(queue.map(\.title), [fresh, old, weak].map(\.title))
    }

    @MainActor
    func testTheQueueIsCappedAtTheLimit() throws {
        let fixture = try makeFixture()
        for index in 0..<20 { _ = article(fixture, "Article \(index)", relevance: Double(index) / 20) }
        let all = try fixture.context.fetch(FetchDescriptor<Article>())
        withExtendedLifetime(fixture.container) {
            XCTAssertEqual(ArticleBriefing.queue(from: all).count, ArticleBriefing.defaultLimit)
            XCTAssertEqual(ArticleBriefing.queue(from: all, limit: 3).map(\.title),
                           ["Article 19", "Article 18", "Article 17"])
            XCTAssertTrue(ArticleBriefing.queue(from: all, limit: 0).isEmpty)
        }
    }

    // MARK: What is said

    @MainActor
    func testEachArticleIsItsOwnGroupWithItsNumberTitleSourceAndGist() throws {
        let fixture = try makeFixture()
        let first = article(fixture, "Speculative decoding", summarized: true)
        let second = article(fixture, "Rust edition", teaser: "A short teaser about the release.")
        let spoken = withExtendedLifetime(fixture.container) {
            ArticleBriefing.segments(for: [first, second], sourceName: { _ in "The Blog" })
        }

        XCTAssertEqual(spoken.map(\.text), [
            "Here are your 2 top unread articles.",
            "Number 1 of 2. Speculative decoding. From The Blog.",
            "A study of Speculative decoding. It finds a big win.",
            "Number 2 of 2. Rust edition. From The Blog.",
            "A short teaser about the release.",
            "That's everything for now.",
        ])
        XCTAssertEqual(spoken.map(\.group), [0, 0, 0, 1, 1, 1])
        XCTAssertEqual(spoken.map(\.id), Array(0..<spoken.count))
        XCTAssertEqual(spoken.map(\.anchor), [.note, .title, .summary, .title, .summary, .note])
    }

    @MainActor
    func testOneArticleAndNothingToBriefOn() throws {
        let fixture = try makeFixture()
        let only = article(fixture, "Only one")
        withExtendedLifetime(fixture.container) {
            let spoken = ArticleBriefing.segments(for: [only], sourceName: { _ in nil })
            XCTAssertEqual(spoken.first?.text, "Here is your unread article.")
            XCTAssertEqual(spoken.map(\.text).dropFirst().first, "Number 1 of 1. Only one.", "no source, no \"From\"")
            XCTAssertTrue(ArticleBriefing.segments(for: []).isEmpty)
        }
    }

    @MainActor
    func testTheGistFallsBackToTheTeaserCutAtASentenceEnd() throws {
        let fixture = try makeFixture()
        let long = "First sentence is here and it goes on for a while so the cut has plenty of room to breathe easily. "
            + String(repeating: "More words follow without end ", count: 12)
        let teased = article(fixture, "Teased", teaser: long)
        let bare = article(fixture, "Bare")
        withExtendedLifetime(fixture.container) {
            let gist = ArticleBriefing.gist(of: teased)
            XCTAssertEqual(gist, "First sentence is here and it goes on for a while so the cut has plenty of room to breathe easily.")
            XCTAssertNil(ArticleBriefing.gist(of: bare), "no summary and no teaser: just the title")
        }
    }

    func testCuttingKeepsWholeWordsAndEndsWithAStop() {
        let text = String(repeating: "word ", count: 100)
        let cut = ArticleBriefing.cut(text, to: 50)
        XCTAssertLessThanOrEqual(cut.count, 51)
        XCTAssertTrue(cut.hasSuffix("."))
        XCTAssertFalse(cut.contains("wor."), "no word is cut in half")
        XCTAssertEqual(ArticleBriefing.cut("Short.", to: 50), "Short.")
        XCTAssertEqual(ArticleBriefing.sentence("No stop"), "No stop.")
        XCTAssertEqual(ArticleBriefing.sentence("Asked?"), "Asked?")
    }

    func testTheCleanerIsAppliedAndAnythingItEmptiesIsLeftOut() throws {
        var builder = SegmentBuilder { $0.replacingOccurrences(of: "*", with: "") }
        builder.add(.title, "**Bold** title", group: 0)
        builder.add(.summary, "***", group: 0)
        XCTAssertEqual(builder.segments.map(\.text), ["Bold title"])
    }

    // MARK: The digest

    func testTheDigestIsReadOneThemeAtATime() {
        let project = DigestCluster.ProjectRef(id: UUID(), name: "Inference stack")
        let other = DigestCluster.ProjectRef(id: UUID(), name: "Home lab")
        let refs = [
            DigestCluster.ArticleRef(id: UUID(), title: "First piece", url: "https://a.example/1"),
            DigestCluster.ArticleRef(id: UUID(), title: "Second piece", url: "https://a.example/2"),
            DigestCluster.ArticleRef(id: UUID(), title: "Third piece", url: "https://a.example/3"),
        ]
        let summarized = DigestCluster(title: "Faster serving", themes: ["vLLM"], nodeIDs: [], articles: refs,
                                       articleCount: 3, mentionCount: 9, novelty: 0.5, relevance: 1, score: 1,
                                       projects: [project, other], summary: "Serving got cheaper.")
        let listed = DigestCluster(title: "", themes: [], nodeIDs: [], articles: Array(refs.prefix(2)),
                                   articleCount: 2, mentionCount: 2, novelty: 0.1, relevance: 0, score: 0.1,
                                   projects: [])
        let digest = Digest(periodStart: .distantPast, periodEnd: .now, clusters: [summarized, listed])

        let spoken = DigestReadout.segments(for: digest)
        XCTAssertEqual(spoken.map(\.text), [
            "Today's digest: 2 themes from 5 articles.",
            "Theme 1: Faster serving.",
            "Serving got cheaper.",
            "Touches Inference stack and Home lab.",
            "Theme 2: New reading.",
            "2 articles. First piece. Second piece.",
            "That's the whole digest.",
        ])
        XCTAssertEqual(spoken.map(\.group), [0, 0, 0, 0, 1, 1, 1])
        XCTAssertTrue(DigestReadout.segments(for: Digest(periodStart: .distantPast, periodEnd: .now, clusters: [])).isEmpty)
    }

    func testNaturalLists() {
        XCTAssertEqual(DigestReadout.naturalList([]), "")
        XCTAssertEqual(DigestReadout.naturalList(["A"]), "A")
        XCTAssertEqual(DigestReadout.naturalList(["A", "B"]), "A and B")
        XCTAssertEqual(DigestReadout.naturalList(["A", "B", "C"]), "A, B and C")
    }

    // MARK: Moving between items

    private func segments(groups: [Int]) -> [ReadoutSegment] {
        groups.enumerated().map { ReadoutSegment(id: $0.offset, anchor: .note, text: "s\($0.offset)", group: $0.element) }
    }

    func testNextGroupJumpsToTheStartOfTheNextItemAndEndsAfterTheLast() {
        var playback = ReadoutPlayback()
        playback.start(segments(groups: [0, 0, 1, 1, 1, 2]))
        XCTAssertEqual(playback.currentGroup, 0)
        XCTAssertEqual(playback.groupPosition?.number, 1)
        XCTAssertEqual(playback.groupPosition?.count, 3)

        playback.nextGroup()
        XCTAssertEqual(playback.index, 2)
        playback.next()
        playback.nextGroup()
        XCTAssertEqual(playback.index, 5)
        XCTAssertEqual(playback.groupPosition?.number, 3)
        playback.nextGroup()
        XCTAssertEqual(playback.status, .finished)
    }

    func testPreviousGroupGoesToTheStartOfTheItemBeforeAndTheFirstStaysPut() {
        var playback = ReadoutPlayback()
        playback.start(segments(groups: [0, 0, 1, 1, 2]))
        playback.nextGroup()
        playback.nextGroup()
        XCTAssertEqual(playback.currentGroup, 2)
        playback.previousGroup()
        XCTAssertEqual(playback.index, 2, "the start of item 1")
        playback.previousGroup()
        XCTAssertEqual(playback.index, 0)
        playback.previousGroup()
        XCTAssertEqual(playback.index, 0)
        XCTAssertEqual(playback.status, .playing)
    }

    func testRestartGroupGoesBackToTheStartOfTheItemAndPlaysAgainWhilePaused() {
        var playback = ReadoutPlayback()
        playback.start(segments(groups: [0, 0, 1, 1, 1]))
        playback.nextGroup()
        playback.next()
        playback.next()
        playback.pause()
        playback.restartGroup()
        XCTAssertEqual(playback.index, 2)
        XCTAssertEqual(playback.status, .playing)
    }

    func testGroupMovesDoNothingWhenNothingIsPlaying() {
        var playback = ReadoutPlayback()
        playback.nextGroup()
        playback.previousGroup()
        playback.restartGroup()
        XCTAssertEqual(playback.status, .idle)
        playback.start(segments(groups: [0]))
        playback.stop()
        playback.nextGroup()
        XCTAssertEqual(playback.status, .idle)
    }

    func testReplacingTheCurrentItemKeepsTheOthersAndRenumbers() {
        var playback = ReadoutPlayback()
        playback.start(segments(groups: [0, 0, 1, 1, 2]))
        playback.nextGroup()
        playback.next()
        let full = (0..<3).map { ReadoutSegment(id: 99, anchor: .paragraph($0), text: "full\($0)") }
        playback.replaceCurrentGroup(with: full)

        XCTAssertEqual(playback.segments.map(\.text), ["s0", "s1", "full0", "full1", "full2", "s4"])
        XCTAssertEqual(playback.segments.map(\.id), Array(0..<6))
        XCTAssertEqual(playback.segments.map(\.group), [0, 0, 1, 1, 1, 2], "the replacement takes the item's place")
        XCTAssertEqual(playback.index, 2, "and starts from the top")
        XCTAssertEqual(playback.groupPosition?.count, 3)

        playback.replaceCurrentGroup(with: [])
        XCTAssertEqual(playback.segments.count, 6, "an empty replacement changes nothing")
    }
}
