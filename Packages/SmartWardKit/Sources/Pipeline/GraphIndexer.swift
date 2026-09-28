import Foundation
import SwiftData
import RetrievalKit
import KnowledgeStore

/// Writes an extraction into the graph (PLAN §3.3 A7–A8): one `Mention` per
/// (node, chunk) and one `ThemeEdge` per stated relation, with the chunk as
/// evidence. Mentions and edges are append-only; re-linking a chunk first
/// removes what it contributed, so it's idempotent.
@MainActor
public enum GraphLinker {
    public struct Result: Equatable, Sendable {
        public var mentions = 0
        public var edges = 0
        public var nodesCreated = 0

        public init(mentions: Int = 0, edges: Int = 0, nodesCreated: Int = 0) {
            self.mentions = mentions
            self.edges = edges
            self.nodesCreated = nodesCreated
        }
    }

    /// Removes the mentions of `chunks` and the edges they are evidence for.
    public static func unlink(_ chunks: [KnowledgeStore.Chunk], context: ModelContext) throws {
        // Edges only ever come with mentions, so chunks without mentions
        // were never linked and there is nothing to look up.
        guard chunks.contains(where: { !($0.mentions ?? []).isEmpty }) else { return }
        let ids = Set(chunks.map(\.id))
        for chunk in chunks {
            for mention in chunk.mentions ?? [] { context.delete(mention) }
            chunk.mentions = []
        }
        for edge in try context.fetch(FetchDescriptor<ThemeEdge>()) {
            if let evidence = edge.evidenceChunkID, ids.contains(evidence) { context.delete(edge) }
        }
    }

    /// Links `graph`, extracted from the text of `chunks`, attributing each
    /// entity to the chunks that mention it by name (else the first chunk).
    public static func link(_ graph: ExtractedGraph, chunks: [KnowledgeStore.Chunk], resolver: EntityResolver,
                            now: Date = Date()) async -> Result {
        var result = Result()
        guard let first = chunks.first else { return result }
        var nodes: [String: ThemeNode] = [:]

        for entity in graph.entities {
            let resolution = await resolver.resolve(name: entity.name, type: entity.type)
            if resolution.created { result.nodesCreated += 1 }
            resolver.addAlias(entity.name, to: resolution.node)
            nodes[entity.name.lowercased()] = resolution.node

            var targets = chunks.filter { $0.text.localizedCaseInsensitiveContains(entity.name) }
            if targets.isEmpty { targets = [first] }
            for chunk in targets where !(chunk.mentions ?? []).contains(where: { $0.node?.id == resolution.node.id }) {
                let mention = Mention(confidence: 1, createdAt: now)
                mention.node = resolution.node
                chunk.mentions?.append(mention)
                result.mentions += 1
            }
        }

        var seen = Set<String>()
        for relation in graph.relations {
            guard let source = nodes[relation.source.lowercased()],
                  let target = nodes[relation.target.lowercased()],
                  source.id != target.id,
                  seen.insert("\(source.id)|\(target.id)|\(relation.type)").inserted else { continue }
            let evidence = chunks.first {
                $0.text.localizedCaseInsensitiveContains(relation.source)
                    && $0.text.localizedCaseInsensitiveContains(relation.target)
            } ?? chunks.first { $0.text.localizedCaseInsensitiveContains(relation.source) } ?? first
            let edge = ThemeEdge(sourceNodeID: source.id, targetNodeID: target.id, type: relation.type,
                                 evidenceChunkID: evidence.id)
            edge.createdAt = now
            resolver.context.insert(edge)
            result.edges += 1
        }
        return result
    }
}

/// Decides which extractor may see which content (D2, D5), then extracts
/// and links. Articles move `embedded` → `linked`; conversation turns get
/// chunked, embedded and linked, and are stamped `indexedAt`.
@MainActor
public final class GraphIndexer {
    /// Most on-device calls per article; long articles are represented by their start.
    static let maxOnDeviceBatches = 4

    private let context: ModelContext
    private let embedder: EmbeddingModel
    private let tiers: ExtractionTiers
    private let resolver: EntityResolver
    private let now: () -> Date
    private let chunker = RetrievalKit.Chunker(targetSize: 1_200, overlapSentences: 0)

    /// Usage rows written this run (T2 calls), for reporting.
    public private(set) var usageRecords: [UsageRecord] = []
    /// When today's budget is used up, nothing goes to your provider: work
    /// that may fall back does so on-device, and the rest waits (NFR-9).
    public var budget: DailyBudget?

    public init(context: ModelContext, embedder: EmbeddingModel, tiers: ExtractionTiers,
                now: @escaping () -> Date = { Date() }) throws {
        self.context = context
        self.embedder = embedder
        self.tiers = tiers
        self.resolver = try EntityResolver(context: context, embedder: embedder)
        self.now = now
    }

    public var suggestionsAdded: Int { resolver.suggestionsAdded }

    // MARK: Routing

    /// Tiers allowed for an article, in order of preference.
    /// - Local-only content (private repos) never leaves the device (D5).
    /// - Public linked-repo docs go to your provider unless you turned
    ///   extraction off for that repo (D2), falling back to on-device.
    /// - Everything else is extracted on-device, with your provider as the
    ///   fallback when Apple Intelligence is off (PLAN §5.4).
    public static func tiers(for article: Article, links: [UUID: ProjectLink]) -> [ExtractionTier] {
        let chunks = article.chunks ?? []
        if article.localOnly || chunks.contains(where: { !ContextPolicy.mayLeaveDevice($0) }) {
            return [.onDevice]
        }
        if let source = article.source, source.sourceKind == .githubRepo {
            guard let link = links[source.id], link.sendsContentToBYOK else { return [.onDevice] }
            return [.byok, .onDevice]
        }
        return [.onDevice, .byok]
    }

    /// Conversations go to your provider (D2) unless marked off the record.
    public static func tiers(for conversation: Conversation?) -> [ExtractionTier] {
        guard let conversation, ContextPolicy.mayExtractWithBYOK(conversation) else { return [.onDevice] }
        return [.byok, .onDevice]
    }

    // MARK: Articles

    /// - Returns: the link result, or `nil` when no allowed extractor is
    ///   available (the article stays `embedded` for a later run).
    public func index(_ article: Article, links: [UUID: ProjectLink]) async throws -> GraphLinker.Result? {
        guard let extractor = tiers.first(in: withinBudget(Self.tiers(for: article, links: links))) else { return nil }
        let chunks = (article.chunks ?? []).sorted { $0.ordinal < $1.ordinal }
        try GraphLinker.unlink(chunks, context: context)
        let result = try await extractAndLink(chunks, with: extractor, feature: "extraction")
        article.stage = .linked
        return result
    }

    // MARK: Conversation turns

    /// Chunks, embeds and links one turn.
    /// - Returns: `nil` when no allowed extractor is available.
    public func index(_ message: Message) async throws -> GraphLinker.Result? {
        guard let extractor = tiers.first(in: withinBudget(Self.tiers(for: message.conversation))) else { return nil }
        for old in message.chunks ?? [] { context.delete(old) }
        message.chunks = []

        let pieces = chunker.chunk(RetrievalKit.Document(id: message.id.uuidString, text: message.content))
        let vectors = await embedder.provider.embed(batch: pieces.map(\.text))
        // Off-the-record turns stay local-only down to the chunk (D5).
        let localOnly = message.conversation?.offTheRecord ?? false
        var chunks: [KnowledgeStore.Chunk] = []
        for (ordinal, piece) in pieces.enumerated() {
            let chunk = KnowledgeStore.Chunk(text: piece.text, ordinal: ordinal, localOnly: localOnly)
            if ordinal < vectors.count, let vector = vectors[ordinal] {
                chunk.vector = VectorCoding.data(from: vector)
                chunk.embeddingModel = embedder.id
            }
            message.chunks?.append(chunk)
            chunks.append(chunk)
        }
        let result = try await extractAndLink(chunks, with: extractor, feature: "extraction")
        message.indexedAt = now()
        return result
    }

    // MARK: Shared

    /// `preference` without your provider once today's budget is spent.
    func withinBudget(_ preference: [ExtractionTier]) -> [ExtractionTier] {
        guard let budget, budget.isExhausted(context: context, now: now()) else { return preference }
        return preference.filter { $0 != .byok }
    }

    private func extractAndLink(_ chunks: [KnowledgeStore.Chunk], with extractor: any EntityExtracting,
                                feature: String) async throws -> GraphLinker.Result {
        var total = GraphLinker.Result()
        let maxBatches = extractor.tier == .onDevice ? Self.maxOnDeviceBatches : 1
        for batch in Self.batches(chunks, maxCharacters: extractor.maxInputCharacters).prefix(maxBatches) {
            let text = batch.map(\.text).joined(separator: "\n\n")
            let output = try await extractor.extract(text)
            if let tokens = output.usage {
                let record = UsageLedger.record(provider: output.provider ?? extractor.tier.rawValue,
                                                model: output.model ?? "", feature: feature,
                                                inputTokens: tokens.inputTokens, outputTokens: tokens.outputTokens,
                                                reportedCostUSD: tokens.costUSD, context: context, now: now())
                usageRecords.append(record)
            }
            let linked = await GraphLinker.link(output.graph, chunks: batch, resolver: resolver, now: now())
            total.mentions += linked.mentions
            total.edges += linked.edges
            total.nodesCreated += linked.nodesCreated
        }
        return total
    }

    /// Consecutive chunks grouped up to `maxCharacters` of text.
    static func batches(_ chunks: [KnowledgeStore.Chunk], maxCharacters: Int) -> [[KnowledgeStore.Chunk]] {
        var result: [[KnowledgeStore.Chunk]] = []
        var current: [KnowledgeStore.Chunk] = []
        var length = 0
        for chunk in chunks {
            if !current.isEmpty, length + chunk.text.count > maxCharacters {
                result.append(current)
                current = []
                length = 0
            }
            current.append(chunk)
            length += chunk.text.count
        }
        if !current.isEmpty { result.append(current) }
        return result
    }
}
