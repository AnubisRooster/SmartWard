import XCTest
@testable import Pipeline

/// Finding and asking by voice: search, the strategist, status questions, themes.
final class VoiceFindCommandTests: XCTestCase {
    let plain = VoiceContext()
    let briefing = VoiceContext(isReading: true, isBriefing: true,
                                spokenNow: "Number 2 of 5. Why agents fail. From Example.")

    private func check(_ heard: String, _ context: VoiceContext, _ expected: VoiceParse,
                       file: StaticString = #filePath, line: UInt = #line) {
        XCTAssertEqual(VoiceCommandParser.parse(heard, context: context), expected, "\u{201C}\(heard)\u{201D}",
                       file: file, line: line)
    }

    func testSearch() {
        check("smartward search for speculative decoding", plain, .command(.search("speculative decoding")))
        check("SmartWard, search my library for rust", plain, .command(.search("rust")))
        check("smartward find articles about kubernetes", plain, .command(.search("kubernetes")))
        check("smartward look up vLLM", plain, .command(.search("vllm")))
        check("smartward find me articles on sourdough starters", plain, .command(.search("sourdough starters")))
        check("smartward search agents", plain, .command(.search("agents")))
        check("smartward could you please search for the latest on rag", plain, .command(.search("latest on rag")))
        check("smartward search", plain, .unrecognized("search"))
        check("smartward search for", plain, .unrecognized("search for"))
    }

    func testClearTheSearch() {
        check("smartward clear search", plain, .command(.clearSearch))
        check("smartward clear the search", plain, .command(.clearSearch))
        check("smartward stop searching", plain, .command(.clearSearch))
    }

    func testAskTheStrategist() {
        check("smartward ask the strategist what changed in inference this week", plain, .command(.ask("what changed in inference this week")))
        check("smartward ask what should i read first", plain, .command(.ask("what should i read first")))
        check("SmartWard, ask my strategist about the home lab project", plain, .command(.ask("home lab project")))
        check("smartward ask the strategist", plain, .unrecognized("ask the strategist"))
        check("smartward open the strategist", plain, .command(.openTab(.chat)))
    }

    func testStatusQuestions() {
        check("smartward how many unread articles do i have", plain, .command(.status(.unreadCount)))
        check("smartward how many unread", plain, .command(.status(.unreadCount)))
        check("smartward did the refresh finish", plain, .command(.status(.refresh)))
        check("smartward is it still refreshing", plain, .command(.status(.refresh)))
        check("smartward which sources are failing", plain, .command(.status(.failingSources)))
        check("smartward are any sources failing", plain, .command(.status(.failingSources)))
        check("smartward how much have i spent today", plain, .command(.status(.spendToday)))
        check("smartward how much did i spend today", plain, .command(.status(.spendToday)))
        check("smartward what's my budget", plain, .command(.status(.spendToday)))
    }

    func testThemes() {
        check("smartward what are my top themes", plain, .command(.topThemes))
        check("smartward what's trending", plain, .command(.topThemes))
        check("smartward tell me about speculative decoding", plain, .command(.aboutTheme("speculative decoding")))
        check("smartward what do i know about vllm", plain, .command(.aboutTheme("vllm")))
        check("smartward what have i read about rust", plain, .command(.aboutTheme("rust")))
        check("smartward tell me about", plain, .unrecognized("tell me about"))
    }

    func testTellMeMoreIsStillTheBriefingCommand() {
        check("tell me more", briefing, .command(.readFullItem))
        check("smartward tell me more", briefing, .command(.readFullItem))
    }

    func testAQuestionInProgressIsRecognizedSoItGetsMoreTimeToFinish() {
        XCTAssertTrue(VoiceCommandParser.isAsking("smartward ask the strategist what changed"))
        XCTAssertTrue(VoiceCommandParser.isAsking("Ask what changed"))
        XCTAssertTrue(VoiceCommandParser.isAsking("smartward ask what"))
        XCTAssertFalse(VoiceCommandParser.isAsking("smartward open reading"))
        XCTAssertFalse(VoiceCommandParser.isAsking("hey smartward ask"))
    }

    func testHelpMentionsFindingAndAsking() {
        let lines = VoiceCommandHelp.lines(for: plain)
        XCTAssertTrue(lines.contains { $0.contains("search for") })
        XCTAssertTrue(lines.contains { $0.contains("ask the strategist") })
    }
}
