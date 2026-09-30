import XCTest
import SwiftData
import KnowledgeStore
@testable import Pipeline

/// The yes / no that guards voice changes to your projects, and what's read
/// out about a project.
final class VoiceConfirmationTests: XCTestCase {
    private let now = Date(timeIntervalSince1970: 1_800_000_000)

    // MARK: The gate

    func testAYesRunsWhatWasAskedOnceAndOnlyOnce() {
        var gate = VoiceConfirmationGate()
        XCTAssertFalse(gate.isWaiting(now: now))
        gate.ask(.markItemDone(2), prompt: "Mark 2?", now: now)
        XCTAssertTrue(gate.isWaiting(now: now.addingTimeInterval(5)))

        XCTAssertEqual(gate.answer(yes: true, now: now.addingTimeInterval(5)), .run(.markItemDone(2)))
        XCTAssertFalse(gate.isWaiting(now: now.addingTimeInterval(5)))
        XCTAssertEqual(gate.answer(yes: true, now: now.addingTimeInterval(6)), .nothingToConfirm, "a second yes does nothing")
    }

    func testANoDropsIt() {
        var gate = VoiceConfirmationGate()
        gate.ask(.acceptBriefUpdate, prompt: "Accept?", now: now)
        XCTAssertEqual(gate.answer(yes: false, now: now), .cancelled)
        XCTAssertEqual(gate.answer(yes: true, now: now), .nothingToConfirm)
    }

    func testAYesAfterTheWindowDoesNothing() {
        var gate = VoiceConfirmationGate()
        gate.ask(.rejectBriefUpdate, prompt: "Reject?", now: now)
        let late = now.addingTimeInterval(VoiceConfirmationGate.window + 1)
        XCTAssertFalse(gate.isWaiting(now: late))
        XCTAssertEqual(gate.answer(yes: true, now: late), .nothingToConfirm)
    }

    func testAYesWithNothingAskedDoesNothing() {
        var gate = VoiceConfirmationGate()
        XCTAssertEqual(gate.answer(yes: true, now: now), .nothingToConfirm)
    }

    func testAskingAgainReplacesTheEarlierQuestionAndCancelDropsIt() {
        var gate = VoiceConfirmationGate()
        gate.ask(.markItemDone(1), prompt: "One?", now: now)
        gate.ask(.markItemDone(3), prompt: "Three?", now: now)
        XCTAssertEqual(gate.pending?.prompt, "Three?")
        XCTAssertEqual(gate.answer(yes: true, now: now), .run(.markItemDone(3)))

        gate.ask(.acceptBriefUpdate, prompt: "Accept?", now: now)
        gate.cancel()
        XCTAssertNil(gate.pending)
        XCTAssertFalse(gate.isWaiting(now: now))
    }

    // MARK: What's said

    func testOpenItemsAreNumberedAndCapped() {
        XCTAssertEqual(VoiceAnswers.openItems([]), "There are no open items.")
        XCTAssertEqual(VoiceAnswers.openItems([(.actionItem, "Draft the eval plan")]),
                       "There is 1 open item. Number 1, action item: Draft the eval plan.")
        let many = (1...10).map { (kind: StrategyItemKind.decision, text: "Item \($0)") }
        let spoken = VoiceAnswers.openItems(many)
        XCTAssertTrue(spoken.hasPrefix("There are 10 open items. Number 1, decision: Item 1. Number 2, decision: Item 2."))
        XCTAssertTrue(spoken.contains("Number 8, decision: Item 8."))
        XCTAssertFalse(spoken.contains("Number 9"))
        XCTAssertTrue(spoken.hasSuffix("And 2 more."))
        XCTAssertEqual(VoiceAnswers.openItems([(.openQuestion, "Which GPU?"), (.risk, "Vendor lock-in.")]),
                       "There are 2 open items. Number 1, open question: Which GPU? Number 2, risk: Vendor lock-in.")
    }

    func testABriefUpdateSaysWhyAndHowBig() {
        XCTAssertEqual(VoiceAnswers.briefUpdate(rationale: "New benchmark results", added: 3, removed: 1),
                       "There's a suggested update to the brief. The reason: New benchmark results. It adds 3 lines and removes 1 line. Say SmartWard, accept the suggested update, or reject it.")
        XCTAssertEqual(VoiceAnswers.briefUpdate(rationale: nil, added: 1, removed: 0),
                       "There's a suggested update to the brief. It adds 1 line. Say SmartWard, accept the suggested update, or reject it.")
        XCTAssertTrue(VoiceAnswers.briefUpdate(rationale: "  ", added: 0, removed: 2).contains("It removes 2 lines."))
        XCTAssertFalse(VoiceAnswers.briefUpdate(rationale: "", added: 0, removed: 0).contains("It "))
    }

    func testTheQuestionsAreSaidBackWithTheirWords() {
        XCTAssertEqual(VoiceAnswers.confirmMarkDone(number: 2, kind: .actionItem, text: "Draft the eval plan"),
                       "Mark number 2 as done? The action item: Draft the eval plan. Say yes or no.")
        XCTAssertTrue(VoiceAnswers.confirmAccept.hasSuffix("Say yes or no."))
        XCTAssertTrue(VoiceAnswers.confirmReject.hasSuffix("Say yes or no."))
        XCTAssertEqual(VoiceAnswers.itemKindName(.openQuestion), "open question")
    }

    // MARK: The project's items

    @MainActor
    func testOpenItemsAreTheOpenOnesOldestFirst() throws {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        let context = container.mainContext
        let project = Project(name: "Inference stack")
        context.insert(project)
        func add(_ text: String, _ kind: StrategyItemKind, minutes: Double, status: StrategyItemStatus = .open) {
            let item = StrategyItem(kind: kind, text: text)
            item.createdAt = now.addingTimeInterval(minutes * 60)
            item.status = status
            project.items?.append(item)
        }
        add("Second", .decision, minutes: 2)
        add("Done already", .actionItem, minutes: 1, status: .done)
        add("First", .actionItem, minutes: 0)
        add("Superseded", .risk, minutes: 3, status: .superseded)
        add("Third", .openQuestion, minutes: 4)
        try context.save()

        withExtendedLifetime(container) {
            XCTAssertEqual(ProjectVoiceQueries.openItems(of: project).map(\.text), ["First", "Second", "Third"])
        }
    }
}
