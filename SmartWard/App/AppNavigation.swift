import Foundation
import Observation

enum AppTab: Hashable {
    case today, reading, graph, chat, projects
}

/// Where the app should be showing, so App Intents and notifications can
/// open a tab or a chat.
@MainActor
@Observable
final class AppNavigation {
    static let shared = AppNavigation()

    var tab: AppTab = .today
    /// A chat to open in the Chat tab; cleared once it's shown.
    var conversationToOpen: UUID?

    func openChat(_ id: UUID) {
        conversationToOpen = id
        tab = .chat
    }
}
