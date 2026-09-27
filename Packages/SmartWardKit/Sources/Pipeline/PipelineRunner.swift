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
/// they are project context by definition. Extraction (Phase 3) will pick up
/// from `embedded`.
@MainActor
public final class PipelineRunner {
    public struct Report: Equatable, Sendable {
        public var triaged = 0
        public var triagedOut = 0
        public var fullTextFetched = 0
        public var embedded = 0
        /// Articles still waiting in a stage this run didn't reach.
        public var remaining = 0

        public init(triaged: Int = 0, triagedOut: Int = 0, fullTextFetched: Int = 0,
                    embedded: Int = 0, remaining: Int = 0) {
            self.triaged = triaged
            self.triagedOut = triagedOut
            self.fullTextFetched = fullTextFetched
            self.embedded = embedded
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
    private let now: () -> Date

    public init(embedder: EmbeddingModel, fullText: (any FullTextFetching)?,
                judge: (any RelevanceJudging)? = nil, strength: Triage.Strength = .balanced,
                now: @escaping () -> Date = { Date() }) {
        self.embedder = embedder
        self.fullText = fullText
        self.judge = judge
        self.threshold = strength.threshold
        self.now = now
    }

    /// Works through the backlog until it's empty, `deadline` passes, or the
    /// task is cancelled.
    public func run(context: ModelContext, until deadline: Date) async throws -> Report {
        var report = Report()
        let model = try await InterestModel.build(context: context, embedder: embedder)
        let indexer = ArticleIndexer(embedder: embedder)
        // Articles left in place this run (e.g. their host is backing off),
        // so they aren't picked again until the next run.
        var skipped = Set<UUID>()

        while now() < deadline, !Task.isCancelled {
            guard let article = try nextWork(excluding: skipped, context: context) else { break }
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
        }

        report.remaining = try [ArticleStage.fetched, .cleaned, .triaged].reduce(0) { total, stage in
            let raw = stage.rawValue
            return total + (try context.fetchCount(FetchDescriptor<Article>(predicate: #Predicate { $0.stageRaw == raw })))
        }
        return report
    }

    /// The next article to work on: earlier stages first, so triage keeps
    /// up with fetching before any embedding work.
    private func nextWork(excluding skipped: Set<UUID>, context: ModelContext) throws -> Article? {
        for stage in [ArticleStage.fetched, .cleaned, .triaged] {
            if let article = try next(stage, excluding: skipped, context: context) { return article }
        }
        return nil
    }

    /// Newest first: fresh items are the ones you'll read next.
    private func next(_ stage: ArticleStage, excluding skipped: Set<UUID>, context: ModelContext) throws -> Article? {
        let raw = stage.rawValue
        var descriptor = FetchDescriptor<Article>(predicate: #Predicate { $0.stageRaw == raw },
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
