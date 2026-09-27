import Foundation
import BYOKLLMKit
import KnowledgeStore

public enum ConversationHistory {

    /// A stored message reduced to what history needs, so the budgeting logic
    /// is pure and testable.
    public struct Entry: Equatable, Sendable {
        public let role: String
        public let content: String
        public let createdAt: Date

        public init(role: String, content: String, createdAt: Date) {
            self.role = role
            self.content = content
            self.createdAt = createdAt
        }
    }

    public static let defaultBudgetCharacters = 48_000

    /// User and assistant turns, oldest first, trimmed from the oldest end to
    /// fit `budgetCharacters`. The newest turn is always kept. Tool activity
    /// isn't replayed: only the text the user saw carries over between turns.
    public static func messages(from entries: [Entry],
                                budgetCharacters: Int = defaultBudgetCharacters) -> [LLMChatMessage] {
        let turns = entries
            .filter { ($0.role == "user" || $0.role == "assistant") && !$0.content.isEmpty }
            .sorted { $0.createdAt < $1.createdAt }

        var kept: [Entry] = []
        var used = 0
        for entry in turns.reversed() {
            if !kept.isEmpty && used + entry.content.count > budgetCharacters { break }
            kept.append(entry)
            used += entry.content.count
        }
        // Providers expect the conversation to open with a user turn.
        while let first = kept.last, first.role != "user", kept.count > 1 {
            kept.removeLast()
        }
        return kept.reversed().map { entry in
            entry.role == "user" ? LLMChatMessage.user(entry.content) : LLMChatMessage.assistant(entry.content)
        }
    }

    public static func messages(from stored: [Message],
                                budgetCharacters: Int = defaultBudgetCharacters) -> [LLMChatMessage] {
        messages(from: stored.map { Entry(role: $0.role, content: $0.content, createdAt: $0.createdAt) },
                 budgetCharacters: budgetCharacters)
    }
}
