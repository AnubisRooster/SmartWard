import Foundation
import Observation
import SwiftUI
import PINLockKit
import BiometricLockKit
import AppLock

/// App-wide lock state: decides when to lock (cold launch, and after the
/// background grace period), and drives the lock screen.
@MainActor
@Observable
final class AppLockController {
    static let shared = AppLockController()

    nonisolated static let enabledKey = "lock.enabled"
    nonisolated static let gracePeriodKey = "lock.gracePeriod"

    private(set) var isLocked = false
    /// The app is not frontmost; cover its contents so the app-switcher
    /// snapshot shows nothing.
    private(set) var isObscured = false
    private(set) var showsPINPad = false
    private(set) var rebaselineAfterPIN = false
    var message: String?

    let coordinator = AppLockCoordinator(pin: PINService.shared, biometrics: BiometricService())
    private var backgroundedAt: Date?
    private var hasEvaluatedLaunch = false

    var isEnabled: Bool { UserDefaults.standard.bool(forKey: Self.enabledKey) }

    private var policy: AppLockPolicy {
        AppLockPolicy(isEnabled: isEnabled && PINService.shared.isPINSetup,
                      gracePeriod: UserDefaults.standard.double(forKey: Self.gracePeriodKey))
    }

    func handle(_ phase: ScenePhase) {
        switch phase {
        case .active:
            isObscured = false
            let wasLaunch = !hasEvaluatedLaunch
            hasEvaluatedLaunch = true
            if !isLocked && policy.shouldLock(backgroundedAt: wasLaunch ? nil : backgroundedAt) {
                lock()
            }
            backgroundedAt = nil
        case .inactive:
            isObscured = isEnabled
        case .background:
            isObscured = isEnabled
            if backgroundedAt == nil { backgroundedAt = Date() }
        @unknown default:
            break
        }
    }

    func lock() {
        isLocked = true
        showsPINPad = false
        rebaselineAfterPIN = false
        message = nil
    }

    func unlockWithBiometrics() async {
        let step = await coordinator.unlockWithBiometrics(reason: "Unlock SmartWard")
        switch step {
        case .unlocked:
            isLocked = false
        case .needsPIN(let rebaseline):
            showsPINPad = true
            rebaselineAfterPIN = rebaseline
            if rebaseline {
                message = "Your Face ID or Touch ID settings changed. Enter your PIN to continue."
            }
        }
    }

    func showPINPad() {
        showsPINPad = true
    }

    /// - Returns: whether the PIN unlocked the app.
    @discardableResult
    func submitPIN(_ pin: String) -> Bool {
        switch coordinator.submitPIN(pin, rebaseline: rebaselineAfterPIN) {
        case .unlocked:
            isLocked = false
            message = nil
            return true
        case .incorrect(let remaining):
            message = "Incorrect PIN. \(remaining) \(remaining == 1 ? "attempt" : "attempts") left."
        case .lockedOut(let seconds):
            message = "Too many attempts. Try again in \(seconds) seconds."
        case .noPIN:
            // Fail open only when no PIN exists at all: the lock can't be enabled without one.
            isLocked = false
            return true
        }
        return false
    }
}
