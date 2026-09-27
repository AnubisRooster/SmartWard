import Foundation
import SwiftData

/// One theme cluster in a digest: what's new about it, where it came from,
/// and which projects it touches. Stored as JSON on `Digest`, so a digest
/// keeps reading the same even after the graph changes.
public struct DigestCluster: Codable, Equatable, Identifiable, Sendable {
    public struct ArticleRef: Codable, Equatable, Sendable {
        public var id: UUID
        public var title: String
        public var url: String

        public init(id: UUID, title: String, url: String) {
            self.id = id
            self.title = title
            self.url = url
        }
    }

    public struct ProjectRef: Codable, Equatable, Sendable {
        public var id: UUID
        public var name: String

        public init(id: UUID, name: String) {
            self.id = id
            self.name = name
        }
    }

    public var id: UUID
    public var title: String
    /// Theme labels, most mentioned first.
    public var themes: [String]
    public var nodeIDs: [UUID]
    public var articles: [ArticleRef]
    public var articleCount: Int
    public var mentionCount: Int
    /// Share of the cluster's themes that are new in this period, 0...1.
    public var novelty: Double
    /// Summed relevance to your active projects.
    public var relevance: Double
    public var score: Double
    public var projects: [ProjectRef]
    public var summary: String
    /// onDevice | byok | none (a list of titles, when no model could summarize)
    public var summaryTier: String

    public init(id: UUID = UUID(), title: String, themes: [String], nodeIDs: [UUID], articles: [ArticleRef],
                articleCount: Int, mentionCount: Int, novelty: Double, relevance: Double, score: Double,
                projects: [ProjectRef], summary: String = "", summaryTier: String = "none") {
        self.id = id
        self.title = title
        self.themes = themes
        self.nodeIDs = nodeIDs
        self.articles = articles
        self.articleCount = articleCount
        self.mentionCount = mentionCount
        self.novelty = novelty
        self.relevance = relevance
        self.score = score
        self.projects = projects
        self.summary = summary
        self.summaryTier = summaryTier
    }
}

/// New material since the previous digest, clustered by theme and ranked
/// against your projects (FR-13).
@Model
public final class Digest {
    public var id: UUID = UUID()
    public var createdAt: Date = Date()
    public var periodStart: Date = Date.distantPast
    public var periodEnd: Date = Date()
    /// `[DigestCluster]` as JSON; read it through `clusters`.
    public var clustersJSON: String = "[]"
    public var readAt: Date?
    public var notified: Bool = false

    public var clusters: [DigestCluster] {
        get { (try? JSONDecoder().decode([DigestCluster].self, from: Data(clustersJSON.utf8))) ?? [] }
        set { clustersJSON = Self.encode(newValue) }
    }

    public init(periodStart: Date, periodEnd: Date, clusters: [DigestCluster]) {
        self.periodStart = periodStart
        self.periodEnd = periodEnd
        self.clustersJSON = Self.encode(clusters)
    }

    static func encode(_ clusters: [DigestCluster]) -> String {
        let data = (try? JSONEncoder().encode(clusters)) ?? Data("[]".utf8)
        return String(data: data, encoding: .utf8) ?? "[]"
    }
}
