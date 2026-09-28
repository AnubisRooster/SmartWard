import Foundation
import Observation
import SwiftData
import FoundationModels
import UserNotifications
import BYOKLLMKit
import KnowledgeStore
import Pipeline

/// T1 digest summaries: Apple Foundation Models, on-device.
struct FoundationModelsDigestSummarizer: DigestSummarizing {
    let tier = ExtractionTier.onDevice

    func summarize(_ request: DigestSummaryRequest) async throws -> DigestSummary {
        let session = LanguageModelSession(instructions: DigestPrompt.instructions)
        let response = try await session.respond(to: DigestPrompt.user(request, maxCharacters: 3_000))
        return DigestSummary(text: response.content.trimmingCharacters(in: .whitespacesAndNewlines))
    }
}

/// Builds the daily digest (FR-13) after background processing or when
/// you open the app, and posts a local notification when one is ready.
@MainActor
@Observable
final class DigestController {
    static let shared = DigestController()

    nonisolated static let notifyKey = "digest.notify"
    /// A new digest is built at most this often.
    static let interval: TimeInterval = 20 * 3_600

    private(set) var isBuilding = false
    var message: String?

    /// Builds a digest when the last one is older than `interval` (or `force`).
    /// - Parameter notify: post a notification (background runs).
    func buildIfDue(context: ModelContext, force: Bool = false, notify: Bool = false) async {
        guard !isBuilding else { return }
        if !force, let latest = try? DigestBuilder.latest(context: context),
           Date().timeIntervalSince(latest.createdAt) < Self.interval {
            return
        }
        isBuilding = true
        defer { isBuilding = false }

        var byok: BYOKDigestSummarizer?
        if let extractor = ExtractionSettings.byokSettings() {
            byok = BYOKDigestSummarizer(client: ModelCatalogController.shared.fallbackLLM(),
                                        provider: extractor.provider, model: extractor.model)
        }
        var onDevice: (any DigestSummarizing)?
        if SystemLanguageModel.default.isAvailable {
            onDevice = FoundationModelsDigestSummarizer()
        }
        let builder = DigestBuilder(onDevice: onDevice, byok: byok, budget: BudgetSettings.current)
        do {
            let built = try await builder.build(context: context)
            if let digest = built {
                try? context.save()
                message = nil
                if notify { await post(digest) }
            } else if force {
                message = "Nothing new since the last digest."
            }
        } catch {
            message = error.localizedDescription
        }
    }

    // MARK: Notifications

    static var notificationsEnabled: Bool {
        UserDefaults.standard.bool(forKey: notifyKey)
    }

    /// Asks for permission; returns whether notifications may be posted.
    func requestPermission() async -> Bool {
        (try? await UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound])) ?? false
    }

    private func post(_ digest: Digest) async {
        let clusters = digest.clusters
        guard Self.notificationsEnabled, let top = clusters.first, !digest.notified else { return }
        let content = UNMutableNotificationContent()
        content.title = "Your SmartWard digest"
        // Notifications show on the lock screen: with SmartWard's lock on,
        // what you've been reading about stays behind it.
        if AppLockController.shared.isEnabled {
            content.body = "A new digest is ready."
        } else {
            content.body = clusters.count == 1
                ? "New on \(top.title)."
                : "\(clusters.count) themes. Top: \(top.title)."
        }
        content.sound = .default
        let request = UNNotificationRequest(identifier: "digest.\(digest.id.uuidString)", content: content, trigger: nil)
        do {
            try await UNUserNotificationCenter.current().add(request)
            digest.notified = true
        } catch {
            // Not allowed or not available; the digest is still on the Today tab.
        }
    }
}
