import XCTest
@testable import Pipeline

/// "SmartWard, open Reading": what was said, and what it means for what's
/// on screen.
final class VoiceCommandTests: XCTestCase {
    static let items = ["Speculative decoding in vLLM", "Why agents fail", "Rust 2027 edition", "Sourdough starter tips"]
    static let projects = ["Inference stack", "Home lab"]

    let plain = VoiceContext()
    let readingTab = VoiceContext(tab: .reading)
    let readingList = VoiceContext(tab: .reading, items: VoiceCommandTests.items, projects: VoiceCommandTests.projects)
    let articleOpen = VoiceContext(isReaderOpen: true)
    let readerOpenNotReading = VoiceContext(tab: .reading, isReaderOpen: true)
    let readingAloud = VoiceContext(tab: .reading, isReaderOpen: true, isReading: true,
                                    spokenNow: "First paragraph of the article.")
    let echoRisk = VoiceContext(isReading: true, spokenNow: "We need to stop the process before we continue.")
    let armed = VoiceContext(isArmed: true)

    private func check(_ heard: String, _ context: VoiceContext, _ expected: VoiceParse,
                       file: StaticString = #filePath, line: UInt = #line) {
        XCTAssertEqual(VoiceCommandParser.parse(heard, context: context), expected, "\u{201C}\(heard)\u{201D}",
                       file: file, line: line)
    }

    func testTheWakeWordAndItsVariantsAddressTheApp() {
        check("SmartWard, open Reading.", plain, .command(.openTab(.reading)))
        check("smart ward open reading", plain, .command(.openTab(.reading)))
        check("Hey SmartWard, go to reading", plain, .command(.openTab(.reading)))
        check("OK smartward show me the reading tab", plain, .command(.openTab(.reading)))
        check("Smart word open my articles", plain, .command(.openTab(.reading)))
        check("SmartWard", plain, .wakeOnly)
        check("Hey Smart Ward.", plain, .wakeOnly)
        check("smartward please", plain, .wakeOnly)
    }

    func testWithoutTheWakeWordNothingHappens() {
        check("open reading", plain, .ignored)
        check("what a nice day", plain, .ignored)
        check("", plain, .ignored)
        check(".", plain, .ignored)
        check("the article says we should stop", plain, .ignored)
    }

    func testTabsByName() {
        check("SmartWard open today", plain, .command(.openTab(.today)))
        check("SmartWard, show me the digest", plain, .command(.openTab(.today)))
        check("smartward go to the graph tab", plain, .command(.openTab(.graph)))
        check("smartward knowledge graph", plain, .command(.openTab(.graph)))
        check("smartward chats", plain, .command(.openTab(.chat)))
        check("smartward open the strategist", plain, .command(.openTab(.chat)))
        check("smartward open projects", plain, .command(.openTab(.projects)))
        check("smartward, my projects", plain, .command(.openTab(.projects)))
        check("smartward reading", plain, .command(.openTab(.reading)))
        check("smartward take me to the news", plain, .command(.openTab(.reading)))
        check("smartward bring up the daily digest", plain, .command(.openTab(.today)))
    }

    func testPolitenessIsIgnored() {
        check("SmartWard, could you please open reading now", plain, .command(.openTab(.reading)))
        check("smartward can you please show me projects for me", plain, .command(.openTab(.projects)))
    }

    func testFiltersAndSortOrder() {
        check("smartward show unread", readingTab, .command(.showFilter(.unread)))
        check("smartward starred", readingTab, .command(.showFilter(.starred)))
        check("smartward show my starred articles", readingTab, .command(.showFilter(.starred)))
        check("smartward show favorites", readingTab, .command(.showFilter(.starred)))
        check("smartward show all articles", readingTab, .command(.showFilter(.all)))
        check("smartward show all", readingTab, .command(.showFilter(.all)))
        check("smartward everything", readingTab, .command(.showFilter(.all)))
        check("smartward all", readingTab, .command(.showFilter(.all)))
        check("smartward all", plain, .unrecognized("all"))
        check("smartward sort by relevance", plain, .command(.sortBy(.mostRelevant)))
        check("smartward newest first", plain, .command(.sortBy(.newest)))
    }

    func testArticlesByPosition() {
        check("smartward open the second one", readingList, .command(.openItem(2)))
        check("smartward open number 3", readingList, .command(.openItem(3)))
        check("smartward open article four", readingList, .command(.openItem(4)))
        check("smartward open the 1st article", readingList, .command(.openItem(1)))
        check("smartward open the third article", readingList, .command(.openItem(3)))
        check("smartward open item 2", readingList, .command(.openItem(2)))
        check("smartward open #3", readingList, .command(.openItem(3)))
        check("smartward go to the fourth one", readingList, .command(.openItem(4)))
        check("smartward open the last one", readingList, .command(.openLastItem))
    }

    func testArticlesByTheirWords() {
        check("smartward open the article about agents", readingList, .command(.openItem(2)))
        check("smartward open speculative decoding", readingList, .command(.openItem(1)))
        check("smartward open the one about sourdough", readingList, .command(.openItem(4)))
        check("smartward show me the rust article", readingList, .command(.openItem(3)))
        check("smartward open the one about kubernetes", readingList, .command(.openMatching("kubernetes")))
        check("smartward open the article about speculative decoding in vllm", readingList, .command(.openItem(1)))
    }

    func testProjectsByName() {
        check("smartward open project inference", readingList, .command(.openProject("Inference stack")))
        check("smartward open the project called home lab", readingList, .command(.openProject("Home lab")))
        check("smartward show project zebra", readingList, .command(.openProject("zebra")))
    }

    func testReadingControlsWithTheWakeWord() {
        check("smartward pause", readingAloud, .command(.pauseReading))
        check("smartward stop", readingAloud, .command(.pauseReading))
        check("smartward keep going", readingAloud, .command(.resumeReading))
        check("smartward continue", readingAloud, .command(.resumeReading))
        check("smartward next", readingAloud, .command(.nextSection))
        check("smartward skip", readingAloud, .command(.nextSection))
        check("smartward previous", readingAloud, .command(.previousSection))
        check("smartward stop reading", readingAloud, .command(.stopReading))
        check("smartward that's enough", readingAloud, .command(.stopReading))
        check("smartward go back", readingAloud, .command(.previousSection))
        check("smartward repeat that", readingAloud, .command(.previousSection))
    }

    func testControlWordsNeedNoWakeWordWhileReading() {
        check("pause", readingAloud, .command(.pauseReading))
        check("Stop.", readingAloud, .command(.pauseReading))
        check("keep going", readingAloud, .command(.resumeReading))
        check("Next", readingAloud, .command(.nextSection))
        check("previous", readingAloud, .command(.previousSection))
        check("stop reading", readingAloud, .command(.stopReading))
        check("go back", readingAloud, .command(.previousSection))
        check("hold on", readingAloud, .command(.pauseReading))
        check("resume", readingAloud, .command(.resumeReading))
    }

    func testControlWordsAloneDoNothingWhenNothingIsBeingRead() {
        check("pause", readerOpenNotReading, .ignored)
        check("stop", readerOpenNotReading, .ignored)
        check("next", readerOpenNotReading, .ignored)
        check("keep going", readerOpenNotReading, .ignored)
        check("go back", readerOpenNotReading, .ignored)
    }

    func testAControlWordTheVoiceIsSayingIsTheEcho() {
        check("stop", echoRisk, .ignored)
        check("continue", echoRisk, .ignored)
        check("pause", echoRisk, .command(.pauseReading))
        check("smartward stop", echoRisk, .command(.pauseReading))
    }

    func testOtherPhrasesWithoutTheWakeWordAreStillIgnoredWhileReading() {
        check("open reading", readingAloud, .ignored)
        check("the process starts here", readingAloud, .ignored)
    }

    func testBackMeansBackAScreenUnlessItIsReading() {
        check("smartward go back", readingTab, .command(.back))
        check("smartward back", plain, .command(.back))
        check("smartward close this", readingAloud, .command(.back))
    }

    func testAfterJustTheWakeWordThePhraseNeedsNoPrefix() {
        check("open reading", armed, .command(.openTab(.reading)))
        check("smartward open reading", armed, .command(.openTab(.reading)))
        check("make me a sandwich", armed, .unrecognized("make me a sandwich"))
        check("go to nowhere land", armed, .command(.openMatching("nowhere land")))
    }

    func testReadingStarringRefreshingHelpAndStopping() {
        check("smartward read this article", articleOpen, .command(.readAloud(summaryOnly: false)))
        check("smartward read it to me", articleOpen, .command(.readAloud(summaryOnly: false)))
        check("smartward read the summary", articleOpen, .command(.readAloud(summaryOnly: true)))
        check("smartward read me the summary", articleOpen, .command(.readAloud(summaryOnly: true)))
        check("smartward star this", articleOpen, .command(.star(true)))
        check("smartward unstar this", articleOpen, .command(.star(false)))
        check("smartward refresh", readingList, .command(.refresh))
        check("smartward check for new articles", readingList, .command(.refresh))
        check("smartward what can I say?", plain, .command(.help))
        check("smartward help", plain, .command(.help))
        check("smartward stop listening", plain, .command(.stopListening))
        check("smartward turn off voice", plain, .command(.stopListening))
    }

    func testWhatItDoesntDoIsSaidBack() {
        check("SmartWard, make me a sandwich", plain, .unrecognized("make me a sandwich"))
        check("smartward open", plain, .unrecognized("open"))
    }

    // MARK: Matching, echo, help

    func testTheClosestTitleWinsWhenMostOfTheWordsMatch() {
        let items = VoiceCommandTests.items
        XCTAssertEqual(VoiceItemMatcher.best("agent", in: items), 1, "a word also matches the start of a longer one")
        XCTAssertEqual(VoiceItemMatcher.best("decoding vllm", in: items), 0)
        XCTAssertNil(VoiceItemMatcher.best("kubernetes", in: items))
        XCTAssertNil(VoiceItemMatcher.best("", in: items))
        XCTAssertNil(VoiceItemMatcher.best("the article", in: items), "filler words alone name nothing")
        XCTAssertNil(VoiceItemMatcher.best("decoding kubernetes", in: items), "half the words isn't enough")
        XCTAssertEqual(VoiceItemMatcher.best("starter", in: ["Starter kit", "Starter kit"]), 0, "the earliest wins a tie")
    }

    func testAPhraseThatIsJustWhatWasBeingSaidIsTheEcho() {
        let spoken = ["We need to stop the process before we continue.", "Second paragraph."]
        XCTAssertTrue(EchoGuard.isEcho("stop the process before", of: spoken))
        XCTAssertTrue(EchoGuard.isEcho("We need to STOP the process", of: spoken), "case and punctuation don't matter")
        XCTAssertFalse(EchoGuard.isEcho("open the reading tab", of: spoken))
        XCTAssertFalse(EchoGuard.isEcho("stop", of: spoken), "one word says nothing about where it came from")
        XCTAssertFalse(EchoGuard.isEcho("stop the", of: spoken), "nor do two")
        XCTAssertFalse(EchoGuard.isEcho("the process we need", of: spoken), "the same words in another order are you")
        XCTAssertFalse(EchoGuard.isEcho("anything at all here", of: []))
    }

    func testHelpFitsWhatIsOnScreen() {
        let reading = VoiceCommandHelp.lines(for: readingAloud)
        XCTAssertTrue(reading.first?.hasPrefix("Pause, keep going") == true, "what works right now comes first")
        XCTAssertTrue(reading.contains("SmartWard, read the summary"))
        XCTAssertTrue(reading.contains("SmartWard, open the second one"))

        let lines = VoiceCommandHelp.lines(for: plain)
        XCTAssertFalse(lines.contains("SmartWard, read the summary"))
        XCTAssertFalse(lines.contains { $0.hasPrefix("Pause") })
        XCTAssertTrue(lines.contains("SmartWard, what can I say?"))
        XCTAssertTrue(VoiceCommandHelp.spoken(for: plain).hasPrefix("Say SmartWard, open Reading"))
    }

    func testEveryCommandHasAShortConfirmation() {
        XCTAssertEqual(VoiceCommand.openTab(.graph).confirmation, "Opening Graph")
        XCTAssertEqual(VoiceCommand.pauseReading.confirmation, "Paused")
        XCTAssertEqual(VoiceCommand.openItem(2).confirmation, "Opening number 2")
        XCTAssertEqual(VoiceCommand.star(false).confirmation, "Unstarred")
        XCTAssertEqual(VoiceCommand.showFilter(.starred).confirmation, "Showing starred")
    }
}
