import XCTest
@testable import StrategistCore

final class VoiceTurnTests: XCTestCase {

    func testStartNeedsAKeyThenAutoApprove() {
        XCTAssertEqual(VoiceTurn.startBlocker(hasKey: false, autoApprove: true), .missingKey)
        XCTAssertEqual(VoiceTurn.startBlocker(hasKey: false, autoApprove: false), .missingKey,
                       "a missing key comes first: no approval setting makes turns succeed without one")
        XCTAssertEqual(VoiceTurn.startBlocker(hasKey: true, autoApprove: false), .needsAutoApprove)
        XCTAssertNil(VoiceTurn.startBlocker(hasKey: true, autoApprove: true))
    }

    func testAFailedTurnStopsListeningAndSaysSo() {
        XCTAssertEqual(VoiceTurn.outcome(reply: nil, failed: true), .fail(VoiceTurn.failureMessage))
        XCTAssertEqual(VoiceTurn.outcome(reply: "partial", failed: true), .fail(VoiceTurn.failureMessage))
    }

    func testNoReplyListensAgain() {
        XCTAssertEqual(VoiceTurn.outcome(reply: nil, failed: false), .listen)
        XCTAssertEqual(VoiceTurn.outcome(reply: "  [R1] ", failed: false), .listen,
                       "a reply that's only a citation has nothing to say aloud")
    }

    func testAReplyIsSpokenWithoutCitations() {
        XCTAssertEqual(VoiceTurn.outcome(reply: "LoRA cuts memory use [R1].", failed: false),
                       .speak("LoRA cuts memory use."))
        XCTAssertEqual(VoiceTurn.spokenText("Per [R2], it helps [R1, R3]. Also [R4][R5] this."),
                       "Per, it helps. Also this.")
    }

    func testShortRepliesAreSpokenWhole() {
        let reply = String(repeating: "Short sentence. ", count: 10).trimmingCharacters(in: .whitespaces)
        XCTAssertEqual(VoiceTurn.spokenText(reply), reply)
    }

    func testLongRepliesStopAtASentenceBoundary() {
        let sentence = "This sentence is exactly fifty characters long ok. "
        let reply = String(repeating: sentence, count: 40)
        let spoken = VoiceTurn.spokenText(reply)
        XCTAssertTrue(spoken.hasSuffix("long ok. The rest is on screen."), spoken)
        XCTAssertLessThanOrEqual(spoken.count, VoiceTurn.maxSpokenCharacters + VoiceTurn.truncationNote.count)
    }

    func testLongReplyWithoutSentencesStopsAtAWord() {
        let reply = String(repeating: "word ", count: 400)
        let spoken = VoiceTurn.spokenText(reply)
        XCTAssertTrue(spoken.hasSuffix("word The rest is on screen."), spoken)
    }
}
