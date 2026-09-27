import Foundation
import SwiftData
import BYOKLLMKit
import KnowledgeStore

/// What onboarding proposes, for the user to confirm (PLAN §5.8). Nothing is
/// created until `apply(to:)` runs on the confirmed proposal.
public struct OnboardingProposal: Codable, Equatable, Sendable {
    public struct ProjectProposal: Codable, Equatable, Sendable, Identifiable {
        public var name: String
        public var goal: String
        public var constraints: String
        /// URLs (repos or pages) that belong to this project.
        public var links: [String]

        public var id: String { name }

        public init(name: String, goal: String = "", constraints: String = "", links: [String] = []) {
            self.name = name
            self.goal = goal
            self.constraints = constraints
            self.links = links
        }
    }

    public struct SourceProposal: Codable, Equatable, Sendable, Identifiable {
        /// One of `OnboardingProposal.sourceKinds`.
        public var kind: String
        public var url: String
        public var title: String

        public var id: String { url }

        public init(kind: String, url: String, title: String = "") {
            self.kind = kind
            self.url = url
            self.title = title
        }
    }

    public var projects: [ProjectProposal]
    public var sources: [SourceProposal]
    public var interestStatement: String
    public var topics: [String]
    public var mutedTopics: [String]

    public init(projects: [ProjectProposal] = [], sources: [SourceProposal] = [],
                interestStatement: String = "", topics: [String] = [], mutedTopics: [String] = []) {
        self.projects = projects
        self.sources = sources
        self.interestStatement = interestStatement
        self.topics = topics
        self.mutedTopics = mutedTopics
    }

    /// Source kinds onboarding may propose.
    public static let sourceKinds = ["rss", "arxiv", "hf_papers", "hn", "github_releases", "site"]

    /// JSON Schema for structured output. Strict-mode compatible: every object
    /// lists all its properties as required and forbids extras.
    public static var schema: JSONValue {
        let string: JSONValue = ["type": "string"]
        let stringArray: JSONValue = ["type": "array", "items": string]
        let projectProperties: JSONValue = ["name": string, "goal": string, "constraints": string, "links": stringArray]
        let project: JSONValue = [
            "type": "object",
            "properties": projectProperties,
            "required": ["name", "goal", "constraints", "links"],
            "additionalProperties": false,
        ]
        let kinds: [JSONValue] = sourceKinds.map { .string($0) }
        let kind: JSONValue = ["type": "string", "enum": .array(kinds)]
        let sourceProperties: JSONValue = ["kind": kind, "url": string, "title": string]
        let source: JSONValue = [
            "type": "object",
            "properties": sourceProperties,
            "required": ["kind", "url", "title"],
            "additionalProperties": false,
        ]
        let projectList: JSONValue = ["type": "array", "items": project]
        let sourceList: JSONValue = ["type": "array", "items": source]
        let properties: JSONValue = [
            "projects": projectList,
            "sources": sourceList,
            "interestStatement": string,
            "topics": stringArray,
            "mutedTopics": stringArray,
        ]
        return [
            "type": "object",
            "properties": properties,
            "required": ["projects", "sources", "interestStatement", "topics", "mutedTopics"],
            "additionalProperties": false,
        ]
    }
}

public enum OnboardingSynthesizer {

    static let instructions = """
    You turn an onboarding interview into a setup proposal for SmartWard, a research strategist app.
    - projects: one per distinct thing the user is building. Group repos that are variants of the same effort \
    into one project. name is short; goal is one sentence; constraints only if stated. links: every pasted URL \
    that belongs to that project.
    - sources: feeds and APIs worth following for their interests. Prefer RSS/Atom feeds, arXiv queries \
    (url like "cat:cs.LG AND all:agents"), Hugging Face daily papers, Hacker News search queries, and GitHub \
    release feeds for tools they depend on. Only include URLs you are confident exist.
    - interestStatement: 2–4 sentences describing what to watch for, in the second person.
    - topics / mutedTopics: short topic phrases the user wants more of / less of.
    Use only what the user said or linked. Leave fields empty rather than guessing.
    """

    /// The structured-output request. The transcript is sent as one user
    /// message so the model reads it as data rather than continuing it.
    public static func request(provider: LLMProvider, model: String,
                               transcript: [LLMChatMessage], links: [String]) -> LLMRequest {
        let lines = transcript.compactMap { message -> String? in
            let text = message.text.trimmingCharacters(in: .whitespacesAndNewlines)
            guard !text.isEmpty else { return nil }
            switch message.role {
            case .user:      return "User: \(text)"
            case .assistant: return "SmartWard: \(text)"
            default:         return nil
            }
        }
        var body = "Interview transcript:\n" + (lines.isEmpty ? "(none)" : lines.joined(separator: "\n"))
        let cleanLinks = links.map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }.filter { !$0.isEmpty }
        body += "\n\nLinks the user pasted:\n" + (cleanLinks.isEmpty ? "(none)" : cleanLinks.map { "- \($0)" }.joined(separator: "\n"))

        return LLMRequest(provider: provider,
                          model: model,
                          messages: [.system(instructions), .user(body)],
                          responseFormat: .jsonSchema(name: "onboarding_proposal", schema: OnboardingProposal.schema),
                          maxTokens: 4096)
    }

    /// Decodes a structured reply, tolerating Markdown code fences.
    public static func decode(_ text: String) throws -> OnboardingProposal {
        var trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmed.hasPrefix("```") {
            if let newline = trimmed.firstIndex(of: "\n") {
                trimmed = String(trimmed[trimmed.index(after: newline)...])
            }
            if let fence = trimmed.range(of: "```", options: .backwards) {
                trimmed = String(trimmed[..<fence.lowerBound])
            }
        }
        return try JSONDecoder().decode(OnboardingProposal.self, from: Data(trimmed.utf8))
    }
}

public extension OnboardingProposal {

    struct ApplyResult: Equatable, Sendable {
        public var projectsCreated = 0
        public var projectsUpdated = 0
        public var linksAdded = 0
        public var sourcesAdded = 0
    }

    /// Creates what the user confirmed. Safe to re-run: projects match by name
    /// (case-insensitive) and gain only new links; sources match by URL; the
    /// single `InterestProfile` is updated and its topic lists merged.
    @MainActor
    @discardableResult
    func apply(to context: ModelContext) throws -> ApplyResult {
        var result = ApplyResult()
        let existingProjects = try context.fetch(FetchDescriptor<Project>())

        for proposal in projects {
            let name = proposal.name.trimmingCharacters(in: .whitespacesAndNewlines)
            guard !name.isEmpty else { continue }

            let project: Project
            if let match = existingProjects.first(where: { $0.name.lowercased() == name.lowercased() }) {
                project = match
                if project.goal.isEmpty { project.goal = proposal.goal }
                if project.constraints.isEmpty { project.constraints = proposal.constraints }
                result.projectsUpdated += 1
            } else {
                project = Project(name: name, goal: proposal.goal, constraints: proposal.constraints)
                context.insert(project)
                result.projectsCreated += 1
            }

            let knownURLs = Set((project.links ?? []).map { $0.url.lowercased() })
            var seen = knownURLs
            for raw in proposal.links {
                let link = ProjectLink.fromPastedURL(raw)
                guard !link.url.isEmpty, !seen.contains(link.url.lowercased()) else { continue }
                seen.insert(link.url.lowercased())
                link.addedDuring = "onboarding"
                project.links?.append(link)
                result.linksAdded += 1
            }
        }

        let existingSources = try context.fetch(FetchDescriptor<Source>())
        var knownSources = Set(existingSources.map { $0.url.lowercased() })
        for proposal in sources {
            let url = proposal.url.trimmingCharacters(in: .whitespacesAndNewlines)
            guard OnboardingProposal.sourceKinds.contains(proposal.kind), !url.isEmpty,
                  !knownSources.contains(url.lowercased()) else { continue }
            knownSources.insert(url.lowercased())
            context.insert(Source(kind: proposal.kind, url: url, title: proposal.title, origin: "onboarding"))
            result.sourcesAdded += 1
        }

        let profile = try context.fetch(FetchDescriptor<InterestProfile>()).first ?? {
            let created = InterestProfile()
            context.insert(created)
            return created
        }()
        let statement = interestStatement.trimmingCharacters(in: .whitespacesAndNewlines)
        if !statement.isEmpty { profile.statement = statement }
        profile.explicitTopics = Self.mergeTopics(profile.explicitTopics, topics)
        profile.mutedTopics = Self.mergeTopics(profile.mutedTopics, mutedTopics)
        profile.updatedAt = Date()

        try context.save()
        return result
    }

    /// Union preserving order, case-insensitive, blanks dropped.
    static func mergeTopics(_ existing: [String], _ new: [String]) -> [String] {
        var seen = Set<String>()
        var out: [String] = []
        for topic in existing + new {
            let trimmed = topic.trimmingCharacters(in: .whitespacesAndNewlines)
            guard !trimmed.isEmpty, seen.insert(trimmed.lowercased()).inserted else { continue }
            out.append(trimmed)
        }
        return out
    }
}
