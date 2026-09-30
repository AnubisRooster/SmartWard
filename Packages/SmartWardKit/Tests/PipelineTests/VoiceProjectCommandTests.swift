import XCTest
@testable import Pipeline

/// Projects by voice: the brief, open items, suggested updates, and the
/// yes / no that guards anything that changes them.
final class VoiceProjectCommandTests: XCTestCase {
    let projectOpen = VoiceContext(tab: .projects, isProjectOpen: true)
    let confirming = VoiceContext(tab: .projects, isProjectOpen: true, isConfirming: true)
    let confirmingWhileReading = VoiceContext(tab: .projects, isReading: true, isProjectOpen: true, isConfirming: true,
                                              spokenNow: "The plan is to ship next week.")

    private func check(_ heard: String, _ context: VoiceContext, _ expected: VoiceParse,
                       file: StaticString = #filePath, line: UInt = #line) {
        XCTAssertEqual(VoiceCommandParser.parse(heard, context: context), expected, "\u{201C}\(heard)\u{201D}",
                       file: file, line: line)
    }

    func testReadTheBriefAndTheOpenItems() {
        check("smartward read the brief", projectOpen, .command(.readBrief))
        check("smartward what's in the brief", projectOpen, .command(.readBrief))
        check("smartward read this project's brief", projectOpen, .command(.readBrief))
        check("smartward what are my open items", projectOpen, .command(.readOpenItems))
        check("smartward what's open", projectOpen, .command(.readOpenItems))
        check("smartward read the action items", projectOpen, .command(.readOpenItems))
        check("smartward brief me on this project", projectOpen, .command(.readProjectReading))
        check("smartward read the related articles", projectOpen, .command(.readProjectReading))
        check("smartward read the suggested update", projectOpen, .command(.readBriefUpdate))
        check("smartward what changed in the brief", projectOpen, .command(.readBriefUpdate))
    }

    func testChangesThatNeedAYes() {
        check("smartward accept the suggested update", projectOpen, .command(.acceptBriefUpdate))
        check("smartward accept the update", projectOpen, .command(.acceptBriefUpdate))
        check("smartward reject the suggested update", projectOpen, .command(.rejectBriefUpdate))
        check("smartward dismiss the suggested update", projectOpen, .command(.rejectBriefUpdate))
        check("smartward mark item 2 done", projectOpen, .command(.markItemDone(2)))
        check("smartward mark item two as done", projectOpen, .command(.markItemDone(2)))
        check("smartward mark the second one done", projectOpen, .command(.markItemDone(2)))
        check("smartward mark number 3 complete", projectOpen, .command(.markItemDone(3)))
        check("smartward complete item four", projectOpen, .command(.markItemDone(4)))
        check("smartward finish item 1", projectOpen, .command(.markItemDone(1)))
        check("smartward mark #5 as done", projectOpen, .command(.markItemDone(5)))
        check("smartward mark done", projectOpen, .unrecognized("mark done"))
        check("smartward mark it read", projectOpen, .command(.dismiss))
        check("smartward mark this as unread", projectOpen, .command(.markUnread))
    }

    func testYesAndNoNeedNoWakeWordWhileItWaits() {
        check("yes", confirming, .command(.confirm))
        check("Yes.", confirming, .command(.confirm))
        check("yes please", confirming, .command(.confirm))
        check("yeah", confirming, .command(.confirm))
        check("go ahead", confirming, .command(.confirm))
        check("do it", confirming, .command(.confirm))
        check("confirm", confirming, .command(.confirm))
        check("no", confirming, .command(.decline))
        check("No.", confirming, .command(.decline))
        check("cancel", confirming, .command(.decline))
        check("never mind", confirming, .command(.decline))
        check("stop", confirming, .command(.decline))
        check("nope", confirming, .command(.decline))
        check("smartward yes", confirming, .command(.confirm))
        check("smartward no", confirming, .command(.decline))
    }

    func testYesAndNoMeanNothingWhenNothingWasAsked() {
        check("yes", projectOpen, .ignored)
        check("no", projectOpen, .ignored)
        check("smartward yes", projectOpen, .unrecognized("yes"))
    }

    func testAnAnswerWinsOverTheReadingControlsWhileItWaits() {
        check("stop", confirmingWhileReading, .command(.decline))
        check("yes", confirmingWhileReading, .command(.confirm))
        check("pause", confirmingWhileReading, .command(.pauseReading))
    }

    func testOtherPhrasesStillWorkWhileItWaits() {
        check("smartward open reading", confirming, .command(.openTab(.reading)))
        check("something else entirely", confirming, .ignored)
    }

    func testOnlyChangesToYourProjectsNeedAYes() {
        XCTAssertTrue(VoiceCommand.markItemDone(2).needsConfirmation)
        XCTAssertTrue(VoiceCommand.acceptBriefUpdate.needsConfirmation)
        XCTAssertTrue(VoiceCommand.rejectBriefUpdate.needsConfirmation)
        XCTAssertFalse(VoiceCommand.readBrief.needsConfirmation)
        XCTAssertFalse(VoiceCommand.readOpenItems.needsConfirmation)
        XCTAssertFalse(VoiceCommand.star(true).needsConfirmation)
        XCTAssertFalse(VoiceCommand.dismiss.needsConfirmation)
        XCTAssertFalse(VoiceCommand.ask("what changed").needsConfirmation)
    }

    func testHelpFollowsTheProjectAndTheQuestion() {
        let project = VoiceCommandHelp.lines(for: projectOpen)
        XCTAssertTrue(project.contains("SmartWard, read the brief"))
        XCTAssertTrue(project.contains("SmartWard, mark item two done"))
        XCTAssertFalse(VoiceCommandHelp.lines(for: VoiceContext()).contains("SmartWard, read the brief"))
        XCTAssertTrue(VoiceCommandHelp.lines(for: confirming).first?.hasPrefix("Say yes") == true)
    }
}
