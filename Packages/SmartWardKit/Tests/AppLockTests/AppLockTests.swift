import XCTest
import PINLockKit
import BiometricLockKit
@testable import AppLock

final class FakePIN: PINVerifying {
    var isPINSetup = true
    var isLockedOut = false
    var lockoutRemaining = 0
    var result: PINAttemptResult = .success
    private(set) var attempts: [String] = []

    func attemptPIN(_ pin: String) -> PINAttemptResult {
        attempts.append(pin)
        return result
    }
}

final class FakeBiometrics: BiometricUnlocking {
    var type: BiometryType = .faceID
    var available: Result<Void, BiometricUnavailable> = .success(Void())
    var result: BiometricResult = .success
    private(set) var unlockCalls = 0
    private(set) var accepted = false

    func biometryType() -> BiometryType { type }
    func availability() -> Result<Void, BiometricUnavailable> { available }
    func unlock(reason: String) async -> BiometricResult {
        unlockCalls += 1
        return result
    }
    func acceptCurrentBiometry() { accepted = true }
}

final class AppLockPolicyTests: XCTestCase {
    private let now = Date(timeIntervalSince1970: 1_800_000_000)

    func testDisabledNeverLocks() {
        XCTAssertFalse(AppLockPolicy(isEnabled: false).shouldLock(backgroundedAt: nil, now: now))
    }

    func testColdLaunchLocks() {
        XCTAssertTrue(AppLockPolicy(isEnabled: true, gracePeriod: 300).shouldLock(backgroundedAt: nil, now: now))
    }

    func testGracePeriod() {
        let policy = AppLockPolicy(isEnabled: true, gracePeriod: 60)
        XCTAssertFalse(policy.shouldLock(backgroundedAt: now - 59, now: now))
        XCTAssertTrue(policy.shouldLock(backgroundedAt: now - 60, now: now))
        XCTAssertTrue(AppLockPolicy(isEnabled: true).shouldLock(backgroundedAt: now, now: now),
                      "zero grace locks immediately")
        XCTAssertEqual(AppLockPolicy(isEnabled: true, gracePeriod: -5).gracePeriod, 0)
    }
}

final class AppLockCoordinatorTests: XCTestCase {

    @MainActor
    func testBiometricSuccessUnlocks() async {
        let biometrics = FakeBiometrics()
        let coordinator = AppLockCoordinator(pin: FakePIN(), biometrics: biometrics)
        XCTAssertEqual(coordinator.biometryName, "Face ID")
        let step = await coordinator.unlockWithBiometrics(reason: "r")
        XCTAssertEqual(step, .unlocked)
    }

    @MainActor
    func testEveryNonSuccessFallsBackToPIN() async {
        for result: BiometricResult in [.failed, .fallback, .lockout, .canceled, .unavailable(.notEnrolled)] {
            let biometrics = FakeBiometrics()
            biometrics.result = result
            let step = await AppLockCoordinator(pin: FakePIN(), biometrics: biometrics).unlockWithBiometrics(reason: "r")
            XCTAssertEqual(step, .needsPIN(rebaseline: false), "\(result)")
        }
    }

    @MainActor
    func testUnavailableBiometricsSkipsThePrompt() async {
        let biometrics = FakeBiometrics()
        biometrics.available = .failure(.notEnrolled)
        let coordinator = AppLockCoordinator(pin: FakePIN(), biometrics: biometrics)
        XCTAssertNil(coordinator.biometryName)
        let step = await coordinator.unlockWithBiometrics(reason: "r")
        XCTAssertEqual(step, .needsPIN(rebaseline: false))
        XCTAssertEqual(biometrics.unlockCalls, 0)
    }

    @MainActor
    func testChangedBiometryRequiresPINThenRebaselines() async {
        let biometrics = FakeBiometrics()
        biometrics.result = .biometryChanged
        let pin = FakePIN()
        let coordinator = AppLockCoordinator(pin: pin, biometrics: biometrics)

        let step = await coordinator.unlockWithBiometrics(reason: "r")
        XCTAssertEqual(step, .needsPIN(rebaseline: true))
        XCTAssertFalse(biometrics.accepted)

        XCTAssertEqual(coordinator.submitPIN("135790", rebaseline: true), .unlocked)
        XCTAssertTrue(biometrics.accepted, "the new biometric set is trusted only after the PIN")
    }

    @MainActor
    func testPINOutcomes() {
        let pin = FakePIN()
        let biometrics = FakeBiometrics()
        let coordinator = AppLockCoordinator(pin: pin, biometrics: biometrics)

        pin.result = .incorrect(attemptsRemaining: 3)
        XCTAssertEqual(coordinator.submitPIN("000001", rebaseline: true), .incorrect(attemptsRemaining: 3))
        XCTAssertFalse(biometrics.accepted, "a wrong PIN never rebaselines")

        pin.result = .lockedOut(secondsRemaining: 30)
        XCTAssertEqual(coordinator.submitPIN("000001", rebaseline: false), .lockedOut(secondsRemaining: 30))

        pin.isPINSetup = false
        XCTAssertEqual(coordinator.submitPIN("135790", rebaseline: false), .noPIN)
        XCTAssertEqual(pin.attempts.count, 2, "no attempt is made without a PIN")
    }
}

final class PINRulesTests: XCTestCase {
    func testAcceptance() {
        XCTAssertTrue(PINRules.isAcceptable("135790"))
        XCTAssertTrue(PINRules.isAcceptable("902614"))
        XCTAssertFalse(PINRules.isAcceptable("12345"), "too short")
        XCTAssertFalse(PINRules.isAcceptable("12345a"), "digits only")
        XCTAssertFalse(PINRules.isAcceptable("111111"), "all the same")
        XCTAssertFalse(PINRules.isAcceptable("123456"), "ascending run")
        XCTAssertFalse(PINRules.isAcceptable("987654"), "descending run")
    }
}
