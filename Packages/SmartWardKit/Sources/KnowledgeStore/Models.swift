import Foundation
import SwiftData

// CloudKit-compatible from day one (PLAN §4): no unique attributes, every
// property has a default or is optional, every relationship is optional with
// an inverse declared on exactly one side. Uniqueness (e.g. canonical URLs)
// is enforced in code at insert time.

// MARK: - Projects

@Model
public final class Project {
    public var id: UUID = UUID()
    public var name: String = ""
    public var goal: String = ""
    public var constraints: String = ""
    public var isActive: Bool = true
    public var createdAt: Date = Date()

    @Relationship(deleteRule: .cascade, inverse: \Conversation.project)
    public var conversations: [Conversation]? = []
    @Relationship(deleteRule: .cascade, inverse: \ProjectBrief.project)
    public var brief: ProjectBrief?
    @Relationship(deleteRule: .cascade, inverse: \StrategyItem.project)
    public var items: [StrategyItem]? = []
    @Relationship(deleteRule: .cascade, inverse: \ProjectLink.project)
    public var links: [ProjectLink]? = []
    @Relationship(inverse: \ThemeNode.pinnedByProjects)
    public var pinnedNodes: [ThemeNode]? = []

    public init(name: String, goal: String = "", constraints: String = "") {
        self.name = name
        self.goal = goal
        self.constraints = constraints
    }
}

/// Living document revised in place; `sourceWatermark` marks the newest
/// material already incorporated.
@Model
public final class ProjectBrief {
    public var id: UUID = UUID()
    public var project: Project?
    public var markdown: String = ""
    public var sourceWatermark: Date = Date.distantPast
    public var updatedAt: Date = Date()

    public init(markdown: String = "") {
        self.markdown = markdown
    }
}

public enum StrategyItemKind: String, CaseIterable, Codable, Sendable {
    case decision, openQuestion = "open_question", actionItem = "action_item", assumption, risk
}

public enum StrategyItemStatus: String, CaseIterable, Codable, Sendable {
    case open, done, superseded, invalidated
}

/// A durable strategist output: decisions, open questions, action items...
@Model
public final class StrategyItem {
    public var id: UUID = UUID()
    public var project: Project?
    public var kindRaw: String = "decision"
    public var text: String = ""
    public var statusRaw: String = "open"
    public var sourceMessageID: UUID?
    public var createdAt: Date = Date()

    public var kind: StrategyItemKind {
        get { StrategyItemKind(rawValue: kindRaw) ?? .decision }
        set { kindRaw = newValue.rawValue }
    }

    public var status: StrategyItemStatus {
        get { StrategyItemStatus(rawValue: statusRaw) ?? .open }
        set { statusRaw = newValue.rawValue }
    }

    public init(kind: StrategyItemKind, text: String, sourceMessageID: UUID? = nil) {
        self.kindRaw = kind.rawValue
        self.text = text
        self.sourceMessageID = sourceMessageID
    }
}

public enum ProjectLinkKind: String, Codable, Sendable {
    case githubRepo = "github_repo", url
}

/// A repo or URL that defines a project.
@Model
public final class ProjectLink {
    public var id: UUID = UUID()
    public var project: Project?
    public var kindRaw: String = "url"
    public var url: String = ""
    /// "owner/name" for GitHub repos.
    public var repoFullName: String?
    public var isPrivate: Bool = false
    /// Public repos only. Private repos are always on-device only (D5),
    /// whatever this says — see `sendsContentToBYOK`.
    public var includeInExtraction: Bool = true
    /// The `Source` whose articles hold this link's docs/activity.
    public var sourceID: UUID?
    public var defaultBranchSHA: String?
    public var etag: String?
    public var lastSyncedAt: Date?
    public var addedDuring: String = "manual"

    public var kind: ProjectLinkKind {
        get { ProjectLinkKind(rawValue: kindRaw) ?? .url }
        set { kindRaw = newValue.rawValue }
    }

    /// Whether content from this link may be sent to a BYOK provider.
    public var sendsContentToBYOK: Bool {
        !isPrivate && includeInExtraction
    }

    public init(kind: ProjectLinkKind, url: String, repoFullName: String? = nil, isPrivate: Bool = false) {
        self.kindRaw = kind.rawValue
        self.url = url
        self.repoFullName = repoFullName
        self.isPrivate = isPrivate
    }
}

// MARK: - Interests

/// Single row. Seeds triage; refined by reading behavior.
@Model
public final class InterestProfile {
    public var id: UUID = UUID()
    public var statement: String = ""
    public var explicitTopics: [String] = []
    public var mutedTopics: [String] = []
    public var updatedAt: Date = Date()

    public init(statement: String = "") {
        self.statement = statement
    }
}

@Model
public final class ReadingSignal {
    public var id: UUID = UUID()
    public var articleID: UUID = UUID()
    /// open | read_through | star | dismiss | mute_source
    public var kind: String = "open"
    public var createdAt: Date = Date()

    public init(articleID: UUID, kind: String) {
        self.articleID = articleID
        self.kind = kind
    }
}

// MARK: - Sources & articles

@Model
public final class Source {
    public var id: UUID = UUID()
    /// rss | arxiv | hf_papers | hn | github_releases | github_repo | site | manual
    public var kind: String = "rss"
    /// manual | onboarding | dependency_radar
    public var origin: String = "manual"
    public var url: String = ""
    public var title: String = ""
    public var etag: String?
    public var lastModified: String?
    public var lastFetchedAt: Date?
    public var isEnabled: Bool = true

    @Relationship(deleteRule: .nullify, inverse: \Article.source)
    public var articles: [Article]? = []

    public init(kind: String, url: String, title: String = "", origin: String = "manual") {
        self.kind = kind
        self.url = url
        self.title = title
        self.origin = origin
    }
}

public enum ArticleStage: String, CaseIterable, Codable, Sendable {
    case fetched, cleaned, triaged, triagedOut, embedded, extracted, linked, failed
}

@Model
public final class Article {
    public var id: UUID = UUID()
    public var source: Source?
    public var canonicalURL: String = ""
    public var title: String = ""
    public var byline: String?
    public var cleanedText: String = ""
    public var contentHash: String = ""
    public var publishedAt: Date?
    public var ingestedAt: Date = Date()
    public var stageRaw: String = "fetched"
    public var relevance: Double = 0
    public var isRead: Bool = false
    public var isStarred: Bool = false
    /// Content from a private repo: extraction and BYOK context never see it (D5).
    public var localOnly: Bool = false

    @Relationship(deleteRule: .cascade, inverse: \Chunk.article)
    public var chunks: [Chunk]? = []

    public var stage: ArticleStage {
        get { ArticleStage(rawValue: stageRaw) ?? .fetched }
        set { stageRaw = newValue.rawValue }
    }

    public init(canonicalURL: String, title: String, cleanedText: String = "", localOnly: Bool = false) {
        self.canonicalURL = canonicalURL
        self.title = title
        self.cleanedText = cleanedText
        self.localOnly = localOnly
    }
}

// MARK: - Conversations

public enum ConversationMode: String, CaseIterable, Codable, Sendable {
    case onboarding, brainstorm, critique, researchPlan = "research_plan", weeklyReview = "weekly_review"
}

@Model
public final class Conversation {
    public var id: UUID = UUID()
    public var project: Project?
    public var title: String = ""
    public var modeRaw: String = "brainstorm"
    /// When true, extraction for this conversation stays on-device.
    public var offTheRecord: Bool = false
    public var provider: String = ""
    public var model: String = ""
    public var rollingSummary: String = ""
    public var createdAt: Date = Date()
    public var updatedAt: Date = Date()

    @Relationship(deleteRule: .cascade, inverse: \Message.conversation)
    public var messages: [Message]? = []

    public var mode: ConversationMode {
        get { ConversationMode(rawValue: modeRaw) ?? .brainstorm }
        set { modeRaw = newValue.rawValue }
    }

    public init(title: String, mode: ConversationMode = .brainstorm) {
        self.title = title
        self.modeRaw = mode.rawValue
    }
}

@Model
public final class Message {
    public var id: UUID = UUID()
    public var conversation: Conversation?
    /// user | assistant | tool
    public var role: String = "user"
    public var content: String = ""
    public var toolCallsJSON: String?
    public var createdAt: Date = Date()

    @Relationship(deleteRule: .cascade, inverse: \Chunk.message)
    public var chunks: [Chunk]? = []

    public init(role: String, content: String) {
        self.role = role
        self.content = content
    }
}

// MARK: - Retrieval & graph

/// Unit of retrieval. Belongs to exactly one of `article` / `message`.
@Model
public final class Chunk {
    public var id: UUID = UUID()
    public var article: Article?
    public var message: Message?
    public var ordinal: Int = 0
    public var text: String = ""
    /// Binary Float32 vector. Derived data: recomputed per device, not synced.
    @Attribute(.externalStorage) public var vector: Data?
    /// Embedding model that produced `vector`; re-embed when it changes.
    public var embeddingModel: String = ""
    /// Never sent to a BYOK provider (D5). Set for private-repo content.
    public var localOnly: Bool = false

    @Relationship(deleteRule: .cascade, inverse: \Mention.chunk)
    public var mentions: [Mention]? = []

    public init(text: String, ordinal: Int = 0, localOnly: Bool = false) {
        self.text = text
        self.ordinal = ordinal
        self.localOnly = localOnly
    }
}

@Model
public final class ThemeNode {
    public var id: UUID = UUID()
    /// concept | technique | model | paper | org | person | tool | dataset
    public var type: String = "concept"
    public var canonicalLabel: String = ""
    /// "type:normalized-label" — GraphKit's node id convention.
    public var normalizedKey: String = ""
    public var summary: String?
    public var createdAt: Date = Date()

    @Relationship(deleteRule: .cascade, inverse: \EntityAlias.node)
    public var aliases: [EntityAlias]? = []
    @Relationship(deleteRule: .cascade, inverse: \Mention.node)
    public var mentions: [Mention]? = []
    public var pinnedByProjects: [Project]? = []

    public init(type: String, canonicalLabel: String) {
        self.type = type
        self.canonicalLabel = canonicalLabel
        self.normalizedKey = ThemeNode.normalizedKey(type: type, label: canonicalLabel)
    }

    /// `"type:label"` lowercased, with runs of whitespace, hyphens and
    /// underscores collapsed to a single hyphen.
    public static func normalizedKey(type: String, label: String) -> String {
        let lowered = label.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        var out = ""
        var pendingSeparator = false
        for scalar in lowered.unicodeScalars {
            if CharacterSet.whitespaces.contains(scalar) || scalar == "-" || scalar == "_" {
                pendingSeparator = !out.isEmpty
            } else {
                if pendingSeparator { out.append("-") }
                pendingSeparator = false
                out.unicodeScalars.append(scalar)
            }
        }
        return "\(type.lowercased()):\(out)"
    }
}

@Model
public final class EntityAlias {
    public var id: UUID = UUID()
    public var node: ThemeNode?
    public var alias: String = ""
    /// auto | user — user aliases always win.
    public var origin: String = "auto"

    public init(alias: String, origin: String = "auto") {
        self.alias = alias
        self.origin = origin
    }
}

/// Append-only link from a node to where it was seen. Node strength is derived
/// from mentions (see `ThemeStrength`), never stored as a mutable counter, so
/// devices adding mentions offline merge without conflict.
@Model
public final class Mention {
    public var id: UUID = UUID()
    public var node: ThemeNode?
    public var chunk: Chunk?
    public var confidence: Double = 1
    public var createdAt: Date = Date()

    public init(confidence: Double = 1, createdAt: Date = Date()) {
        self.confidence = confidence
        self.createdAt = createdAt
    }
}

/// A relation with evidence. Weight is derived from how many evidence rows
/// share (source, target, type).
@Model
public final class ThemeEdge {
    public var id: UUID = UUID()
    public var sourceNodeID: UUID = UUID()
    public var targetNodeID: UUID = UUID()
    /// RELATES_TO | BUILDS_ON | IMPROVES_ON | COMPETES_WITH | USES | EVALUATED_ON | AUTHORED_BY | RELEASED_BY
    public var type: String = "RELATES_TO"
    public var evidenceChunkID: UUID?
    public var createdAt: Date = Date()

    public init(sourceNodeID: UUID, targetNodeID: UUID, type: String, evidenceChunkID: UUID? = nil) {
        self.sourceNodeID = sourceNodeID
        self.targetNodeID = targetNodeID
        self.type = type
        self.evidenceChunkID = evidenceChunkID
    }
}

// MARK: - Usage

@Model
public final class UsageRecord {
    public var id: UUID = UUID()
    public var provider: String = ""
    public var model: String = ""
    /// chat | extraction | triage | digest | brief | onboarding
    public var feature: String = "chat"
    public var inputTokens: Int = 0
    public var outputTokens: Int = 0
    public var costUSD: Double = 0
    public var createdAt: Date = Date()

    public init(provider: String, model: String, feature: String,
                inputTokens: Int, outputTokens: Int, costUSD: Double = 0) {
        self.provider = provider
        self.model = model
        self.feature = feature
        self.inputTokens = inputTokens
        self.outputTokens = outputTokens
        self.costUSD = costUSD
    }
}
