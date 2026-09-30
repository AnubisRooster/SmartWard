import Foundation

/// Whether a briefing may start right now. In the app, anyone holding the
/// phone is you. From Siri, the phone may be locked and in a stranger's hand
/// or in a car, so SmartWard's own lock, the setting for the lock screen and
/// the phone's data protection all get a say. Pure, so tests cover it.
public enum BriefingGate {
    public struct Conditions: Equatable, Sendable {
        /// Asked for through Siri or Shortcuts rather than in the app.
        public var fromSiri: Bool
        /// SmartWard is on screen.
        public var appInFront: Bool
        /// Settings → Briefings → "From the lock screen".
        public var lockScreenAllowed: Bool
        /// Files protected until the first unlock can be read (`false` after a
        /// restart, before you've unlocked the phone once).
        public var protectedDataAvailable: Bool
        /// How long SmartWard's contents may still be spoken without unlocking
        /// SmartWard: `nil` for no limit (its lock is off, or the app is in
        /// front), 0 for not at all.
        public var lockWindow: TimeInterval?

        public init(fromSiri: Bool, appInFront: Bool, lockScreenAllowed: Bool = true,
                    protectedDataAvailable: Bool = true, lockWindow: TimeInterval? = nil) {
            self.fromSiri = fromSiri
            self.appInFront = appInFront
            self.lockScreenAllowed = lockScreenAllowed
            self.protectedDataAvailable = protectedDataAvailable
            self.lockWindow = lockWindow
        }
    }

    public enum Refusal: Equatable, Sendable {
        /// The phone hasn't been unlocked since it started, so the library can't be read.
        case needsUnlock
        /// SmartWard's lock is on and the app isn't unlocked.
        case appLocked
        /// You turned briefings off for the lock screen.
        case lockScreenOff

        public var message: String {
            switch self {
            case .needsUnlock: return "Unlock your phone once after it restarts, then ask again."
            case .appLocked: return "SmartWard is locked. Unlock it first, then ask again."
            case .lockScreenOff: return "Briefings from the lock screen are off. Turn them on in SmartWard's settings."
            }
        }
    }

    /// Why a briefing shouldn't start, or `nil` when it may.
    public static func check(_ conditions: Conditions) -> Refusal? {
        guard conditions.fromSiri else { return nil }
        if !conditions.protectedDataAvailable { return .needsUnlock }
        if let window = conditions.lockWindow, window <= 0 { return .appLocked }
        if !conditions.appInFront && !conditions.lockScreenAllowed { return .lockScreenOff }
        return nil
    }
}
