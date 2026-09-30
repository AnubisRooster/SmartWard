import XCTest
import SwiftData
import KnowledgeStore
@testable import Pipeline

/// What "read this article to me" says, and where it is while it does.
final class ArticleReadoutTests: XCTestCase {
    private let english = Locale(identifier: "en_US")
    private let utc = TimeZone(identifier: "UTC")!
    /// 15 January 2027, 08:00 UTC.
    private let published = Date(timeIntervalSince1970: 1_800_000_000)

    /// 94 characters, starting with a capital like real prose: sentence
    /// splitting doesn't break before a lowercase word.
    private let longSentence = "Abcdefghi " + String(repeating: "abcdefghi ", count: 8) + "end."

    private struct Fixture {
        /// Kept so the store outlives the context.
        let container: ModelContainer
        let article: Article
    }

    @MainActor
    private func makeFixture(text: String = "First paragraph.\n\nSecond paragraph.", withSummary: Bool = true,
                             themes: [String] = [], scored: Bool = true, stage: ArticleStage = .linked) throws -> Fixture {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        let context = container.mainContext
        let source = Source(kind: "rss", url: "https://blog.example/feed", title: "The Blog")
        context.insert(source)
        let article = Article(canonicalURL: "https://blog.example/a", title: "Speculative decoding in vLLM",
                              cleanedText: text)
        article.source = source
        article.byline = "Ada Lovelace"
        article.publishedAt = published
        article.stage = stage
        article.relevance = scored ? 0.72 : Triage.neutralScore
        article.relevanceReason = scored ? "Matches Inference stack" : ""
        context.insert(article)

        if withSummary {
            let draft = ArticleSummary.Draft(about: ["Speculative decoding in vLLM"],
                                             says: ["A small model drafts tokens."],
                                             matters: ["Cheaper serving."],
                                             remember: ["Needs a draft model."])
            let summary = ArticleSummary(draft: draft, fingerprint: ArticleSummary.fingerprint(of: text),
                                         partial: false, writtenBy: "On this device")
            article.summaryJSON = try summary.encoded()
        }
        for (index, label) in themes.enumerated() {
            let chunk = KnowledgeStore.Chunk(text: label, ordinal: index)
            article.chunks?.append(chunk)
            let node = ThemeNode(type: "concept", canonicalLabel: label)
            context.insert(node)
            let mention = Mention()
            mention.node = node
            chunk.mentions?.append(mention)
        }
        try context.save()
        return Fixture(container: container, article: article)
    }

    @MainActor
    private func segments(_ fixture: Fixture, scope: ReadoutScope = .whole,
                          clean: @escaping (String) -> String = { $0 }) -> [ReadoutSegment] {
        withExtendedLifetime(fixture.container) {
            ArticleReadout.segments(for: fixture.article, scope: scope, sourceName: "The Blog", clean: clean,
                                    locale: english, timeZone: utc)
        }
    }

    // MARK: What is said

    @MainActor
    func testTheWholeArticleIsReadInTheOrderTheScreenShowsIt() throws {
        let fixture = try makeFixture(themes: ["Speculative decoding", "vLLM"])
        let spoken = segments(fixture)

        XCTAssertEqual(spoken.map(\.anchor),
                       [.title, .details, .summary, .summary, .summary, .summary, .themes, .relevance,
                        .paragraph(0), .paragraph(1)])
        XCTAssertEqual(spoken.map(\.id), Array(0..<spoken.count), "numbered in order")
        XCTAssertEqual(spoken.map(\.text), [
            "Speculative decoding in vLLM",
            "From The Blog. By Ada Lovelace. Published January 15, 2027.",
            "Summary. What is this about? Speculative decoding in vLLM.",
            "What is it saying? A small model drafts tokens.",
            "Why does it matter? Cheaper serving.",
            "What should I remember? Needs a draft model.",
            "Themes: Speculative decoding, vLLM.",
            "Relevance 72 percent. Matches Inference stack.",
            "First paragraph.",
            "Second paragraph.",
        ])
    }

    @MainActor
    func testTheSummaryAloneIsTheTitleAndTheAnswers() throws {
        let fixture = try makeFixture(themes: ["vLLM"])
        XCTAssertEqual(segments(fixture, scope: .summaryOnly).map(\.anchor),
                       [.title, .summary, .summary, .summary, .summary])

        let none = try makeFixture(withSummary: false)
        let spoken = segments(none, scope: .summaryOnly)
        XCTAssertEqual(spoken.map(\.anchor), [.title, .note])
        XCTAssertEqual(spoken.last?.text, "There isn't a summary for this article yet.")
    }

    @MainActor
    func testWhatIsMissingIsLeftOutRatherThanAnnounced() throws {
        let fixture = try makeFixture(withSummary: false, scored: false)
        XCTAssertEqual(segments(fixture).map(\.anchor), [.title, .details, .paragraph(0), .paragraph(1)],
                       "no summary, themes or real relevance score: just the article")
    }

    @MainActor
    func testThemesAreNamedOnceEachAndNoMoreThanEight() throws {
        let labels = (1...10).map { "Theme \($0)" }
        let fixture = try makeFixture(withSummary: false, themes: labels, scored: false)
        let themes = try XCTUnwrap(segments(fixture).first { $0.anchor == .themes })
        XCTAssertEqual(themes.text, "Themes: " + labels.prefix(8).joined(separator: ", ") + ".")
    }

    @MainActor
    func testTextIsCleanedForSpeechAndNothingIsSaidForWhatCleaningEmpties() throws {
        let fixture = try makeFixture(text: "**Alpha** here.\n\n***\n\nBeta.", withSummary: false, scored: false)
        let spoken = segments(fixture) { text in
            text.replacingOccurrences(of: "*", with: "").trimmingCharacters(in: .whitespacesAndNewlines)
        }
        let body = spoken.filter { if case .paragraph = $0.anchor { return true } else { return false } }
        XCTAssertEqual(body.map(\.text), ["Alpha here.", "Beta."])
        XCTAssertEqual(body.map(\.anchor), [.paragraph(0), .paragraph(2)],
                       "each keeps its own paragraph on screen, so the screen scrolls to the right one")
        XCTAssertEqual(spoken.map(\.id), Array(0..<spoken.count))
    }

    @MainActor
    func testAnItemWithNoTextSaysSoUnlessItsStillWaitingForItsText() throws {
        let headlineOnly = try makeFixture(text: "", withSummary: false, scored: false)
        XCTAssertEqual(segments(headlineOnly).map(\.anchor), [.title, .details, .note])
        XCTAssertEqual(segments(headlineOnly).last?.text, "Only the headline was saved for this item.")

        let waiting = try makeFixture(text: "", withSummary: false, scored: false, stage: .fetched)
        XCTAssertEqual(segments(waiting).map(\.anchor), [.title, .details], "the reader offers to load it instead")
    }

    @MainActor
    func testTheReaderAndTheReadoutSplitParagraphsTheSameWay() throws {
        let fixture = try makeFixture(text: "One.\n\n\n\nTwo.\n\nThree.", withSummary: false, scored: false)
        XCTAssertEqual(ArticleReadout.paragraphs(of: fixture.article), ["One.", "Two.", "Three."])

        let teaser = try makeFixture(text: "", withSummary: false, scored: false)
        teaser.article.summary = "A teaser.\n\nMore teaser."
        XCTAssertEqual(ArticleReadout.paragraphs(of: teaser.article), ["A teaser.", "More teaser."],
                       "without saved text, the teaser is what the reader shows")
    }

    // MARK: Long paragraphs

    @MainActor
    func testALongParagraphIsSaidInPiecesCutBetweenSentences() {
        let sentence = longSentence
        let paragraph = Array(repeating: sentence, count: 10).joined(separator: " ")
        let pieces = ArticleReadout.pieces(of: paragraph)

        XCTAssertGreaterThanOrEqual(pieces.count, 2)
        XCTAssertTrue(pieces.allSatisfy { $0.count <= ArticleReadout.maxSegmentLength })
        XCTAssertTrue(pieces.allSatisfy { $0.hasSuffix("end.") }, "cut at sentence ends")
        XCTAssertEqual(pieces.joined(separator: " "), paragraph, "nothing lost or repeated")

        XCTAssertEqual(ArticleReadout.pieces(of: "Short.").count, 1)
        XCTAssertTrue(ArticleReadout.pieces(of: "  \n ").isEmpty)
        let oneLongSentence = String(repeating: "a ", count: 500)
        XCTAssertEqual(ArticleReadout.pieces(of: oneLongSentence).count, 1, "a sentence isn't cut in the middle")
    }

    @MainActor
    func testPiecesOfOneParagraphShareItsPlaceOnScreen() throws {
        let sentence = longSentence
        let text = Array(repeating: sentence, count: 10).joined(separator: " ")
        let fixture = try makeFixture(text: text, withSummary: false, scored: false)
        let body = segments(fixture).filter { $0.anchor != .title && $0.anchor != .details }
        XCTAssertGreaterThanOrEqual(body.count, 2)
        XCTAssertTrue(body.allSatisfy { $0.anchor == .paragraph(0) })
    }
}

/// Where a read-aloud is: playing, paused, skipping, over.
final class ReadoutPlaybackTests: XCTestCase {
    private func segments(_ count: Int) -> [ReadoutSegment] {
        (0..<count).map { ReadoutSegment(id: $0, anchor: .paragraph($0), text: "s\($0)") }
    }

    func testItPlaysThroughAndFinishes() {
        var playback = ReadoutPlayback()
        XCTAssertEqual(playback.status, .idle)
        XCTAssertNil(playback.current)

        playback.start(segments(3))
        XCTAssertEqual(playback.status, .playing)
        XCTAssertEqual(playback.current?.text, "s0")
        XCTAssertEqual(playback.position.number, 1)
        XCTAssertEqual(playback.position.count, 3)

        playback.segmentFinished()
        playback.segmentFinished()
        XCTAssertEqual(playback.current?.text, "s2")
        playback.segmentFinished()
        XCTAssertEqual(playback.status, .finished)
        XCTAssertNil(playback.current)
        XCTAssertFalse(playback.isActive)
    }

    func testPauseHoldsThePlaceAndKeepGoingCarriesOn() {
        var playback = ReadoutPlayback()
        playback.start(segments(3))
        playback.segmentFinished()
        playback.pause()
        XCTAssertEqual(playback.status, .paused)
        XCTAssertEqual(playback.current?.text, "s1", "still there, waiting")
        XCTAssertTrue(playback.isActive)

        playback.segmentFinished()
        XCTAssertEqual(playback.current?.text, "s1", "a finish that arrives late doesn't move it while paused")

        playback.resume()
        XCTAssertEqual(playback.status, .playing)
        XCTAssertEqual(playback.current?.text, "s1")

        playback.resume()
        playback.pause()
        playback.pause()
        XCTAssertEqual(playback.status, .paused, "repeating a command changes nothing")
    }

    func testSkippingMovesAndPlaysEvenFromPause() {
        var playback = ReadoutPlayback()
        playback.start(segments(3))
        playback.pause()
        playback.next()
        XCTAssertEqual(playback.status, .playing)
        XCTAssertEqual(playback.current?.text, "s1")

        playback.previous()
        XCTAssertEqual(playback.current?.text, "s0")
        playback.previous()
        XCTAssertEqual(playback.current?.text, "s0", "can't go back past the start")

        playback.next()
        playback.next()
        XCTAssertEqual(playback.current?.text, "s2")
        playback.next()
        XCTAssertEqual(playback.status, .finished, "skipping the last one ends it")
    }

    func testStopClearsEverythingAndIdleIgnoresControls() {
        var playback = ReadoutPlayback()
        playback.next()
        playback.previous()
        playback.pause()
        playback.resume()
        playback.segmentFinished()
        XCTAssertEqual(playback.status, .idle, "nothing to control")

        playback.start(segments(2))
        playback.stop()
        XCTAssertEqual(playback.status, .idle)
        XCTAssertTrue(playback.segments.isEmpty)
        XCTAssertNil(playback.current)
    }

    func testNothingToSayFinishesAtOnce() {
        var playback = ReadoutPlayback()
        playback.start([])
        XCTAssertEqual(playback.status, .finished)
        XCTAssertFalse(playback.isActive)
    }
}
