import Foundation
import SwiftData

public extension LibraryArchive {

    enum RestoreError: LocalizedError, Equatable {
        case libraryNotEmpty

        public var errorDescription: String? {
            switch self {
            case .libraryNotEmpty: return "Restoring needs an empty library. Erase this one first."
            }
        }
    }

    /// Recreates every row with its original id and fields, and rebuilds the
    /// relationships from ids. The library must be empty (see `erase`);
    /// references to rows the archive doesn't hold are left unset.
    @MainActor
    func restore(into context: ModelContext) throws {
        guard try Self.isEmpty(context) else { throw RestoreError.libraryNotEmpty }
        insertRows(into: context)
    }

    /// Erases the library and restores this archive in a single save. If
    /// anything fails, nothing is saved and the current library is left as
    /// it was, rather than erased with nothing restored.
    @MainActor
    func replaceLibrary(in context: ModelContext) throws {
        do {
            for type in KnowledgeSchema.models {
                try Self.deleteAll(type, in: context)
            }
            insertRows(into: context)
            try context.save()
        } catch {
            context.rollback()
            throw error
        }
    }

    @MainActor
    private func insertRows(into context: ModelContext) {
        var nodes: [UUID: ThemeNode] = [:]
        for record in themeNodes {
            let node = ThemeNode(type: record.type, canonicalLabel: record.canonicalLabel)
            node.id = record.id
            node.normalizedKey = record.normalizedKey
            node.summary = record.summary
            node.createdAt = record.createdAt
            node.labelVector = record.labelVector
            node.labelVectorModel = record.labelVectorModel
            context.insert(node)
            nodes[record.id] = node
        }
        for record in aliases {
            let alias = EntityAlias(alias: record.alias, origin: record.origin)
            alias.id = record.id
            context.insert(alias)
            alias.node = record.nodeID.flatMap { nodes[$0] }
        }

        var sourcesByID: [UUID: Source] = [:]
        for record in sources {
            let source = Source(kind: record.kind, url: record.url, title: record.title, origin: record.origin)
            source.id = record.id
            source.etag = record.etag
            source.lastModified = record.lastModified
            source.lastFetchedAt = record.lastFetchedAt
            source.lastError = record.lastError
            source.isEnabled = record.isEnabled
            context.insert(source)
            sourcesByID[record.id] = source
        }
        var articlesByID: [UUID: Article] = [:]
        for record in articles {
            let article = Article(canonicalURL: record.canonicalURL, title: record.title,
                                  cleanedText: record.cleanedText, localOnly: record.localOnly)
            article.id = record.id
            article.byline = record.byline
            article.summary = record.summary
            article.contentHash = record.contentHash
            article.publishedAt = record.publishedAt
            article.ingestedAt = record.ingestedAt
            article.stageRaw = record.stage
            article.relevance = record.relevance
            article.relevanceReason = record.relevanceReason
            article.isRead = record.isRead
            article.isStarred = record.isStarred
            article.projectID = record.projectID
            context.insert(article)
            article.source = record.sourceID.flatMap { sourcesByID[$0] }
            articlesByID[record.id] = article
        }

        var projectsByID: [UUID: Project] = [:]
        for record in projects {
            let project = Project(name: record.name, goal: record.goal, constraints: record.constraints)
            project.id = record.id
            project.isActive = record.isActive
            project.createdAt = record.createdAt
            context.insert(project)
            project.pinnedNodes = record.pinnedNodeIDs.compactMap { nodes[$0] }
            projectsByID[record.id] = project
        }

        var conversationsByID: [UUID: Conversation] = [:]
        for record in conversations {
            let conversation = Conversation(title: record.title)
            conversation.id = record.id
            conversation.modeRaw = record.mode
            conversation.offTheRecord = record.offTheRecord
            conversation.provider = record.provider
            conversation.model = record.model
            conversation.rollingSummary = record.rollingSummary
            conversation.createdAt = record.createdAt
            conversation.updatedAt = record.updatedAt
            context.insert(conversation)
            conversation.project = record.projectID.flatMap { projectsByID[$0] }
            conversationsByID[record.id] = conversation
        }
        var messagesByID: [UUID: Message] = [:]
        for record in messages {
            let message = Message(role: record.role, content: record.content)
            message.id = record.id
            message.toolCallsJSON = record.toolCallsJSON
            message.createdAt = record.createdAt
            message.indexedAt = record.indexedAt
            message.referencesJSON = record.referencesJSON
            context.insert(message)
            message.conversation = record.conversationID.flatMap { conversationsByID[$0] }
            messagesByID[record.id] = message
        }

        var chunksByID: [UUID: Chunk] = [:]
        for record in chunks {
            let chunk = Chunk(text: record.text, ordinal: record.ordinal, localOnly: record.localOnly)
            chunk.id = record.id
            chunk.embeddingModel = record.embeddingModel
            chunk.vector = record.vector
            context.insert(chunk)
            chunk.article = record.articleID.flatMap { articlesByID[$0] }
            chunk.message = record.messageID.flatMap { messagesByID[$0] }
            chunksByID[record.id] = chunk
        }
        for record in mentions {
            let mention = Mention(confidence: record.confidence, createdAt: record.createdAt)
            mention.id = record.id
            context.insert(mention)
            mention.node = record.nodeID.flatMap { nodes[$0] }
            mention.chunk = record.chunkID.flatMap { chunksByID[$0] }
        }
        for record in edges {
            let edge = ThemeEdge(sourceNodeID: record.sourceNodeID, targetNodeID: record.targetNodeID,
                                 type: record.type, evidenceChunkID: record.evidenceChunkID)
            edge.id = record.id
            edge.createdAt = record.createdAt
            context.insert(edge)
        }
        for record in mergeSuggestions {
            let suggestion = MergeSuggestion(nodeID: record.nodeID, candidateID: record.candidateID,
                                             similarity: record.similarity)
            suggestion.id = record.id
            suggestion.status = record.status
            suggestion.createdAt = record.createdAt
            context.insert(suggestion)
        }

        var briefsByID: [UUID: ProjectBrief] = [:]
        for record in briefs {
            let brief = ProjectBrief(markdown: record.markdown)
            brief.id = record.id
            brief.sourceWatermark = record.sourceWatermark
            brief.updatedAt = record.updatedAt
            context.insert(brief)
            brief.project = record.projectID.flatMap { projectsByID[$0] }
            briefsByID[record.id] = brief
        }
        for record in briefRevisions {
            let revision = BriefRevision(baseMarkdown: record.baseMarkdown, proposedMarkdown: record.proposedMarkdown,
                                         rationale: record.rationale, origin: record.origin,
                                         coversUntil: record.coversUntil)
            revision.id = record.id
            revision.statusRaw = record.status
            revision.createdAt = record.createdAt
            revision.resolvedAt = record.resolvedAt
            context.insert(revision)
            revision.brief = record.briefID.flatMap { briefsByID[$0] }
        }
        for record in strategyItems {
            let item = StrategyItem(kind: .decision, text: record.text, sourceMessageID: record.sourceMessageID)
            item.id = record.id
            item.kindRaw = record.kind
            item.statusRaw = record.status
            item.createdAt = record.createdAt
            context.insert(item)
            item.project = record.projectID.flatMap { projectsByID[$0] }
        }
        for record in projectLinks {
            let link = ProjectLink(kind: .url, url: record.url, repoFullName: record.repoFullName,
                                   isPrivate: record.isPrivate)
            link.id = record.id
            link.kindRaw = record.kind
            link.includeInExtraction = record.includeInExtraction
            link.sourceID = record.sourceID
            link.defaultBranchSHA = record.defaultBranchSHA
            link.etag = record.etag
            link.lastSyncedAt = record.lastSyncedAt
            link.addedDuring = record.addedDuring
            context.insert(link)
            link.project = record.projectID.flatMap { projectsByID[$0] }
        }

        for record in interestProfiles {
            let profile = InterestProfile(statement: record.statement)
            profile.id = record.id
            profile.explicitTopics = record.explicitTopics
            profile.mutedTopics = record.mutedTopics
            profile.updatedAt = record.updatedAt
            context.insert(profile)
        }
        for record in readingSignals {
            let signal = ReadingSignal(articleID: record.articleID, kind: record.kind)
            signal.id = record.id
            signal.createdAt = record.createdAt
            context.insert(signal)
        }
        for record in usage {
            let row = UsageRecord(provider: record.provider, model: record.model, feature: record.feature,
                                  inputTokens: record.inputTokens, outputTokens: record.outputTokens,
                                  costUSD: record.costUSD)
            row.id = record.id
            row.costEstimated = record.costEstimated
            row.createdAt = record.createdAt
            context.insert(row)
        }
        for record in digests {
            let digest = Digest(periodStart: record.periodStart, periodEnd: record.periodEnd, clusters: [])
            digest.id = record.id
            digest.createdAt = record.createdAt
            digest.clustersJSON = record.clustersJSON
            digest.readAt = record.readAt
            digest.notified = record.notified
            context.insert(digest)
        }
    }

    /// Deletes every row of every model.
    @MainActor
    static func erase(_ context: ModelContext) throws {
        for type in KnowledgeSchema.models {
            try deleteAll(type, in: context)
        }
        try context.save()
    }

    @MainActor
    static func isEmpty(_ context: ModelContext) throws -> Bool {
        for type in KnowledgeSchema.models {
            if try count(type, in: context) > 0 { return false }
        }
        return true
    }

    @MainActor
    private static func deleteAll<T: PersistentModel>(_ type: T.Type, in context: ModelContext) throws {
        for row in try context.fetch(FetchDescriptor<T>()) {
            context.delete(row)
        }
    }

    @MainActor
    private static func count<T: PersistentModel>(_ type: T.Type, in context: ModelContext) throws -> Int {
        try context.fetchCount(FetchDescriptor<T>())
    }
}
