import Foundation
import SwiftData
import UIKit
import KnowledgeStore
import Pipeline

/// Starts a briefing of your top unread articles, from a voice command in the
/// app or from Siri (which can be with the phone locked, in a car).
///
/// Only briefings may go on with the app in the background (the audio
/// background mode, the system voice only): the microphone still listens only
/// while SmartWard is open, and a briefing started from the lock screen is
/// steered with the buttons (headphones, steering wheel, lock screen) and
/// with Siri's own "next" and "pause". `BriefingGate` decides when Siri may
/// start one, and SmartWard's own lock limits how long it may go on.
@MainActor
enum BriefingLauncher {
    static let lockScreenKey = "briefing.lockScreen.enabled"

    static var lockScreenAllowed: Bool {
        let defaults = UserDefaults.standard
        return defaults.object(forKey: lockScreenKey) == nil ? true : defaults.bool(forKey: lockScreenKey)
    }

    enum Refusal: LocalizedError {
        case gate(BriefingGate.Refusal)
        case libraryUnavailable
        case nothingUnread

        var errorDescription: String? {
            switch self {
            case .gate(let refusal): return refusal.message
            case .libraryUnavailable: return "SmartWard couldn't open your library."
            case .nothingUnread: return "You're all caught up. There's nothing unread."
            }
        }
    }

    /// - Parameter fromSiri: asked for through Siri or Shortcuts, not in the app.
    static func start(fromSiri: Bool) -> Result<Void, Refusal> {
        let lock = AppLockController.shared
        let conditions = BriefingGate.Conditions(
            fromSiri: fromSiri,
            appInFront: UIApplication.shared.applicationState == .active,
            lockScreenAllowed: lockScreenAllowed,
            protectedDataAvailable: UIApplication.shared.isProtectedDataAvailable,
            lockWindow: lock.handsFreeWindow)
        if let refusal = BriefingGate.check(conditions) { return .failure(.gate(refusal)) }

        guard case .success(let container) = AppStore.container else { return .failure(.libraryUnavailable) }
        let unread = (try? container.mainContext.fetch(
            FetchDescriptor<Article>(predicate: #Predicate { $0.isRead == false }))) ?? []
        let queue = ArticleBriefing.queue(from: unread)
        let readout = ArticleReadoutController.shared
        guard !queue.isEmpty, readout.startBriefing(queue) else { return .failure(.nothingUnread) }

        // With SmartWard's lock on, a briefing in the background ends when its grace period would.
        if fromSiri, let window = conditions.lockWindow { readout.stopBriefing(after: window) }
        return .success(())
    }
}
