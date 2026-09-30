import AppIntents
import Foundation
import SwiftData
import BYOKLLMKit
import KnowledgeStore
import Pipeline
import StrategistCore
import VoiceLoopKit

// Siri, Shortcuts and Spotlight (PLAN Phase 5). Actions that need your
// approval in the app (the strategist fetching pages, adding sources or
// saving decisions) are declined when there's nobody to ask.

enum IntentFailure: LocalizedError {
    case libraryUnavailable
    case noProvider

    var errorDescription: String? {
        switch self {
        case .libraryUnavailable: return "SmartWard couldn't open your library."
        case .noProvider: return "Add an API key in SmartWard's settings first."
        }
    }
}

@MainActor
private func libraryContext() throws -> ModelContext {
    guard case .success(let container) = AppStore.container else { throw IntentFailure.libraryUnavailable }
    return container.mainContext
}

// MARK: Projects

struct ProjectEntity: AppEntity {
    static let typeDisplayRepresentation: TypeDisplayRepresentation = "Project"
    static let defaultQuery = ProjectQuery()

    let id: UUID
    let name: String

    var displayRepresentation: DisplayRepresentation { DisplayRepresentation(title: "\(name)") }
}

struct ProjectQuery: EntityQuery {
    @MainActor
    func entities(for identifiers: [UUID]) async throws -> [ProjectEntity] {
        try projects().filter { identifiers.contains($0.id) }
    }

    @MainActor
    func suggestedEntities() async throws -> [ProjectEntity] {
        try projects()
    }

    @MainActor
    private func projects() throws -> [ProjectEntity] {
        let descriptor = FetchDescriptor<Project>(predicate: #Predicate { $0.isActive == true },
                                                  sortBy: [SortDescriptor(\.name)])
        return try libraryContext().fetch(descriptor).map { ProjectEntity(id: $0.id, name: $0.name) }
    }
}

// MARK: Open today's digest

struct OpenDigestIntent: AppIntent {
    static let title: LocalizedStringResource = "Open Today's Digest"
    static let description = IntentDescription("Shows the latest digest of new themes in your reading.")
    static let openAppWhenRun = true

    @MainActor
    func perform() async throws -> some IntentResult {
        AppNavigation.shared.tab = .today
        return .result()
    }
}

struct BriefMeIntent: AppIntent {
    static let title: LocalizedStringResource = "Brief Me"
    static let description = IntentDescription("Reads your top unread articles aloud, a short gist of each.")
    static let openAppWhenRun = true

    @MainActor
    func perform() async throws -> some IntentResult {
        AppNavigation.shared.briefingRequested = true
        return .result()
    }
}

// MARK: Ask the strategist

struct AskStrategistIntent: AppIntent {
    static let title: LocalizedStringResource = "Ask SmartWard"
    static let description = IntentDescription(
        "Asks your research strategist a question, using your library. The chat is saved in SmartWard.")
    static let authenticationPolicy: IntentAuthenticationPolicy = .requiresAuthentication

    @Parameter(title: "Question", inputOptions: String.IntentInputOptions(multiline: true))
    var question: String

    @Parameter(title: "Project")
    var project: ProjectEntity?

    static var parameterSummary: some ParameterSummary {
        Summary("Ask SmartWard \(\.$question)") {
            \.$project
        }
    }

    @MainActor
    func perform() async throws -> some IntentResult & ProvidesDialog {
        let context = try libraryContext()
        let defaults = UserDefaults.standard
        let providerRaw = defaults.string(forKey: "chat.lastProvider") ?? LLMProvider.openrouter.rawValue
        guard let provider = LLMProvider(rawValue: providerRaw), LLMKeychainStore.shared.hasKey(for: provider) else {
            throw IntentFailure.noProvider
        }

        let conversation = Conversation(title: "", mode: .brainstorm)
        conversation.provider = provider.rawValue
        conversation.model = defaults.string(forKey: "chat.lastModel") ?? provider.exampleModelID
        context.insert(conversation)
        if let chosen = project?.id,
           let match = try context.fetch(FetchDescriptor<Project>(predicate: #Predicate { $0.id == chosen })).first {
            match.conversations?.append(conversation)
        }

        let chat = ChatController()
        let reply = await chat.sendUnattended(question, in: conversation, context: context) ?? ""
        try? context.save()

        if let error = chat.errorMessage {
            return .result(dialog: IntentDialog(stringLiteral: error))
        }
        // With SmartWard's lock on, the answer stays behind it.
        if AppLockController.shared.isEnabled {
            return .result(dialog: "Your answer is saved in SmartWard. Open the app to read it.")
        }
        // Read aloud like a voice conversation's reply: no citations, links,
        // code or tables, and a long answer cut at a sentence.
        let spoken = VoiceTurn.spokenText(reply, clean: SpeechService.speakableText,
                                          ending: " The rest is in SmartWard.")
        return .result(dialog: IntentDialog(stringLiteral: spoken.isEmpty ? "No answer came back." : spoken))
    }
}

// MARK: Add a source

enum SourceKindOption: String, AppEnum {
    case feed, arxiv, hackerNews, githubReleases, webPage

    static let typeDisplayRepresentation: TypeDisplayRepresentation = "Source type"
    static let caseDisplayRepresentations: [SourceKindOption: DisplayRepresentation] = [
        .feed: "RSS or Atom feed",
        .arxiv: "arXiv category or search",
        .hackerNews: "Hacker News search",
        .githubReleases: "GitHub releases",
        .webPage: "Web page",
    ]

    var kind: SourceKind {
        switch self {
        case .feed: return .rss
        case .arxiv: return .arxiv
        case .hackerNews: return .hn
        case .githubReleases: return .githubReleases
        case .webPage: return .site
        }
    }
}

struct AddSourceIntent: AppIntent {
    static let title: LocalizedStringResource = "Add a Source to SmartWard"
    static let description = IntentDescription("Follows a feed, arXiv search, Hacker News search, GitHub repo's releases or web page.")

    @Parameter(title: "Type", default: .feed)
    var kind: SourceKindOption

    @Parameter(title: "Address", description: "A feed URL, arXiv category like cs.CL, search words, or owner/repo.")
    var address: String

    @Parameter(title: "Name")
    var name: String?

    static var parameterSummary: some ParameterSummary {
        Summary("Follow \(\.$address) as \(\.$kind)") {
            \.$name
        }
    }

    @MainActor
    func perform() async throws -> some IntentResult & ProvidesDialog {
        let context = try libraryContext()
        let plan = try SourceIntake.plan(kind: kind.kind, address: address, title: name, context: context)
        SourceIntake.add(plan, origin: "shortcut", context: context)
        try context.save()
        return .result(dialog: IntentDialog(stringLiteral: "Following \(plan.title). It's read on the next refresh."))
    }
}

// MARK: Phrases

struct SmartWardShortcuts: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] {
        AppShortcut(intent: AskStrategistIntent(),
                    phrases: ["Ask \(.applicationName)", "Ask \(.applicationName) a question"],
                    shortTitle: "Ask SmartWard",
                    systemImageName: "bubble.left.and.text.bubble.right")
        AppShortcut(intent: OpenDigestIntent(),
                    phrases: ["Open my \(.applicationName) digest", "What's new in \(.applicationName)"],
                    shortTitle: "Today's Digest",
                    systemImageName: "sun.max")
        AppShortcut(intent: BriefMeIntent(),
                    phrases: ["Brief me with \(.applicationName)", "Read my news in \(.applicationName)"],
                    shortTitle: "Brief Me",
                    systemImageName: "speaker.wave.2")
        AppShortcut(intent: AddSourceIntent(),
                    phrases: ["Add a source to \(.applicationName)", "Follow a feed in \(.applicationName)"],
                    shortTitle: "Add a Source",
                    systemImageName: "plus.circle")
    }
}
