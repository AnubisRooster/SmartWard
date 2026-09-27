import Foundation
import KnowledgeStore

/// A value snapshot of the project context the strategist is given, so prompt
/// building is pure and testable without a store.
public struct ProjectSnapshot: Equatable, Sendable {
    public struct Item: Equatable, Sendable {
        public let kind: StrategyItemKind
        public let text: String

        public init(kind: StrategyItemKind, text: String) {
            self.kind = kind
            self.text = text
        }
    }

    public let name: String
    public let goal: String
    public let constraints: String
    public let brief: String
    /// Open strategy items only, oldest first.
    public let openItems: [Item]
    public let linkNames: [String]

    public init(name: String, goal: String = "", constraints: String = "", brief: String = "",
                openItems: [Item] = [], linkNames: [String] = []) {
        self.name = name
        self.goal = goal
        self.constraints = constraints
        self.brief = brief
        self.openItems = openItems
        self.linkNames = linkNames
    }

    /// Private-repo links are left out: nothing about private repos goes into
    /// BYOK context, not even their names (D5).
    public init(project: Project) {
        let items = (project.items ?? [])
            .filter { $0.status == .open }
            .sorted { $0.createdAt < $1.createdAt }
            .map { Item(kind: $0.kind, text: $0.text) }
        self.init(name: project.name,
                  goal: project.goal,
                  constraints: project.constraints,
                  brief: project.brief?.markdown ?? "",
                  openItems: items,
                  linkNames: (project.links ?? []).filter { !$0.isPrivate }.map { $0.repoFullName ?? $0.url }.sorted())
    }
}

public enum StrategistPrompt {

    /// The system prompt for a conversation: persona, mode profile, grounding
    /// rules, and (when scoped to a project) its current state.
    public static func system(mode: ConversationMode, project: ProjectSnapshot?) -> String {
        var sections = [persona, modeProfile(mode), grounding(hasProject: project != nil)]
        if let project {
            sections.append(projectContext(project))
        }
        return sections.joined(separator: "\n\n")
    }

    static let persona = """
    You are SmartWard, a research strategist and thinking partner for someone building software and AI products. \
    Be direct and specific. Prefer a clear recommendation with its main trade-off over a survey of options. \
    Push back on weak assumptions, and say plainly when you don't know.
    """

    static func modeProfile(_ mode: ConversationMode) -> String {
        switch mode {
        case .brainstorm:
            return """
            Mode: Brainstorm. Build on the user's ideas, widen the option space, and connect ideas to related \
            approaches they haven't mentioned. End with the two or three most promising directions.
            """
        case .critique:
            return """
            Mode: Critique. Find the weakest assumption first and say why it could fail. Look for counter-evidence \
            and failure modes. Be constructive: every criticism comes with what would fix or test it.
            """
        case .researchPlan:
            return """
            Mode: Research plan. Turn the question into concrete sub-questions, what is already known, what to read \
            or test next, and how to tell when the question is answered.
            """
        case .weeklyReview:
            return """
            Mode: Weekly review. Walk through open questions and action items, flag anything stale or superseded, \
            and propose the few things that matter most next week.
            """
        case .onboarding:
            return """
            Mode: Onboarding. You are setting SmartWard up for a new user. Your first message, already shown, asked \
            what they're building. Cover this checklist, one short question at a time, following up only when an \
            answer is vague: \(onboardingChecklist.joined(separator: "; ")). Ask them to paste links to project repos \
            or pages in the links field. Keep it under ten questions. When the checklist is covered, briefly summarize \
            what you heard and tell them to tap "Build my setup".
            """
        }
    }

    /// What the onboarding interview must cover (PLAN §5.8).
    public static let onboardingChecklist = [
        "the projects they're building and each one's goal",
        "what's blocking them right now",
        "topics and technologies they want to keep up with",
        "topics they want to ignore",
        "sources they already trust (blogs, newsletters, researchers, labs)",
        "links to their project repos or pages",
    ]

    /// The first assistant message of an onboarding interview, shown without a
    /// model call.
    public static let onboardingGreeting = """
    Hi, I'm SmartWard. I'll ask a few quick questions so I can follow the right research for you and connect it \
    to your work. To start: what are you building right now? Name each project and what you want it to do.
    """

    /// Tools each mode may use (PLAN §5.5: a mode is a prompt profile plus a
    /// tool allow-list). Critique and weekly review don't add sources; the
    /// onboarding interview uses no tools.
    public static func allowedTools(for mode: ConversationMode) -> Set<String> {
        let reading: Set<String> = ["search_corpus", "graph_neighbors", "open_article"]
        let project: Set<String> = ["list_project_state", "record_strategy_item", "propose_brief_update"]
        switch mode {
        case .brainstorm, .researchPlan:
            return reading.union(project).union(["fetch_url", "add_source"])
        case .critique:
            return reading.union(project).union(["fetch_url"])
        case .weeklyReview:
            return reading.union(project)
        case .onboarding:
            return []
        }
    }

    static func grounding(hasProject: Bool) -> String {
        var rules = """
        Grounding: separate what comes from the user's own records from your general knowledge, and never invent \
        sources, papers, or quotes.
        """
        if hasProject {
            rules += """
             Use list_project_state when you need the project's current decisions and open questions. When the user \
            settles something, or an open question or action item emerges, record it with record_strategy_item and \
            mention that you did.
            """
        }
        return rules
    }

    static func projectContext(_ project: ProjectSnapshot) -> String {
        var lines = ["Project: \(project.name)"]
        if !project.goal.isEmpty { lines.append("Goal: \(project.goal)") }
        if !project.constraints.isEmpty { lines.append("Constraints: \(project.constraints)") }
        if !project.linkNames.isEmpty { lines.append("Linked: \(project.linkNames.joined(separator: ", "))") }
        if !project.openItems.isEmpty {
            lines.append("Open items:")
            lines += project.openItems.map { "- [\(label(for: $0.kind))] \($0.text)" }
        }
        if !project.brief.isEmpty {
            lines.append("Brief:\n\(project.brief)")
        }
        return lines.joined(separator: "\n")
    }

    static func label(for kind: StrategyItemKind) -> String {
        switch kind {
        case .decision:     return "decision"
        case .openQuestion: return "open question"
        case .actionItem:   return "action item"
        case .assumption:   return "assumption"
        case .risk:         return "risk"
        }
    }
}
