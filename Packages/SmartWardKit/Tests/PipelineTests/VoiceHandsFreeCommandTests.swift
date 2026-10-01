import XCTest
@testable import Pipeline

/// "Read the first article" from the list, and hands-free mode (no wake word
/// while the app is open, except while it's reading aloud).
final class VoiceHandsFreeCommandTests: XCTestCase {
    static let items = ["Speculative decoding in vLLM", "Why agents fail", "Rust 2027 edition", "Sourdough starter tips"]

    let listed = VoiceContext(tab: .reading, items: VoiceHandsFreeCommandTests.items)
    let articleOpen = VoiceContext(isReaderOpen: true)
    let projectOpen = VoiceContext(tab: .projects, isProjectOpen: true)
    let handsFree = VoiceContext(tab: .reading, isHandsFree: true, items: VoiceHandsFreeCommandTests.items)
    let handsFreeReading = VoiceContext(tab: .reading, isReaderOpen: true, isReading: true, isHandsFree: true,
                                        spokenNow: "First paragraph of the article.",
                                        items: VoiceHandsFreeCommandTests.items)

    private func check(_ heard: String, _ context: VoiceContext, _ expected: VoiceParse,
                       file: StaticString = #filePath, line: UInt = #line) {
        XCTAssertEqual(VoiceCommandParser.parse(heard, context: context), expected, "\u{201C}\(heard)\u{201D}",
                       file: file, line: line)
    }

    func testReadAnArticleFromTheList() {
        check("smartward read the first article", listed, .command(.readItem(1, summaryOnly: false)))
        check("smartward read me the second one", listed, .command(.readItem(2, summaryOnly: false)))
        check("smartward read number 3", listed, .command(.readItem(3, summaryOnly: false)))
        check("smartward play the first one", listed, .command(.readItem(1, summaryOnly: false)))
        check("smartward read the last one", listed, .command(.readItem(4, summaryOnly: false)))
        check("smartward read article four", listed, .command(.readItem(4, summaryOnly: false)))
        check("smartward read the summary of the first one", listed, .command(.readItem(1, summaryOnly: true)))
        check("smartward summarize the second article", listed, .command(.readItem(2, summaryOnly: true)))
        check("smartward read the article about agents", listed, .command(.readItem(2, summaryOnly: false)))
        check("smartward read me the rust article", listed, .command(.readItem(3, summaryOnly: false)))
        check("smartward read the one about sourdough", listed, .command(.readItem(4, summaryOnly: false)))
        check("smartward read the article about kubernetes", listed, .command(.readMatching("kubernetes", summaryOnly: false)))
    }

    func testReadStillMeansWhatItMeant() {
        check("smartward read this article", articleOpen, .command(.readAloud(summaryOnly: false)))
        check("smartward read the summary", articleOpen, .command(.readAloud(summaryOnly: true)))
        check("smartward read the brief", projectOpen, .command(.readBrief))
        check("smartward read today's digest", listed, .command(.readDigest))
        check("smartward read my news", listed, .command(.startBriefing))
        check("smartward read something nice", listed, .unrecognized("read something nice"))
    }

    func testHandsFreeNeedsNoWakeWord() {
        check("read the first article", handsFree, .command(.readItem(1, summaryOnly: false)))
        check("open starred", handsFree, .command(.showFilter(.starred)))
        check("go to projects", handsFree, .command(.openTab(.projects)))
        check("brief me", handsFree, .command(.startBriefing))
        check("could you please open the second one", handsFree, .command(.openItem(2)))
        check("smartward open reading", handsFree, .command(.openTab(.reading)))
    }

    func testHandsFreePassesWhatItDoesNotKnowOn() {
        check("is there anything new on kubernetes", handsFree, .unrecognized("is there anything new on kubernetes"))
        check("what is going on with the rust thing", handsFree, .unrecognized("what is going on with the rust thing"))
    }

    func testHandsFreeIgnoresLoneWordsAndPleasantries() {
        check("okay", handsFree, .ignored)
        check("hmm", handsFree, .ignored)
        check("thanks", handsFree, .ignored)
        check("please", handsFree, .ignored)
        check("yeah", handsFree, .ignored)
    }

    func testHandsFreeWhileReadingOnlyTakesTheControlWords() {
        check("pause", handsFreeReading, .command(.pauseReading))
        check("next", handsFreeReading, .command(.nextSection))
        check("read the first article", handsFreeReading, .ignored)
        check("open projects", handsFreeReading, .ignored)
        check("smartward read the first article", handsFreeReading, .command(.readItem(1, summaryOnly: false)))
    }

    func testWithoutHandsFreeTheWakeWordIsStillNeeded() {
        check("read the first article", listed, .ignored)
        check("open starred", listed, .ignored)
    }

    func testHandsFreeHelpLeavesOutTheWakeWord() {
        XCTAssertTrue(VoiceCommandHelp.spoken(for: handsFree).hasPrefix("Say read the first article"))
        XCTAssertFalse(VoiceCommandHelp.spoken(for: handsFree).contains("SmartWard"))
        XCTAssertTrue(VoiceCommandHelp.spoken(for: listed).hasPrefix("Say SmartWard, read the first article"))
    }

    func testReadingAnArticleSaysWhichOne() {
        XCTAssertEqual(VoiceCommand.readItem(2, summaryOnly: false).confirmation, "Reading number 2")
        XCTAssertEqual(VoiceCommand.readItem(1, summaryOnly: true).confirmation, "Reading the summary of number 1")
        XCTAssertFalse(VoiceCommand.readItem(1, summaryOnly: false).needsConfirmation)
    }
}
