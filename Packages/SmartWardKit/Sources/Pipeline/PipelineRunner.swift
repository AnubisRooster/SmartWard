import Foundation
import SwiftData
import RetrievalKit
import IngestKit
import KnowledgeStore

/// Fetches a page's readable text. `SourceFetcher` is the real one.
public protocol FullTextFetching: Sendable {
    func fetchArticle(_ url: URL) async throws -> ExtractedArticle
}

extension SourceFetcher: FullTextFetching {}

/// Splits an article into sentence-aligned chunks and embeds them on-device
/// (FR-5). Re-indexing replaces the article's chunks, so it's idempotent.
@MainActor
public struct ArticleIndexer {
    /// Long documents are indexed up to this many characters.
    public static let maxCharacters = 60_000

    let embedder: EmbeddingModel
    let chunker = RetrievalKit.Chunker(targetSize: 1_200, overlapSentences: 1)

    public init(embedder: EmbeddingModel) {
        self.embedder = embedder
    }

    /// - Returns: the number of chunks written.
    @discardableResult
    public func index(_ article: Article, context: ModelContext) async -> Int {
        for old in article.chunks ?? [] {
            context.delete(old)
        }
        article.chunks = []
        // New or changed text: the summary is written again after indexing.
        article.summaryJSON = nil

        let body = article.cleanedText.isEmpty ? article.summary : article.cleanedText
        let text = String("\(article.title)\n\n\(body)".prefix(Self.maxCharacters))
        let pieces = chunker.chunk(RetrievalKit.Document(id: article.id.uuidString, text: text))
        let vectors = await embedder.provider.embed(batch: pieces.map(\.text))

        for (ordinal, piece) in pieces.enumerated() {
            // Private-repo content stays local-only down to the chunk (D5).
            let chunk = KnowledgeStore.Chunk(text: piece.text, ordinal: ordinal, localOnly: article.localOnly)
            if ordinal < vectors.count, let vector = vectors[ordinal] {
                chunk.vector = VectorCoding.data(from: vector)
                chunk.embeddingModel = embedder.id
            }
            article.chunks?.append(chunk)
        }
        article.stage = .embedded
        return pieces.count
    }
}

/// The resumable ingestion stage machine (PLAN §5.1, NFR-10):
///
///     fetched ─ triage ─┬─ off-topic ─────────────► triagedOut
///                       └─ full text ─► triaged ─► chunk + embed ─► embedded
///     cleaned ─ triage ─┴─ (already has its text)
///
/// Every step saves before the next, so a killed run resumes where it
/// stopped without redoing or duplicating work. Linked-repo docs skip triage:
/// they are project context by definition.
///
/// With extractors configured it continues `embedded` → extract → `linked`
/// (PLAN §3.3 A6–A8), and indexes new conversation turns first, since they
/// are what you're working on right now.
@MainActor
public final class PipelineRunner {
    public struct Report: Equatable, Sendable {
        public var triaged = 0
        public var triagedOut = 0
        public var fullTextFetched = 0
        public var embedded = 0
        public var linked = 0
        public var turnsIndexed = 0
        /// Article summaries written this run.
        public var summarized = 0
        /// Articles still waiting in a stage this run didn't reach.
        public var remaining = 0
        /// What graph extraction did, for Settings → Indexing details.
        public var graph = GraphRunStats()

        public init(triaged: Int = 0, triagedOut: Int = 0, fullTextFetched: Int = 0,
                    embedded: Int = 0, linked: Int = 0, turnsIndexed: Int = 0, summarized: Int = 0,
                    remaining: Int = 0) {
            self.triaged = triaged
            self.triagedOut = triagedOut
            self.fullTextFetched = fullTextFetched
            self.embedded = embedded
            self.linked = linked
            self.turnsIndexed = turnsIndexed
            self.summarized = summarized
            self.remaining = remaining
        }
    }

    static let batchSize = 10
    /// Borderline scores within this distance of the threshold go to the
    /// on-device judge when there is one.
    static let borderline = 0.08

    private let embedder: EmbeddingModel
    private let fullText: (any FullTextFetching)?
    private let judge: (any RelevanceJudging)?
    private let threshold: Double
    private let extraction: ExtractionTiers?
    private let budget: DailyBudget?
    /// Writes each newly indexed article's summary, so it's ready when opened.
    private let summarizer: ArticleSummarizer?
    private let now: () -> Date

    /// A turn is indexed once it's this old, so a reply still being saved isn't cut short.
    public static let turnSettleTime: TimeInterval = 5

    public init(embedder: EmbeddingModel, fullText: (any FullTextFetching)?,
                judge: (any RelevanceJudging)? = nil, strength: Triage.Strength = .balanced,
                extraction: ExtractionTiers? = nil, budget: DailyBudget? = nil,
                summarizer: ArticleSummarizer? = nil, now: @escaping () -> Date = { Date() }) {
        self.embedder = embedder
        self.fullText = fullText
        self.judge = judge
        self.threshold = strength.threshold
        self.extraction = extraction
        self.budget = budget
        self.summarizer = summarizer
        self.now = now
    }

    /// The stages a run works through: embedding is the last one unless
    /// extraction is configured, which continues to `linked`.
    static func stages(includesLinking: Bool) -> [ArticleStage] {
        includesLinking ? [.fetched, .cleaned, .triaged, .embedded] : [.fetched, .cleaned, .triaged]
    }

    private var stages: [ArticleStage] { Self.stages(includesLinking: extraction != nil) }

    /// Articles in `stage` a run still works on. An `embedded` article whose
    /// graph extraction kept failing is left alone.
    static func pending(_ stage: ArticleStage) -> Predicate<Article> {
        let raw = stage.rawValue
        guard stage == .embedded else { return #Predicate { $0.stageRaw == raw } }
        let limit = GraphIndexer.maxGraphAttempts
        return #Predicate { $0.stageRaw == raw && $0.graphAttempts < limit }
    }

    /// How many articles are still in a stage a run works through: what
    /// `Report.remaining` says after a run, without running anything.
    public static func waitingCount(context: ModelContext, includesLinking: Bool) throws -> Int {
        try stages(includesLinking: includesLinking).reduce(0) { total, stage in
            total + (try context.fetchCount(FetchDescriptor<Article>(predicate: pending(stage))))
        }
    }

    /// What's waiting, split the way it matters to you.
    public struct Backlog: Equatable, Sendable {
        /// Not yet readable in search (still to be triaged, fetched or embedded).
        public var notSearchable = 0
        /// Searchable, waiting to be added to the knowledge graph.
        public var graphPending = 0
        /// Searchable, but left out of the graph after extraction kept failing.
        public var graphSkipped = 0

        public init(notSearchable: Int = 0, graphPending: Int = 0, graphSkipped: Int = 0) {
            self.notSearchable = notSearchable
            self.graphPending = graphPending
            self.graphSkipped = graphSkipped
        }

        public var total: Int { notSearchable + graphPending }
    }

    public static func backlog(context: ModelContext, includesLinking: Bool) throws -> Backlog {
        var backlog = Backlog()
        for stage in [ArticleStage.fetched, .cleaned, .triaged] {
            backlog.notSearchable += try context.fetchCount(FetchDescriptor<Article>(predicate: pending(stage)))
        }
        guard includesLinking else { return backlog }
        backlog.graphPending = try context.fetchCount(FetchDescriptor<Article>(predicate: pending(.embedded)))
        let raw = ArticleStage.embedded.rawValue
        let limit = GraphIndexer.maxGraphAttempts
        backlog.graphSkipped = try context.fetchCount(FetchDescriptor<Article>(predicate: #Predicate {
            $0.stageRaw == raw && $0.graphAttempts >= limit
        }))
        return backlog
    }

    /// Steps (one per article moved on, or turn indexed) an article at
    /// `stage` still needs: triage, embedding, and linking when extraction is on.
    static func steps(from stage: ArticleStage, includesLinking: Bool) -> Int {
        switch stage {
        case .fetched, .cleaned: return includesLinking ? 3 : 2
        case .triaged: return includesLinking ? 2 : 1
        case .embedded: return includesLinking ? 1 : 0
        default: return 0
        }
    }

    /// Works through the backlog until it's empty, `deadline` passes, or the
    /// task is cancelled.
    /// - Parameter progress: called once when the run starts with work to do
    ///   (0 done), then after each step is saved, with the steps done and the
    ///   total when the run started. Articles that turn out to be off-topic
    ///   take fewer steps, so the last call can fall short of the total.
    public func run(context: ModelContext, until deadline: Date,
                    progress: ((_ completed: Int, _ total: Int) -> Void)? = nil) async throws -> Report {
        var report = Report()
        let model = try await InterestModel.build(context: context, embedder: embedder)
        let indexer = ArticleIndexer(embedder: embedder)
        // Articles left in place this run (e.g. their host is backing off),
        // so they aren't picked again until the next run.
        var skipped = Set<UUID>()
        var graph: GraphIndexer?
        var links: [UUID: ProjectLink] = [:]
        if let extraction {
            graph = try GraphIndexer(context: context, embedder: embedder, tiers: extraction, now: now)
            graph?.budget = budget
        }
        if extraction != nil || summarizer != nil {
            for link in try context.fetch(FetchDescriptor<ProjectLink>()) {
                if let sourceID = link.sourceID { links[sourceID] = link }
            }
        }
        // Summaries the run couldn't write (no allowed summarizer, too little
        // text, a model error), so they aren't tried again until the next run.
        var skippedSummaries = Set<UUID>()

        var total = 0
        var completed = 0
        if progress != nil {
            let linking = extraction != nil
            for stage in stages {
                let count = try context.fetchCount(FetchDescriptor<Article>(predicate: Self.pending(stage)))
                total += count * Self.steps(from: stage, includesLinking: linking)
                // Articles not yet indexed get a summary once they are.
                if summarizer != nil, stage != .embedded { total += count }
            }
            if summarizer != nil {
                let cutoff = now().addingTimeInterval(-Self.summaryLookback)
                total += try context.fetchCount(FetchDescriptor<Article>(predicate: Self.needsSummary(since: cutoff)))
            }
            if graph != nil {
                let settled = now().addingTimeInterval(-Self.turnSettleTime)
                total += try context.fetchCount(FetchDescriptor<Message>(predicate: #Predicate { message in
                    message.indexedAt == nil && message.createdAt < settled
                        && (message.role == "user" || message.role == "assistant")
                }))
            }
        }

        if total > 0 { progress?(0, total) }

        work: while now() < deadline, !Task.isCancelled {
            if let graph, let turn = try nextTurn(excluding: skipped, context: context) {
                do {
                    if try await graph.index(turn) != nil {
                        report.turnsIndexed += 1
                    } else {
                        skipped.insert(turn.id)
                    }
                } catch is CancellationError {
                    break
                } catch {
                    skipped.insert(turn.id)
                }
                try context.save()
                completed += 1
                progress?(min(completed, total), total)
                continue
            }

            guard let article = try nextWork(excluding: skipped, context: context) else {
                // Everything is indexed: write summaries, newest first, while time allows.
                guard let summarizer,
                      let next = try nextSummary(excluding: skippedSummaries, context: context) else { break }
                do {
                    if try await summarizer.summarize(next, links: links, context: context) != nil {
                        report.summarized += 1
                    } else {
                        skippedSummaries.insert(next.id)
                    }
                } catch is CancellationError {
                    break
                } catch {
                    skippedSummaries.insert(next.id)
                }
                try context.save()
                completed += 1
                progress?(min(completed, total), total)
                continue
            }
            if article.stage == .embedded {
                // Graph extraction. Provider extractions go a few at a time;
                // an article is left for a later run when no allowed extractor
                // is available or every one failed (`graphAttempts` counts those).
                guard let graph else {
                    skipped.insert(article.id)
                    continue
                }
                var batch = [article]
                if graph.prefersProvider(article, links: links) {
                    let others = try nextEmbedded(excluding: skipped.union([article.id]),
                                                  limit: GraphIndexer.concurrentExtractions - 1, context: context)
                    batch += others.filter { graph.prefersProvider($0, links: links) }
                }
                let outcomes = await graph.index(batch, links: links)
                var cancelled = false
                for item in batch {
                    switch outcomes[item.id] {
                    case .linked?: report.linked += 1
                    case .cancelled?:
                        cancelled = true
                        skipped.insert(item.id)
                    default: skipped.insert(item.id)
                    }
                }
                try context.save()
                completed += batch.count
                progress?(min(completed, total), total)
                if cancelled { break work }
                continue
            }

            switch article.stage {
            case .fetched:
                let relevant = try await triage(article, model: model, report: &report)
                if relevant {
                    await attachFullText(article, report: &report, skipped: &skipped)
                }
            case .cleaned:
                _ = try await triage(article, model: model, report: &report)
            default:
                await indexer.index(article, context: context)
                report.embedded += 1
            }
            try context.save()
            completed += 1
            progress?(min(completed, total), total)
        }

        report.remaining = try Self.waitingCount(context: context, includesLinking: extraction != nil)
        report.graph = graph?.stats ?? GraphRunStats()
        return report
    }

    /// The next article to work on: earlier stages first, so triage keeps
    /// up with fetching before any embedding work.
    private func nextWork(excluding skipped: Set<UUID>, context: ModelContext) throws -> Article? {
        for stage in stages {
            if let article = try next(stage, excluding: skipped, context: context) { return article }
        }
        return nil
    }

    /// The oldest settled conversation turn not yet in the graph.
    private func nextTurn(excluding skipped: Set<UUID>, context: ModelContext) throws -> Message? {
        let settled = now().addingTimeInterval(-Self.turnSettleTime)
        var descriptor = FetchDescriptor<Message>(
            predicate: #Predicate { message in
                message.indexedAt == nil && message.createdAt < settled
                    && (message.role == "user" || message.role == "assistant")
            },
            sortBy: [SortDescriptor(\.createdAt)])
        descriptor.fetchLimit = Self.batchSize + skipped.count
        return try context.fetch(descriptor).first { !skipped.contains($0.id) }
    }

    /// Newest first: fresh items are the ones you'll read next.
    private func next(_ stage: ArticleStage, excluding skipped: Set<UUID>, context: ModelContext) throws -> Article? {
        var descriptor = FetchDescriptor<Article>(predicate: Self.pending(stage),
                                                  sortBy: [SortDescriptor(\.ingestedAt, order: .reverse)])
        descriptor.fetchLimit = Self.batchSize + skipped.count
        return try context.fetch(descriptor).first { !skipped.contains($0.id) }
    }

    /// Up to `limit` more articles waiting for graph extraction, newest first.
    private func nextEmbedded(excluding skipped: Set<UUID>, limit: Int, context: ModelContext) throws -> [Article] {
        guard limit > 0 else { return [] }
        var descriptor = FetchDescriptor<Article>(predicate: Self.pending(.embedded),
                                                  sortBy: [SortDescriptor(\.ingestedAt, order: .reverse)])
        descriptor.fetchLimit = limit + skipped.count
        return Array(try context.fetch(descriptor).filter { !skipped.contains($0.id) }.prefix(limit))
    }

    /// New articles are summarized this long after ingestion; older ones
    /// (a library from before summaries) only when opened.
    static let summaryLookback: TimeInterval = 7 * 86_400

    /// Indexed feed articles with no summary. Linked-repo docs aren't reading,
    /// so they're summarized only if opened.
    static func needsSummary(since cutoff: Date) -> Predicate<Article> {
        #Predicate<Article> { article in
            article.summaryJSON == nil && article.ingestedAt >= cutoff
                && (article.stageRaw == "embedded" || article.stageRaw == "linked")
                && article.source?.kind != "github_repo"
        }
    }

    /// The newest recently ingested, indexed article that has no summary yet.
    private func nextSummary(excluding skipped: Set<UUID>, context: ModelContext) throws -> Article? {
        let cutoff = now().addingTimeInterval(-Self.summaryLookback)
        var descriptor = FetchDescriptor<Article>(predicate: Self.needsSummary(since: cutoff),
                                                  sortBy: [SortDescriptor(\.ingestedAt, order: .reverse)])
        descriptor.fetchLimit = Self.batchSize + skipped.count
        return try context.fetch(descriptor).first { !skipped.contains($0.id) }
    }

    /// Scores `article` and moves it to `triaged` or `triagedOut`; an article
    /// still waiting for its full text stays `fetched` when relevant.
    /// - Returns: whether it's relevant.
    private func triage(_ article: Article, model: InterestModel, report: inout Report) async throws -> Bool {
        switch article.source?.sourceKind {
        case .githubRepo?, .manual?:
            // Linked-repo docs are project context and shared items were
            // chosen by you: both are relevant by definition.
            article.relevance = 1
            article.relevanceReason = article.source?.sourceKind == .manual ? "You shared this" : "From a linked repo"
            if article.stage != .fetched { article.stage = .triaged }
            report.triaged += 1
            return true
        default:
            break
        }

        let text = Triage.triageText(title: article.title, summary: article.summary)
        let vector = await embedder.provider.embed(text)
        let scored = Triage.score(title: article.title, summary: article.summary, vector: vector, model: model)
        var relevant = scored.score >= threshold
        if let judge, threshold > 0, abs(scored.score - threshold) < Self.borderline,
           let verdict = await judge.isRelevant(title: article.title, summary: article.summary,
                                                interests: model.promptSummary) {
            relevant = verdict
        }

        article.relevance = scored.score
        article.relevanceReason = scored.reason
        if !relevant {
            article.stage = .triagedOut
            report.triagedOut += 1
        } else {
            if article.stage != .fetched { article.stage = .triaged }
            report.triaged += 1
        }
        return relevant
    }

    /// Replaces a teaser with the page's text. When the page can't be read
    /// (robots.txt, a paywall, an error), the teaser is kept and the article
    /// moves on, so it never blocks the pipeline. A host that is backing
    /// off is retried on a later run instead.
    private func attachFullText(_ article: Article, report: inout Report, skipped: inout Set<UUID>) async {
        if let fullText, let url = URL(string: article.canonicalURL) {
            do {
                let page = try await fullText.fetchArticle(url)
                if FeedIngest.applyFullText(page, to: article) { report.fullTextFetched += 1 }
            } catch IngestError.backingOff {
                skipped.insert(article.id)
                return
            } catch is CancellationError {
                skipped.insert(article.id)
                return
            } catch {
                // Keep the teaser.
            }
        }
        if article.cleanedText.isEmpty { article.cleanedText = article.summary }
        article.stage = .triaged
    }
}
