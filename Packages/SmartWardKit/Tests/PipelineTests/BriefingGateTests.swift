import XCTest
@testable import Pipeline

/// When a briefing may start from Siri with the phone locked.
final class BriefingGateTests: XCTestCase {
    private func check(fromSiri: Bool = true, front: Bool = false, allowed: Bool = true, data: Bool = true,
                       window: TimeInterval? = nil) -> BriefingGate.Refusal? {
        BriefingGate.check(.init(fromSiri: fromSiri, appInFront: front, lockScreenAllowed: allowed,
                                 protectedDataAvailable: data, lockWindow: window))
    }

    func testInTheAppNothingStopsIt() {
        XCTAssertNil(check(fromSiri: false, front: true, allowed: false, data: false, window: 0))
    }

    func testSiriWithThePhoneLockedWorksWhenSmartWardHasNoLockAndTheSettingIsOn() {
        XCTAssertNil(check())
        XCTAssertNil(check(front: true))
    }

    func testTheSettingOffStopsItOnlyWhileTheAppIsNotInFront() {
        XCTAssertEqual(check(allowed: false), .lockScreenOff)
        XCTAssertNil(check(front: true, allowed: false), "in the app it's just you")
    }

    func testSmartWardsOwnLockDecides() {
        XCTAssertEqual(check(window: 0), .appLocked)
        XCTAssertEqual(check(front: true, window: 0), .appLocked)
        XCTAssertEqual(check(window: -5), .appLocked)
        XCTAssertNil(check(window: 120), "still inside the grace period")
        XCTAssertNil(check(window: nil), "the lock is off, or the app is in front")
    }

    func testAPhoneNotYetUnlockedSinceRestartCantReadTheLibrary() {
        XCTAssertEqual(check(data: false), .needsUnlock)
        XCTAssertEqual(check(allowed: false, data: false, window: 0), .needsUnlock, "that's the first thing to say")
    }

    func testEveryRefusalSaysWhatToDo() {
        XCTAssertTrue(BriefingGate.Refusal.needsUnlock.message.contains("Unlock your phone"))
        XCTAssertTrue(BriefingGate.Refusal.appLocked.message.contains("Unlock it first"))
        XCTAssertTrue(BriefingGate.Refusal.lockScreenOff.message.contains("settings"))
    }
}
