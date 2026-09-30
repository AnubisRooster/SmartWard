import SwiftUI
import Observation
import KnowledgeStore

enum AppTab: Hashable {
    case today, reading, graph, chat, projects
}

/// The Reading list's Unread / Starred / All picker.
enum ReadingFilter: String, CaseIterable, Identifiable {
    case unread = "Unread", starred = "Starred", all = "All"
    var id: Self { self }
}

enum ReadingOrder: String, CaseIterable, Identifiable {
    case newest = "Newest", relevant = "Most relevant"
    var id: Self { self }

    static let storageKey = "reading.order"
}

/// Where the app should be showing, so App Intents, notifications and
/// anything else outside a screen can open a tab, a chat, an article or a
/// project, and go back.
///
/// Each tab's stack keeps its screens in a path held here rather than in the
/// stack's own private state, and the Reading list's filter lives here too.
/// Every screen a stack shows must be a value pushed onto its path (a
/// `NavigationLink(value:)`, not `NavigationLink { … }`): a destination-style
/// push isn't in the path, so `back()` couldn't see it.
@MainActor
@Observable
final class AppNavigation {
    static let shared = AppNavigation()

    var tab: AppTab = .today

    var todayPath = NavigationPath()
    var readingPath = NavigationPath()
    var projectsPath = NavigationPath()
    var chatPath = NavigationPath()

    var readingFilter: ReadingFilter = .unread
    /// What's typed (or spoken) in the Reading tab's search field.
    var readingQuery = ""

    /// The article open in the reader right now, if any (set by the reader).
    var readerArticle: Article?
    /// The project whose card is open (set by the card), so "read the brief" knows which.
    var projectOpen: Project?
    /// The articles listed in the Reading tab, in the order shown (set by
    /// the list), so "open the second one" knows what "second" is.
    var listedArticles: [Article] = []

    /// "Brief me" was asked for from outside the app (Siri, Shortcuts); the
    /// root view starts the briefing once the app is in front and unlocked.
    var briefingRequested = false

    /// A chat to open in the Chat tab; cleared once it's shown.
    var conversationToOpen: UUID?

    func openChat(_ id: UUID) {
        conversationToOpen = id
        tab = .chat
    }

    /// Shows `tab` at its top level, whatever was pushed on it.
    func show(_ tab: AppTab) {
        self.tab = tab
        switch tab {
        case .today: todayPath = NavigationPath()
        case .reading: readingPath = NavigationPath()
        case .projects: projectsPath = NavigationPath()
        case .chat: chatPath = NavigationPath()
        case .graph: break
        }
    }

    /// Shows `article` in the reader, on top of the Reading list.
    func openArticle(_ article: Article) {
        tab = .reading
        readingPath = NavigationPath()
        readingPath.append(article)
    }

    /// Shows `project`'s card, on top of the Projects list.
    func openProject(_ project: Project) {
        tab = .projects
        projectsPath = NavigationPath()
        projectsPath.append(project)
    }

    /// Goes back one screen in the tab that's showing.
    /// - Returns: `false` when it's already at the top of its tab (or the
    ///   tab, like Graph, has nothing to go back from).
    @discardableResult
    func back() -> Bool {
        switch tab {
        case .today: return Self.pop(&todayPath)
        case .reading: return Self.pop(&readingPath)
        case .projects: return Self.pop(&projectsPath)
        case .chat: return Self.pop(&chatPath)
        case .graph: return false
        }
    }

    private static func pop(_ path: inout NavigationPath) -> Bool {
        guard !path.isEmpty else { return false }
        path.removeLast()
        return true
    }
}
