import Foundation
import SwiftData
import KnowledgeStore

/// A change to your projects that voice may make only after a spoken yes:
/// "Mark item 2, Draft the eval plan, as done? Say yes or no." Nothing runs
/// until "yes"; "no", a different command, or 20 seconds of silence drops it.
public struct VoiceConfirmationGate: Equatable, Sendable {
    public static let window: TimeInterval = 20

    public struct Pending: Equatable, Sendable {
        public let action: VoiceCommand
        public let prompt: String
        public let expiresAt: Date
    }

    public enum Resolution: Equatable, Sendable {
        /// "Yes": do it now.
        case run(VoiceCommand)
        /// "No".
        case cancelled
        /// Nothing was waiting (or it timed out).
        case nothingToConfirm
    }

    public private(set) var pending: Pending?

    public init() {}

    /// Whether a yes or no is being waited for.
    public func isWaiting(now: Date) -> Bool {
        guard let pending else { return false }
        return now < pending.expiresAt
    }

    /// Waits for a yes to `action`, replacing anything already waiting.
    public mutating func ask(_ action: VoiceCommand, prompt: String, now: Date) {
        pending = Pending(action: action, prompt: prompt, expiresAt: now.addingTimeInterval(Self.window))
    }

    /// The answer. A yes runs only what's still waiting; either way it's spent.
    public mutating func answer(yes: Bool, now: Date) -> Resolution {
        defer { pending = nil }
        guard let pending, now < pending.expiresAt else { return .nothingToConfirm }
        return yes ? .run(pending.action) : .cancelled
    }

    /// Something else was said: what was waiting is dropped.
    public mutating func cancel() {
        pending = nil
    }
}

/// What voice asks of the project on screen.
@MainActor
public enum ProjectVoiceQueries {
    /// Open items in the order they're read out, so "mark item 2 done" means
    /// the second one heard: oldest first.
    public static func openItems(of project: Project) -> [StrategyItem] {
        (project.items ?? []).filter { $0.status == .open }.sorted { lhs, rhs in
            lhs.createdAt != rhs.createdAt ? lhs.createdAt < rhs.createdAt : lhs.id.uuidString < rhs.id.uuidString
        }
    }

    /// The related reading the project's card shows, as articles.
    public static func relatedArticles(of project: Project, context: ModelContext, limit: Int = 8) -> [Article] {
        ((try? ProjectArticles.matches(for: project, context: context, limit: limit)) ?? []).map(\.article)
    }
}
