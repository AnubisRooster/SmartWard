import XCTest
@testable import Pipeline

/// Free wording turned into a phrase the grammar knows.
final class VoiceRephraseTests: XCTestCase {
    private let screen = VoiceContext(tab: .reading, isReaderOpen: true, isProjectOpen: true,
                                      items: ["Speculative decoding in vLLM", "Why agents fail"],
                                      projects: ["Inference stack", "Home lab"])

    func testEveryPhraseTheModelMayChooseParsesToACommand() {
        XCTAssertFalse(VoiceRephrase.catalog.isEmpty)
        for entry in VoiceRephrase.catalog {
            guard case .command = VoiceCommandParser.parse("smartward " + entry.sample, context: screen) else {
                XCTFail("\u{201C}\(entry.sample)\u{201D} isn't something the grammar understands")
                continue
            }
        }
    }

    func testTheReplyIsReducedToThePhrase() {
        XCTAssertEqual(VoiceRephrase.cleanedReply("open reading"), "open reading")
        XCTAssertEqual(VoiceRephrase.cleanedReply("\"Open Reading.\""), "open reading")
        XCTAssertEqual(VoiceRephrase.cleanedReply("**go back**"), "go back")
        XCTAssertEqual(VoiceRephrase.cleanedReply("Command: search for rust"), "search for rust")
        XCTAssertEqual(VoiceRephrase.cleanedReply("SmartWard, open reading"), "open reading")
        XCTAssertEqual(VoiceRephrase.cleanedReply("\n\nshow starred\nBecause you asked for favorites."), "show starred")
        XCTAssertEqual(VoiceRephrase.cleanedReply("read today's digest"), "read todays digest")
    }

    func testNoAnswerIsNoPhrase() {
        XCTAssertNil(VoiceRephrase.cleanedReply("none"))
        XCTAssertNil(VoiceRephrase.cleanedReply("None."))
        XCTAssertNil(VoiceRephrase.cleanedReply(""))
        XCTAssertNil(VoiceRephrase.cleanedReply("  \n "))
        XCTAssertNil(VoiceRephrase.cleanedReply("\"\""))
        XCTAssertNil(VoiceRephrase.cleanedReply(String(repeating: "word ", count: 40)), "too long to be a command")
    }

    func testAPhraseFromTheCatalogBecomesItsCommand() {
        XCTAssertEqual(VoiceRephrase.command(fromReply: "open reading", context: screen), .openTab(.reading))
        XCTAssertEqual(VoiceRephrase.command(fromReply: "search for kubernetes", context: screen), .search("kubernetes"))
        XCTAssertEqual(VoiceRephrase.command(fromReply: "open the second one", context: screen), .openItem(2))
        XCTAssertEqual(VoiceRephrase.command(fromReply: "\"Show starred.\"", context: screen), .showFilter(.starred))
        XCTAssertEqual(VoiceRephrase.command(fromReply: "mark item 2 done", context: screen), .markItemDone(2),
                       "it still waits for your yes in the app")
    }

    func testAnythingElseIsNoCommand() {
        XCTAssertNil(VoiceRephrase.command(fromReply: "none", context: screen))
        XCTAssertNil(VoiceRephrase.command(fromReply: "I'm sorry, I can't help with that", context: screen))
        XCTAssertNil(VoiceRephrase.command(fromReply: "make me a sandwich", context: screen))
    }

    func testTheModelCanNeverSpendTokensOrAnswerForYou() {
        XCTAssertNil(VoiceRephrase.command(fromReply: "ask the strategist what changed", context: screen))
        XCTAssertNil(VoiceRephrase.command(fromReply: "ask what should i read", context: screen))
        let waiting = VoiceContext(tab: .projects, isProjectOpen: true, isConfirming: true)
        XCTAssertNil(VoiceRephrase.command(fromReply: "yes", context: waiting))
        XCTAssertNil(VoiceRephrase.command(fromReply: "go ahead", context: waiting))
        XCTAssertNil(VoiceRephrase.command(fromReply: "no", context: waiting))
    }

    func testTheInstructionsListTheCommandsAndWhatIsOnScreen() {
        let text = VoiceRephrase.instructions(for: screen)
        XCTAssertTrue(text.contains("- search for <words>"))
        XCTAssertTrue(text.contains("- mark item <number> done"))
        XCTAssertTrue(text.contains("answer: none"))
        XCTAssertTrue(text.contains("showing the Reading tab"))
        XCTAssertTrue(text.contains("1. Speculative decoding in vLLM; 2. Why agents fail"))
        XCTAssertTrue(text.contains("Projects: Inference stack; Home lab"))
        XCTAssertFalse(text.contains("ask the strategist"), "the model isn't offered anything that spends tokens")

        let bare = VoiceRephrase.instructions(for: VoiceContext())
        XCTAssertFalse(bare.contains("Articles on screen"))
        XCTAssertFalse(bare.contains("Projects:"))
    }

    func testAtMostTenItemsAreListed() {
        let many = VoiceContext(items: (1...25).map { "Article \($0)" }, projects: (1...25).map { "Project \($0)" })
        let text = VoiceRephrase.instructions(for: many)
        XCTAssertTrue(text.contains("10. Article 10"))
        XCTAssertFalse(text.contains("11. Article 11"))
        XCTAssertTrue(text.contains("Project 10"))
        XCTAssertFalse(text.contains("Project 11"))
    }

    func testThePromptIsWhatWasSaid() {
        XCTAssertEqual(VoiceRephrase.prompt(for: "  pull up the vllm stuff "), "They said: pull up the vllm stuff")
    }
}
