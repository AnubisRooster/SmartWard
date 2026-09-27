import Foundation
import Observation
import SwiftData
import IngestKit
import KnowledgeStore

/// Fetches followed sources into the store. One `PolitenessGate` is shared by
/// the whole app, so rate limits and backoff hold across every refresh.
@MainActor
@Observable
final class IngestController {
    static let shared = IngestController()

    private(set) var isRefreshing = false
    private(set) var refreshingSourceIDs: Set<UUID> = []
    private(set) var lastSummary: String?

    let fetcher = SourceFetcher(gate: PolitenessGate())

    typealias FetchOutcome = (id: UUID, result: Result<FetchedSource?, Error>)

    /// Refreshes every followed source that is polled.
    func refreshAll(context: ModelContext) async {
        let followed = (try? context.fetch(FetchDescriptor<Source>(predicate: #Predicate { $0.isEnabled }))) ?? []
        await refresh(followed.filter { $0.sourceKind.isPolled }, context: context)
    }

    func refresh(_ sources: [Source], context: ModelContext) async {
        guard !isRefreshing, !sources.isEmpty else { return }
        isRefreshing = true
        defer {
            isRefreshing = false
            refreshingSourceIDs = []
        }

        var byID: [UUID: Source] = [:]
        for source in sources { byID[source.id] = source }
        refreshingSourceIDs = Set(byID.keys)
        let descriptors = sources.map { SourceDescriptor($0) }
        let fetcher = self.fetcher

        var added = 0
        var failed = 0
        await withTaskGroup(of: FetchOutcome.self) { group in
            for descriptor in descriptors {
                group.addTask {
                    do {
                        return (descriptor.id, .success(try await fetcher.fetch(descriptor)))
                    } catch {
                        return (descriptor.id, .failure(error))
                    }
                }
            }
            for await (id, result) in group {
                refreshingSourceIDs.remove(id)
                guard let source = byID[id] else { continue }
                switch result {
                case .success(let fetched?):
                    do {
                        added += try FeedIngest.apply(fetched, to: source, context: context).added
                    } catch {
                        FeedIngest.recordFailure(error, on: source, context: context)
                        failed += 1
                    }
                case .success(nil):
                    source.lastFetchedAt = Date()
                    source.lastError = nil
                case .failure(let error):
                    FeedIngest.recordFailure(error, on: source, context: context)
                    failed += 1
                }
            }
        }
        try? context.save()

        var parts = [added == 1 ? "1 new item" : "\(added) new items"]
        if failed > 0 { parts.append(failed == 1 ? "1 source failed" : "\(failed) sources failed") }
        lastSummary = parts.joined(separator: " · ")

        // Triage, full text and indexing for what just arrived (and any backlog).
        await PipelineController.shared.process(context: context)
    }

    /// Fetches the page behind a teaser and keeps its readable text.
    func loadFullText(of article: Article, context: ModelContext) async throws {
        guard let url = URL(string: article.canonicalURL) else { throw IngestError.invalidURL(article.canonicalURL) }
        let page = try await fetcher.fetchArticle(url)
        if FeedIngest.applyFullText(page, to: article) {
            try context.save()
        } else {
            throw FullTextError.nothingMore
        }
    }

    enum FullTextError: LocalizedError {
        case nothingMore

        var errorDescription: String? {
            "The page didn't have more readable text than the preview. Open the original instead."
        }
    }
}

extension SourceKind {
    var displayName: String {
        switch self {
        case .rss: return "Feed"
        case .arxiv: return "arXiv"
        case .hfPapers: return "Hugging Face papers"
        case .hn: return "Hacker News"
        case .githubReleases: return "GitHub releases"
        case .githubRepo: return "GitHub repo"
        case .site: return "Web page"
        case .manual: return "Shared"
        }
    }

    var systemImage: String {
        switch self {
        case .rss: return "dot.radiowaves.up.forward"
        case .arxiv, .hfPapers: return "doc.text.magnifyingglass"
        case .hn: return "flame"
        case .githubReleases, .githubRepo: return "shippingbox"
        case .site: return "globe"
        case .manual: return "square.and.arrow.down"
        }
    }
}
