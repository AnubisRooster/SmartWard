import Foundation
import SwiftData

/// The whole library as plain, versioned JSON (NFR-3: open formats). Every
/// model is a flat table and relationships are ids, so the archive reads
/// like a database dump and restores without ambiguity. It's the "Library
/// (JSON)" export and the payload of an encrypted backup.
public struct LibraryArchive: Codable, Equatable, Sendable {
    public static let format = "smartward-library"
    public static let currentVersion = 1

    public var format: String = LibraryArchive.format
    public var version: Int = LibraryArchive.currentVersion
    public var exportedAt: Date
    /// Private-repo content (D5) is left out unless this is set.
    public var includesPrivate: Bool
    /// Chunk and label vectors; without them a restore re-embeds.
    public var includesEmbeddings: Bool

    public var projects: [ProjectRecord] = []
    public var briefs: [BriefRecord] = []
    public var briefRevisions: [BriefRevisionRecord] = []
    public var strategyItems: [StrategyItemRecord] = []
    public var projectLinks: [ProjectLinkRecord] = []
    public var interestProfiles: [InterestProfileRecord] = []
    public var readingSignals: [ReadingSignalRecord] = []
    public var sources: [SourceRecord] = []
    public var articles: [ArticleRecord] = []
    public var conversations: [ConversationRecord] = []
    public var messages: [MessageRecord] = []
    public var chunks: [ChunkRecord] = []
    public var themeNodes: [ThemeNodeRecord] = []
    public var aliases: [AliasRecord] = []
    public var mentions: [MentionRecord] = []
    public var edges: [EdgeRecord] = []
    public var mergeSuggestions: [MergeSuggestionRecord] = []
    public var usage: [UsageRecordRecord] = []
    public var digests: [DigestRecord] = []

    public init(exportedAt: Date, includesPrivate: Bool, includesEmbeddings: Bool) {
        self.exportedAt = exportedAt
        self.includesPrivate = includesPrivate
        self.includesEmbeddings = includesEmbeddings
    }

    // MARK: Records

    public struct ProjectRecord: Codable, Equatable, Sendable {
        public var id: UUID, name: String, goal: String, constraints: String, isActive: Bool, createdAt: Date
        public var pinnedNodeIDs: [UUID]
    }
    public struct BriefRecord: Codable, Equatable, Sendable {
        public var id: UUID, projectID: UUID?, markdown: String, sourceWatermark: Date, updatedAt: Date
    }
    public struct BriefRevisionRecord: Codable, Equatable, Sendable {
        public var id: UUID, briefID: UUID?, baseMarkdown: String, proposedMarkdown: String, rationale: String
        public var origin: String, status: String, coversUntil: Date?, createdAt: Date, resolvedAt: Date?
    }
    public struct StrategyItemRecord: Codable, Equatable, Sendable {
        public var id: UUID, projectID: UUID?, kind: String, text: String, status: String
        public var sourceMessageID: UUID?, createdAt: Date
    }
    public struct ProjectLinkRecord: Codable, Equatable, Sendable {
        public var id: UUID, projectID: UUID?, kind: String, url: String, repoFullName: String?, isPrivate: Bool
        public var includeInExtraction: Bool, sourceID: UUID?, defaultBranchSHA: String?, etag: String?
        public var lastSyncedAt: Date?, addedDuring: String
    }
    public struct InterestProfileRecord: Codable, Equatable, Sendable {
        public var id: UUID, statement: String, explicitTopics: [String], mutedTopics: [String], updatedAt: Date
    }
    public struct ReadingSignalRecord: Codable, Equatable, Sendable {
        public var id: UUID, articleID: UUID, kind: String, createdAt: Date
    }
    public struct SourceRecord: Codable, Equatable, Sendable {
        public var id: UUID, kind: String, origin: String, url: String, title: String, etag: String?
        public var lastModified: String?, lastFetchedAt: Date?, lastError: String?, isEnabled: Bool
    }
    public struct ArticleRecord: Codable, Equatable, Sendable {
        public var id: UUID, sourceID: UUID?, canonicalURL: String, title: String, byline: String?, summary: String
        public var cleanedText: String, contentHash: String, publishedAt: Date?, ingestedAt: Date, stage: String
        public var relevance: Double, relevanceReason: String, isRead: Bool, isStarred: Bool, localOnly: Bool
        public var projectID: UUID?
    }
    public struct ConversationRecord: Codable, Equatable, Sendable {
        public var id: UUID, projectID: UUID?, title: String, mode: String, offTheRecord: Bool, provider: String
        public var model: String, rollingSummary: String, createdAt: Date, updatedAt: Date
    }
    public struct MessageRecord: Codable, Equatable, Sendable {
        public var id: UUID, conversationID: UUID?, role: String, content: String, toolCallsJSON: String?
        public var createdAt: Date, indexedAt: Date?, referencesJSON: String?
    }
    public struct ChunkRecord: Codable, Equatable, Sendable {
        public var id: UUID, articleID: UUID?, messageID: UUID?, ordinal: Int, text: String
        public var embeddingModel: String, vector: Data?, localOnly: Bool
    }
    public struct ThemeNodeRecord: Codable, Equatable, Sendable {
        public var id: UUID, type: String, canonicalLabel: String, normalizedKey: String, summary: String?
        public var createdAt: Date, labelVector: Data?, labelVectorModel: String
    }
    public struct AliasRecord: Codable, Equatable, Sendable {
        public var id: UUID, nodeID: UUID?, alias: String, origin: String
    }
    public struct MentionRecord: Codable, Equatable, Sendable {
        public var id: UUID, nodeID: UUID?, chunkID: UUID?, confidence: Double, createdAt: Date
    }
    public struct EdgeRecord: Codable, Equatable, Sendable {
        public var id: UUID, sourceNodeID: UUID, targetNodeID: UUID, type: String, evidenceChunkID: UUID?
        public var createdAt: Date
    }
    public struct MergeSuggestionRecord: Codable, Equatable, Sendable {
        public var id: UUID, nodeID: UUID, candidateID: UUID, similarity: Double, status: String, createdAt: Date
    }
    public struct UsageRecordRecord: Codable, Equatable, Sendable {
        public var id: UUID, provider: String, model: String, feature: String, inputTokens: Int, outputTokens: Int
        public var costUSD: Double, costEstimated: Bool, createdAt: Date
    }
    public struct DigestRecord: Codable, Equatable, Sendable {
        public var id: UUID, createdAt: Date, periodStart: Date, periodEnd: Date, clustersJSON: String
        public var readAt: Date?, notified: Bool
    }

    // MARK: Encoding

    public enum ArchiveError: LocalizedError, Equatable {
        case notAnArchive
        case newerVersion(Int)

        public var errorDescription: String? {
            switch self {
            case .notAnArchive: return "That file isn't a SmartWard library."
            case .newerVersion(let version):
                return "That library was saved by a newer SmartWard (format \(version)). Update the app to open it."
            }
        }
    }

    /// Sorted keys and exact dates (seconds as a double), so the same
    /// library always encodes to the same bytes and restores exactly.
    public func encoded() throws -> Data {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys, .withoutEscapingSlashes]
        return try encoder.encode(self)
    }

    public static func decode(_ data: Data) throws -> LibraryArchive {
        struct Header: Decodable { let format: String; let version: Int }
        guard let header = try? JSONDecoder().decode(Header.self, from: data), header.format == format else {
            throw ArchiveError.notAnArchive
        }
        guard header.version <= currentVersion else { throw ArchiveError.newerVersion(header.version) }
        return try JSONDecoder().decode(LibraryArchive.self, from: data)
    }
}

// MARK: - Snapshot

public extension LibraryArchive {

    /// Reads the whole library. Without `includePrivate`, private-repo
    /// articles, their chunks and mentions, private links and their sources,
    /// and themes known only from private content are left out.
    @MainActor
    static func snapshot(context: ModelContext, includePrivate: Bool, includeEmbeddings: Bool,
                         now: Date = Date()) throws -> LibraryArchive {
        var archive = LibraryArchive(exportedAt: now, includesPrivate: includePrivate,
                                     includesEmbeddings: includeEmbeddings)
        func all<T: PersistentModel>(_ type: T.Type) throws -> [T] { try context.fetch(FetchDescriptor<T>()) }

        // What stays private.
        let links = try all(ProjectLink.self)
        let privateSources = includePrivate ? [] : Set(links.filter(\.isPrivate).compactMap(\.sourceID))
        let articles = try all(Article.self).filter { article in
            includePrivate || !(article.localOnly || article.source.map { privateSources.contains($0.id) } ?? false)
        }
        let keptArticles = Set(articles.map(\.id))
        let chunks = try all(Chunk.self).filter { chunk in
            if includePrivate { return true }
            if chunk.localOnly { return false }
            if let article = chunk.article { return keptArticles.contains(article.id) }
            return true
        }
        let keptChunks = Set(chunks.map(\.id))
        let allMentions = try all(Mention.self)
        let mentions = allMentions.filter { mention in
            guard let chunk = mention.chunk else { return true }
            return keptChunks.contains(chunk.id)
        }
        // A theme mentioned only in private content would reveal it.
        let mentionedNodes = Set(allMentions.compactMap { $0.node?.id })
        let publicNodes = Set(mentions.compactMap { $0.node?.id })
        let nodes = try all(ThemeNode.self).filter { !mentionedNodes.contains($0.id) || publicNodes.contains($0.id) }
        let keptNodes = Set(nodes.map(\.id))

        for project in try all(Project.self) {
            archive.projects.append(.init(
                id: project.id, name: project.name, goal: project.goal, constraints: project.constraints,
                isActive: project.isActive, createdAt: project.createdAt,
                pinnedNodeIDs: (project.pinnedNodes ?? []).map(\.id).filter(keptNodes.contains).sorted(by: Self.order)))
        }
        for brief in try all(ProjectBrief.self) {
            archive.briefs.append(.init(id: brief.id, projectID: brief.project?.id, markdown: brief.markdown,
                                        sourceWatermark: brief.sourceWatermark, updatedAt: brief.updatedAt))
        }
        for revision in try all(BriefRevision.self) {
            archive.briefRevisions.append(.init(
                id: revision.id, briefID: revision.brief?.id, baseMarkdown: revision.baseMarkdown,
                proposedMarkdown: revision.proposedMarkdown, rationale: revision.rationale, origin: revision.origin,
                status: revision.statusRaw, coversUntil: revision.coversUntil, createdAt: revision.createdAt,
                resolvedAt: revision.resolvedAt))
        }
        for item in try all(StrategyItem.self) {
            archive.strategyItems.append(.init(id: item.id, projectID: item.project?.id, kind: item.kindRaw,
                                               text: item.text, status: item.statusRaw,
                                               sourceMessageID: item.sourceMessageID, createdAt: item.createdAt))
        }
        for link in links where includePrivate || !link.isPrivate {
            archive.projectLinks.append(.init(
                id: link.id, projectID: link.project?.id, kind: link.kindRaw, url: link.url,
                repoFullName: link.repoFullName, isPrivate: link.isPrivate,
                includeInExtraction: link.includeInExtraction, sourceID: link.sourceID,
                defaultBranchSHA: link.defaultBranchSHA, etag: link.etag, lastSyncedAt: link.lastSyncedAt,
                addedDuring: link.addedDuring))
        }
        for profile in try all(InterestProfile.self) {
            archive.interestProfiles.append(.init(id: profile.id, statement: profile.statement,
                                                  explicitTopics: profile.explicitTopics,
                                                  mutedTopics: profile.mutedTopics, updatedAt: profile.updatedAt))
        }
        for signal in try all(ReadingSignal.self) where keptArticles.contains(signal.articleID) {
            archive.readingSignals.append(.init(id: signal.id, articleID: signal.articleID, kind: signal.kind,
                                                createdAt: signal.createdAt))
        }
        for source in try all(Source.self) where !privateSources.contains(source.id) {
            archive.sources.append(.init(
                id: source.id, kind: source.kind, origin: source.origin, url: source.url, title: source.title,
                etag: source.etag, lastModified: source.lastModified, lastFetchedAt: source.lastFetchedAt,
                lastError: source.lastError, isEnabled: source.isEnabled))
        }
        for article in articles {
            archive.articles.append(.init(
                id: article.id, sourceID: article.source?.id, canonicalURL: article.canonicalURL, title: article.title,
                byline: article.byline, summary: article.summary, cleanedText: article.cleanedText,
                contentHash: article.contentHash, publishedAt: article.publishedAt, ingestedAt: article.ingestedAt,
                stage: article.stageRaw, relevance: article.relevance, relevanceReason: article.relevanceReason,
                isRead: article.isRead, isStarred: article.isStarred, localOnly: article.localOnly,
                projectID: article.projectID))
        }
        for conversation in try all(Conversation.self) {
            archive.conversations.append(.init(
                id: conversation.id, projectID: conversation.project?.id, title: conversation.title,
                mode: conversation.modeRaw, offTheRecord: conversation.offTheRecord, provider: conversation.provider,
                model: conversation.model, rollingSummary: conversation.rollingSummary,
                createdAt: conversation.createdAt, updatedAt: conversation.updatedAt))
        }
        for message in try all(Message.self) {
            archive.messages.append(.init(
                id: message.id, conversationID: message.conversation?.id, role: message.role,
                content: message.content, toolCallsJSON: message.toolCallsJSON, createdAt: message.createdAt,
                indexedAt: message.indexedAt, referencesJSON: message.referencesJSON))
        }
        for chunk in chunks {
            archive.chunks.append(.init(
                id: chunk.id, articleID: chunk.article?.id, messageID: chunk.message?.id, ordinal: chunk.ordinal,
                text: chunk.text, embeddingModel: includeEmbeddings ? chunk.embeddingModel : "",
                vector: includeEmbeddings ? chunk.vector : nil, localOnly: chunk.localOnly))
        }
        for node in nodes {
            archive.themeNodes.append(.init(
                id: node.id, type: node.type, canonicalLabel: node.canonicalLabel, normalizedKey: node.normalizedKey,
                summary: node.summary, createdAt: node.createdAt,
                labelVector: includeEmbeddings ? node.labelVector : nil,
                labelVectorModel: includeEmbeddings ? node.labelVectorModel : ""))
        }
        for alias in try all(EntityAlias.self) where alias.node.map({ keptNodes.contains($0.id) }) ?? true {
            archive.aliases.append(.init(id: alias.id, nodeID: alias.node?.id, alias: alias.alias, origin: alias.origin))
        }
        for mention in mentions where mention.node.map({ keptNodes.contains($0.id) }) ?? true {
            archive.mentions.append(.init(id: mention.id, nodeID: mention.node?.id, chunkID: mention.chunk?.id,
                                          confidence: mention.confidence, createdAt: mention.createdAt))
        }
        for edge in try all(ThemeEdge.self)
        where keptNodes.contains(edge.sourceNodeID) && keptNodes.contains(edge.targetNodeID) {
            let evidence = edge.evidenceChunkID.flatMap { keptChunks.contains($0) ? $0 : nil }
            archive.edges.append(.init(id: edge.id, sourceNodeID: edge.sourceNodeID, targetNodeID: edge.targetNodeID,
                                       type: edge.type, evidenceChunkID: evidence, createdAt: edge.createdAt))
        }
        for suggestion in try all(MergeSuggestion.self)
        where keptNodes.contains(suggestion.nodeID) && keptNodes.contains(suggestion.candidateID) {
            archive.mergeSuggestions.append(.init(
                id: suggestion.id, nodeID: suggestion.nodeID, candidateID: suggestion.candidateID,
                similarity: suggestion.similarity, status: suggestion.status, createdAt: suggestion.createdAt))
        }
        for record in try all(UsageRecord.self) {
            archive.usage.append(.init(
                id: record.id, provider: record.provider, model: record.model, feature: record.feature,
                inputTokens: record.inputTokens, outputTokens: record.outputTokens, costUSD: record.costUSD,
                costEstimated: record.costEstimated, createdAt: record.createdAt))
        }
        for digest in try all(Digest.self) {
            archive.digests.append(.init(
                id: digest.id, createdAt: digest.createdAt, periodStart: digest.periodStart,
                periodEnd: digest.periodEnd, clustersJSON: digest.clustersJSON, readAt: digest.readAt,
                notified: digest.notified))
        }
        archive.sortTables()
        return archive
    }

    /// Rows in id order, so equal libraries give equal archives.
    mutating func sortTables() {
        projects.sort { Self.order($0.id, $1.id) }
        briefs.sort { Self.order($0.id, $1.id) }
        briefRevisions.sort { Self.order($0.id, $1.id) }
        strategyItems.sort { Self.order($0.id, $1.id) }
        projectLinks.sort { Self.order($0.id, $1.id) }
        interestProfiles.sort { Self.order($0.id, $1.id) }
        readingSignals.sort { Self.order($0.id, $1.id) }
        sources.sort { Self.order($0.id, $1.id) }
        articles.sort { Self.order($0.id, $1.id) }
        conversations.sort { Self.order($0.id, $1.id) }
        messages.sort { Self.order($0.id, $1.id) }
        chunks.sort { Self.order($0.id, $1.id) }
        themeNodes.sort { Self.order($0.id, $1.id) }
        aliases.sort { Self.order($0.id, $1.id) }
        mentions.sort { Self.order($0.id, $1.id) }
        edges.sort { Self.order($0.id, $1.id) }
        mergeSuggestions.sort { Self.order($0.id, $1.id) }
        usage.sort { Self.order($0.id, $1.id) }
        digests.sort { Self.order($0.id, $1.id) }
    }

    static func order(_ a: UUID, _ b: UUID) -> Bool {
        a.uuidString < b.uuidString
    }
}
