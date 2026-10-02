import Foundation
import SwiftData
import BYOKLLMKit
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
        for chunk in chunks {
            for mention in chunk.mentions ?? [] { context.delete(mention) }
            chunk.mentions = []
        }
        // Just these chunks' edges, not the whole graph.
        for id in Set(chunks.map(\.id)) {
            for edge in try context.fetch(FetchDescriptor<ThemeEdge>(predicate: #Predicate { $0.evidenceChunkID == id })) {
                context.delete(edge)
            }
        }
    }

    /// Deletes edges whose evidence chunk is gone: its article, repo doc or
    /// chat was deleted. (Mentions go with their chunk; edges only point at
    /// it by id.) Reads every edge's and chunk's id, so it runs in the
    /// on-power background window, not after every chat turn.
    /// - Returns: how many edges were deleted.
    @discardableResult
    public static func pruneOrphanedEdges(context: ModelContext) throws -> Int {
        var chunkIDs = FetchDescriptor<KnowledgeStore.Chunk>()
        chunkIDs.propertiesToFetch = [\.id]
        let existing = Set(try context.fetch(chunkIDs).map(\.id))
        var edges = FetchDescriptor<ThemeEdge>(predicate: #Predicate { $0.evidenceChunkID != nil })
        edges.propertiesToFetch = [\.evidenceChunkID]
        var deleted = 0
        for edge in try context.fetch(edges) {
            guard let evidence = edge.evidenceChunkID, !existing.contains(evidence) else { continue }
            context.delete(edge)
            deleted += 1
        }
        return deleted
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

/// One article's (or turn's) text, handed to extraction off the main actor.
private struct ExtractionJob: Sendable {
    let id: UUID
    /// In order of preference; the next is tried when one fails.
    let extractors: [any EntityExtracting]
    let texts: [String]
    /// Longest a provider call may take before the next extractor gets a turn.
    let providerTimeout: TimeInterval
}

/// One extractor's try at one article.
private struct ExtractionAttempt: Sendable {
    let tier: ExtractionTier
    let calls: Int
    let seconds: Double
    /// Why it failed, or `nil` when it answered.
    let error: String?
    /// The failure may well not happen next time (rate limit, timeout,
    /// offline, the device model busy): it isn't held against the article.
    var transient = false
}

/// A provider extraction that took longer than `GraphIndexer.providerTimeout`.
public struct ExtractionTimedOut: LocalizedError, Sendable {
    public let seconds: TimeInterval

    public init(seconds: TimeInterval) {
        self.seconds = seconds
    }

    public var errorDescription: String? { "No answer within \(Int(seconds)) seconds." }
}

/// An extractor that can't take work right now (Apple Intelligence busy, or
/// rate-limited while SmartWard is in the background): try again later.
public struct ExtractionBusy: LocalizedError, Sendable {
    public let reason: String

    public init(_ reason: String) {
        self.reason = reason
    }

    public var errorDescription: String? { reason }
}

/// Takes your provider out of graph extraction for a while after it
/// rate-limits, times out or keeps failing, so articles go straight to
/// Apple Intelligence instead of each waiting on it first. Free models have
/// low per-minute and per-day limits, and are often slow or don't answer in
/// the JSON format. The app keeps one across runs.
@MainActor
public final class ProviderPause {
    /// How long a pause lasts.
    nonisolated public static let cooldown: TimeInterval = 10 * 60
    /// Failures in a row (of any kind) that pause it.
    nonisolated public static let failuresInARow = 3

    public private(set) var until: Date?
    /// The failure that paused it.
    public private(set) var reason: String?
    private var failures = 0

    public init() {}

    public func isActive(now: Date) -> Bool {
        guard let until else { return false }
        return now < until
    }

    /// Notes how one provider call went: a temporary failure pauses it right
    /// away, any others after `failuresInARow`; an answer resets the count.
    func note(failed error: String?, transient: Bool, now: Date) {
        guard let error else {
            failures = 0
            return
        }
        failures += 1
        guard transient || failures >= Self.failuresInARow else { return }
        until = now.addingTimeInterval(Self.cooldown)
        reason = error
        failures = 0
    }
}

/// What graph extraction did in a run, for Settings → Indexing details:
/// which tier linked what, how long calls took, and why they failed.
public struct GraphRunStats: Equatable, Sendable {
    public var providerLinked = 0
    public var onDeviceLinked = 0
    public var providerFailures = 0
    public var onDeviceFailures = 0
    public var providerCalls = 0
    public var onDeviceCalls = 0
    public var providerSeconds: Double = 0
    public var onDeviceSeconds: Double = 0
    /// Articles no allowed extractor could take (left for a later run).
    public var unavailable = 0
    /// Your provider was skipped because today's budget is spent.
    public var budgetPaused = false
    /// Your provider was skipped for a while after rate-limiting, timing out
    /// or failing several times in a row (`ProviderPause`).
    public var providerPaused = false
    /// Articles whose extractors all failed for temporary reasons: tried
    /// again next run, not counted against them.
    public var deferred = 0
    /// Chat turns added to the graph, and turns whose extraction failed.
    public var turnsLinked = 0
    public var turnsFailed = 0
    /// The latest distinct failures, newest first.
    public var errors: [String] = []

    public static let maxErrors = 8

    public init() {}

    public var isEmpty: Bool { self == GraphRunStats() }

    /// Average seconds per call, or `nil` with no calls.
    public var providerSecondsPerCall: Double? { providerCalls > 0 ? providerSeconds / Double(providerCalls) : nil }
    public var onDeviceSecondsPerCall: Double? { onDeviceCalls > 0 ? onDeviceSeconds / Double(onDeviceCalls) : nil }

    mutating func noteError(_ text: String) {
        errors.removeAll { $0 == text }
        errors.insert(text, at: 0)
        if errors.count > Self.maxErrors { errors.removeLast(errors.count - Self.maxErrors) }
    }

    /// Adds a later run's numbers to these.
    public mutating func merge(_ later: GraphRunStats) {
        providerLinked += later.providerLinked
        onDeviceLinked += later.onDeviceLinked
        providerFailures += later.providerFailures
        onDeviceFailures += later.onDeviceFailures
        providerCalls += later.providerCalls
        onDeviceCalls += later.onDeviceCalls
        providerSeconds += later.providerSeconds
        onDeviceSeconds += later.onDeviceSeconds
        unavailable += later.unavailable
        deferred += later.deferred
        turnsLinked += later.turnsLinked
        turnsFailed += later.turnsFailed
        budgetPaused = later.budgetPaused || (budgetPaused && later.isEmpty)
        providerPaused = later.providerPaused || (providerPaused && later.isEmpty)
        for error in later.errors.reversed() { noteError(error) }
    }

    fileprivate mutating func record(_ attempt: ExtractionAttempt) {
        switch attempt.tier {
        case .byok:
            providerCalls += attempt.calls
            providerSeconds += attempt.seconds
            if let error = attempt.error {
                providerFailures += 1
                noteError("Provider: " + error)
            }
        case .onDevice:
            onDeviceCalls += attempt.calls
            onDeviceSeconds += attempt.seconds
            if let error = attempt.error {
                onDeviceFailures += 1
                noteError("On device: " + error)
            }
        }
    }
}

/// What extraction of one `ExtractionJob` produced.
private struct ExtractionResult: Sendable {
    let id: UUID
    /// The tier that answered, or `nil` when every extractor failed.
    var tier: ExtractionTier?
    /// Which chunks (by position) each output covers.
    var groups: [[Int]] = []
    var outputs: [ExtractionOutput] = []
    var cancelled = false
    var attempts: [ExtractionAttempt] = []
}

public enum GraphIndexError: Error, Equatable {
    /// Every allowed extractor failed on it this run.
    case extractionFailed
}

/// Decides which extractor may see which content (D2, D5), then extracts
/// and links. Articles move `embedded` → `linked`; conversation turns get
/// chunked, embedded and linked, and are stamped `indexedAt`.
@MainActor
public final class GraphIndexer {
    /// Most on-device calls per article; long articles are represented by their start.
    nonisolated static let maxOnDeviceBatches = 2
    /// After this many runs in which every allowed extractor failed, an article
    /// is left out of the graph: still readable and searchable, just not linked.
    nonisolated public static let maxGraphAttempts = 2
    /// Provider extractions run this many at a time (on-device ones one at a time).
    nonisolated public static let concurrentExtractions = 3
    /// Longest a provider extraction may take before Apple Intelligence gets
    /// the article: free models can sit in a queue for minutes.
    nonisolated public static let defaultProviderTimeout: TimeInterval = 45

    private let context: ModelContext
    private let embedder: EmbeddingModel
    private let tiers: ExtractionTiers
    private let resolver: EntityResolver
    private let now: () -> Date
    private let chunker = RetrievalKit.Chunker(targetSize: 1_200, overlapSentences: 0)

    /// What graph extraction did this run.
    public private(set) var stats = GraphRunStats()
    /// Skips your provider for a while after it rate-limits or keeps failing;
    /// the app passes one that outlives a run.
    public var providerPause = ProviderPause()
    public var providerTimeout = GraphIndexer.defaultProviderTimeout
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
    /// - Everything else goes to your provider first (one call per article,
    ///   faster and better than the on-device model), with Apple Intelligence
    ///   as the fallback when the provider fails or today's budget is spent.
    /// - Parameter providerFirst: graph extraction asks your provider first;
    ///   article summaries (written for every new article) pass `false` and
    ///   stay on-device first.
    public static func tiers(for article: Article, links: [UUID: ProjectLink],
                             providerFirst: Bool = true) -> [ExtractionTier] {
        let chunks = article.chunks ?? []
        if article.localOnly || chunks.contains(where: { !ContextPolicy.mayLeaveDevice($0) }) {
            return [.onDevice]
        }
        if let source = article.source, source.sourceKind == .githubRepo {
            guard let link = links[source.id], link.sendsContentToBYOK else { return [.onDevice] }
            return [.byok, .onDevice]
        }
        return providerFirst ? [.byok, .onDevice] : [.onDevice, .byok]
    }

    /// Conversations go to your provider (D2) unless marked off the record.
    public static func tiers(for conversation: Conversation?) -> [ExtractionTier] {
        guard let conversation, ContextPolicy.mayExtractWithBYOK(conversation) else { return [.onDevice] }
        return [.byok, .onDevice]
    }

    // MARK: Articles

    public enum Outcome: Equatable, Sendable {
        case linked(GraphLinker.Result)
        /// No allowed extractor right now (none set up, or only your provider
        /// and today's budget is spent): it waits for a later run.
        case unavailable
        /// Every allowed extractor failed; counted in `graphAttempts`.
        case failed
        case cancelled
    }

    /// The extractors that may see `article` right now, in order of preference.
    private func extractors(for article: Article, links: [UUID: ProjectLink]) -> [any EntityExtracting] {
        extractors(allowing: Self.tiers(for: article, links: links))
    }

    /// `preference` without your provider while today's budget is spent or
    /// it's paused, as extractors.
    private func extractors(allowing preference: [ExtractionTier]) -> [any EntityExtracting] {
        var allowed = withinBudget(preference)
        if allowed.count < preference.count, tiers.byok != nil { stats.budgetPaused = true }
        if allowed.contains(.byok), tiers.byok != nil, providerPause.isActive(now: now()) {
            allowed.removeAll { $0 == .byok }
            stats.providerPaused = true
        }
        return allowed.compactMap { tiers.extractor(for: $0) }
    }

    /// Records `result`'s attempts in the stats and the provider pause.
    private func note(_ result: ExtractionResult) {
        for attempt in result.attempts {
            stats.record(attempt)
            if attempt.tier == .byok {
                providerPause.note(failed: attempt.error, transient: attempt.transient, now: now())
            }
        }
    }

    /// Whether `article` would go to your provider first (and so can be
    /// extracted alongside others).
    public func prefersProvider(_ article: Article, links: [UUID: ProjectLink]) -> Bool {
        extractors(for: article, links: links).first?.tier == .byok
    }

    /// - Returns: the link result, or `nil` when no allowed extractor is
    ///   available (the article stays `embedded` for a later run).
    /// - Throws: `GraphIndexError.extractionFailed` when every allowed extractor failed.
    public func index(_ article: Article, links: [UUID: ProjectLink]) async throws -> GraphLinker.Result? {
        switch await index([article], links: links)[article.id] {
        case .linked(let result)?: return result
        case .cancelled?: throw CancellationError()
        case .failed?: throw GraphIndexError.extractionFailed
        case .unavailable?, nil: return nil
        }
    }

    /// Extracts `articles` at the same time (each trying its extractors in
    /// order), then links them one by one. An article whose every extractor
    /// failed has `graphAttempts` raised and stays `embedded`, unless a
    /// failure was temporary: then it's simply tried again next run.
    public func index(_ articles: [Article], links: [UUID: ProjectLink]) async -> [UUID: Outcome] {
        var outcomes: [UUID: Outcome] = [:]
        var chunksByID: [UUID: [KnowledgeStore.Chunk]] = [:]
        var jobs: [ExtractionJob] = []
        for article in articles {
            let extractors = extractors(for: article, links: links)
            guard !extractors.isEmpty else {
                outcomes[article.id] = .unavailable
                stats.unavailable += 1
                continue
            }
            let chunks = (article.chunks ?? []).sorted { $0.ordinal < $1.ordinal }
            chunksByID[article.id] = chunks
            jobs.append(ExtractionJob(id: article.id, extractors: extractors, texts: chunks.map(\.text),
                                      providerTimeout: providerTimeout))
        }

        let results = await withTaskGroup(of: ExtractionResult.self) { group in
            for job in jobs { group.addTask { await Self.extract(job) } }
            var all: [UUID: ExtractionResult] = [:]
            for await result in group { all[result.id] = result }
            return all
        }

        for article in articles {
            guard let result = results[article.id], let chunks = chunksByID[article.id] else { continue }
            note(result)
            if result.cancelled {
                outcomes[article.id] = .cancelled
                continue
            }
            guard result.tier != nil else {
                if result.attempts.contains(where: \.transient) {
                    stats.deferred += 1
                    outcomes[article.id] = .unavailable
                } else {
                    article.graphAttempts += 1
                    outcomes[article.id] = .failed
                }
                continue
            }
            do {
                try GraphLinker.unlink(chunks, context: context)
            } catch {
                outcomes[article.id] = .failed
                continue
            }
            let total = await link(result, chunks: chunks)
            article.stage = .linked
            outcomes[article.id] = .linked(total)
            if result.tier == .byok { stats.providerLinked += 1 } else { stats.onDeviceLinked += 1 }
        }
        return outcomes
    }

    /// Links what `result` extracted, each output to the chunks it covers.
    private func link(_ result: ExtractionResult, chunks: [KnowledgeStore.Chunk]) async -> GraphLinker.Result {
        var total = GraphLinker.Result()
        for (group, output) in zip(result.groups, result.outputs) {
            recordUsage(output, tier: result.tier, feature: "extraction")
            let batch = group.compactMap { chunks.indices.contains($0) ? chunks[$0] : nil }
            let linked = await GraphLinker.link(output.graph, chunks: batch, resolver: resolver, now: now())
            total.mentions += linked.mentions
            total.edges += linked.edges
            total.nodesCreated += linked.nodesCreated
        }
        return total
    }

    /// Tries `job`'s extractors in order until one answers for all of its text.
    nonisolated private static func extract(_ job: ExtractionJob) async -> ExtractionResult {
        var attempts: [ExtractionAttempt] = []
        for extractor in job.extractors {
            if Task.isCancelled { return ExtractionResult(id: job.id, cancelled: true, attempts: attempts) }
            let limit = extractor.tier == .onDevice ? maxOnDeviceBatches : 1
            let groups = Array(batches(lengths: job.texts.map(\.count), maxCharacters: extractor.maxInputCharacters)
                .prefix(limit))
            let started = Date()
            var calls = 0
            do {
                var outputs: [ExtractionOutput] = []
                for group in groups {
                    let text = group.map { job.texts[$0] }.joined(separator: "\n\n")
                    calls += 1
                    if extractor.tier == .byok {
                        outputs.append(try await withTimeout(job.providerTimeout) { try await extractor.extract(text) })
                    } else {
                        outputs.append(try await extractor.extract(text))
                    }
                }
                attempts.append(ExtractionAttempt(tier: extractor.tier, calls: calls,
                                                  seconds: Date().timeIntervalSince(started), error: nil))
                return ExtractionResult(id: job.id, tier: extractor.tier, groups: groups, outputs: outputs,
                                        attempts: attempts)
            } catch is CancellationError {
                return ExtractionResult(id: job.id, cancelled: true, attempts: attempts)
            } catch {
                // A stopped run cancels its network calls, which fail as `URLError.cancelled`.
                if Task.isCancelled { return ExtractionResult(id: job.id, cancelled: true, attempts: attempts) }
                attempts.append(ExtractionAttempt(tier: extractor.tier, calls: calls,
                                                  seconds: Date().timeIntervalSince(started), error: describe(error),
                                                  transient: isTransient(error)))
                continue
            }
        }
        return ExtractionResult(id: job.id, attempts: attempts)
    }

    /// `work`'s result, or `ExtractionTimedOut` after `seconds`.
    nonisolated static func withTimeout<T: Sendable>(_ seconds: TimeInterval,
                                                     _ work: @escaping @Sendable () async throws -> T) async throws -> T {
        try await withThrowingTaskGroup(of: T.self) { group in
            group.addTask { try await work() }
            group.addTask {
                try await Task.sleep(nanoseconds: UInt64(seconds * 1_000_000_000))
                throw ExtractionTimedOut(seconds: seconds)
            }
            defer { group.cancelAll() }
            guard let first = try await group.next() else { throw CancellationError() }
            return first
        }
    }

    /// Whether `error` may well not happen on a later try: rate limits,
    /// server trouble, timeouts, no connection, a busy device model.
    nonisolated static func isTransient(_ error: Error) -> Bool {
        switch error {
        case is ExtractionTimedOut, is ExtractionBusy:
            return true
        case let error as LLMCompletionError:
            return error.isRetryable
        case let error as URLError:
            let codes: Set<URLError.Code> = [.timedOut, .notConnectedToInternet, .networkConnectionLost,
                                             .cannotFindHost, .cannotConnectToHost, .dnsLookupFailed,
                                             .internationalRoamingOff, .dataNotAllowed, .callIsActive]
            return codes.contains(error.code)
        default:
            return false
        }
    }

    /// A failure in a line: the provider's own message where there is one.
    nonisolated static func describe(_ error: Error) -> String {
        let text = (error as? LocalizedError)?.errorDescription ?? String(describing: error)
        let flat = text.split(whereSeparator: \.isNewline).joined(separator: " ")
        return flat.count > 240 ? String(flat.prefix(240)) + "…" : flat
    }

    private func recordUsage(_ output: ExtractionOutput, tier: ExtractionTier?, feature: String) {
        guard let tokens = output.usage else { return }
        let record = UsageLedger.record(provider: output.provider ?? tier?.rawValue ?? "", model: output.model ?? "",
                                        feature: feature, inputTokens: tokens.inputTokens,
                                        outputTokens: tokens.outputTokens, reportedCostUSD: tokens.costUSD,
                                        context: context, now: now())
        usageRecords.append(record)
    }

    // MARK: Conversation turns

    /// Chunks, embeds and links one turn, trying its extractors in order
    /// like an article's.
    /// - Returns: `nil` when no allowed extractor is available.
    /// - Throws: `GraphIndexError.extractionFailed` when every extractor
    ///   failed; unless a failure was temporary, that counts in `graphAttempts`.
    public func index(_ message: Message) async throws -> GraphLinker.Result? {
        let extractors = extractors(allowing: Self.tiers(for: message.conversation))
        guard !extractors.isEmpty else { return nil }
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
        let job = ExtractionJob(id: message.id, extractors: extractors, texts: chunks.map(\.text),
                                providerTimeout: providerTimeout)
        let result = await Self.extract(job)
        note(result)
        if result.cancelled { throw CancellationError() }
        guard result.tier != nil else {
            stats.turnsFailed += 1
            if !result.attempts.contains(where: \.transient) { message.graphAttempts += 1 }
            throw GraphIndexError.extractionFailed
        }
        let linked = await link(result, chunks: chunks)
        message.indexedAt = now()
        stats.turnsLinked += 1
        return linked
    }

    // MARK: Shared

    /// `preference` without your provider once today's budget is spent.
    func withinBudget(_ preference: [ExtractionTier]) -> [ExtractionTier] {
        guard let budget, budget.isExhausted(context: context, now: now()) else { return preference }
        return preference.filter { $0 != .byok }
    }

    /// Positions of consecutive texts of these `lengths`, grouped up to `maxCharacters`.
    nonisolated static func batches(lengths: [Int], maxCharacters: Int) -> [[Int]] {
        var result: [[Int]] = []
        var current: [Int] = []
        var length = 0
        for (index, size) in lengths.enumerated() {
            if !current.isEmpty, length + size > maxCharacters {
                result.append(current)
                current = []
                length = 0
            }
            current.append(index)
            length += size
        }
        if !current.isEmpty { result.append(current) }
        return result
    }
}
