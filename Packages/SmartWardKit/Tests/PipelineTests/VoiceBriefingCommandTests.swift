import XCTest
@testable import Pipeline

/// Hands-free reading: "SmartWard, brief me", then "next", "tell me more",
/// "dismiss" with no wake word while the briefing plays.
final class VoiceBriefingCommandTests: XCTestCase {
    let plain = VoiceContext()
    let readingTab = VoiceContext(tab: .reading)
    let articleOpen = VoiceContext(isReaderOpen: true)
    let readingAloud = VoiceContext(tab: .reading, isReaderOpen: true, isReading: true,
                                    spokenNow: "First paragraph of the article.")
    let briefing = VoiceContext(isReading: true, isBriefing: true,
                                spokenNow: "Number 2 of 5. Why agents fail. From Example.")
    let briefingSaysTellMeMore = VoiceContext(isReading: true, isBriefing: true,
                                              spokenNow: "Please tell me more about this.")

    private func check(_ heard: String, _ context: VoiceContext, _ expected: VoiceParse,
                       file: StaticString = #filePath, line: UInt = #line) {
        XCTAssertEqual(VoiceCommandParser.parse(heard, context: context), expected, "\u{201C}\(heard)\u{201D}",
                       file: file, line: line)
    }

    func testStartABriefing() {
        check("smartward brief me", plain, .command(.startBriefing))
        check("SmartWard, give me my briefing", plain, .command(.startBriefing))
        check("smartward read my news", plain, .command(.startBriefing))
        check("smartward catch me up", plain, .command(.startBriefing))
        check("smartward could you please read me the news", plain, .command(.startBriefing))
        check("smartward what's new", plain, .command(.startBriefing))
        check("smartward start the briefing", plain, .command(.startBriefing))
    }

    func testReadTheDigest() {
        check("smartward read the digest", plain, .command(.readDigest))
        check("smartward read today's digest", plain, .command(.readDigest))
    }

    func testNextAndPreviousArticleInABriefing() {
        check("smartward next", briefing, .command(.nextArticle))
        check("smartward skip", briefing, .command(.nextArticle))
        check("smartward next article", briefing, .command(.nextArticle))
        check("smartward next story", briefing, .command(.nextArticle))
        check("smartward move on", briefing, .command(.nextArticle))
        check("smartward previous", briefing, .command(.previousArticle))
        check("smartward go back", briefing, .command(.previousArticle))
        check("smartward previous article", briefing, .command(.previousArticle))
        check("smartward last story", briefing, .command(.previousArticle))
        check("smartward next section", briefing, .command(.nextSection))
        check("smartward repeat that", briefing, .command(.repeatItem))
        check("smartward say that again", briefing, .command(.repeatItem))
    }

    func testOutsideABriefingTheOldMeaningsHold() {
        check("smartward next", readingAloud, .command(.nextSection))
        check("smartward repeat that", readingAloud, .command(.previousSection))
        check("smartward go back", readingAloud, .command(.previousSection))
        check("smartward next article", readingAloud, .command(.nextArticle))
    }

    func testBareControlsInABriefing() {
        check("next", briefing, .command(.nextArticle))
        check("Skip.", briefing, .command(.nextArticle))
        check("next article", briefing, .command(.nextArticle))
        check("previous", briefing, .command(.previousArticle))
        check("repeat", briefing, .command(.repeatItem))
        check("repeat that", briefing, .command(.repeatItem))
        check("go back", briefing, .command(.previousArticle))
        check("pause", briefing, .command(.pauseReading))
        check("keep going", briefing, .command(.resumeReading))
        check("tell me more", briefing, .command(.readFullItem))
        check("read this one", briefing, .command(.readFullItem))
        check("star it", briefing, .command(.star(true)))
        check("dismiss", briefing, .command(.dismiss))
        check("mark as read", briefing, .command(.dismiss))
        check("faster", briefing, .command(.setSpeed(.faster)))
        check("slower", briefing, .command(.setSpeed(.slower)))
        check("slow down", briefing, .command(.setSpeed(.slower)))
        check("normal speed", briefing, .command(.setSpeed(.normal)))
    }

    func testBareControlsNeedAReading() {
        check("next article", readingTab, .ignored)
        check("tell me more", readingTab, .ignored)
        check("dismiss", readingTab, .ignored)
        check("faster", readingTab, .ignored)
        check("star it", readingTab, .ignored)
        check("brief me", readingTab, .ignored)
        check("mark as read", readingTab, .ignored)
    }

    func testBareButOnlyWhatIsNotBeingSaid() {
        check("tell me more", briefingSaysTellMeMore, .ignored)
    }

    func testSingleArticleReadMore() {
        check("smartward read this one", articleOpen, .command(.readAloud(summaryOnly: false)))
        check("smartward tell me more", articleOpen, .command(.readAloud(summaryOnly: false)))
        check("smartward read this article", briefing, .command(.readFullItem))
        check("smartward read the whole thing", briefing, .command(.readFullItem))
        check("smartward read the summary", briefing, .command(.readAloud(summaryOnly: true)))
    }

    func testDismissAndMarkUnreadAndLoad() {
        check("smartward dismiss this article", articleOpen, .command(.dismiss))
        check("smartward not interested", articleOpen, .command(.dismiss))
        check("smartward mark it unread", articleOpen, .command(.markUnread))
        check("smartward keep this unread", articleOpen, .command(.markUnread))
        check("smartward load the full article", articleOpen, .command(.loadFullArticle))
        check("smartward get the full text", articleOpen, .command(.loadFullArticle))
    }

    func testSpeed() {
        check("smartward speak faster", plain, .command(.setSpeed(.faster)))
        check("smartward speed up", plain, .command(.setSpeed(.faster)))
        check("smartward read slower", plain, .command(.setSpeed(.slower)))
        check("smartward slow down please", plain, .command(.setSpeed(.slower)))
        check("smartward normal speed", plain, .command(.setSpeed(.normal)))
        check("smartward reset speed", plain, .command(.setSpeed(.normal)))
    }

    func testCloseStillGoesBack() {
        check("smartward close this", briefing, .command(.back))
    }

    func testHelpMentionsTheBriefing() {
        XCTAssertTrue(VoiceCommandHelp.lines(for: plain).contains("SmartWard, brief me"))
        let lines = VoiceCommandHelp.lines(for: briefing)
        XCTAssertTrue(lines.first?.hasPrefix("Next, previous, repeat, tell me more") == true)
    }

    func testTheNewCommandsHaveShortConfirmations() {
        XCTAssertEqual(VoiceCommand.startBriefing.confirmation, "Starting your briefing")
        XCTAssertEqual(VoiceCommand.nextArticle.confirmation, "Next article")
        XCTAssertEqual(VoiceCommand.dismiss.confirmation, "Dismissed")
        XCTAssertEqual(VoiceCommand.setSpeed(.slower).confirmation, "Slower")
    }
}
