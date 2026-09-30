import Foundation
import Observation
import SwiftData
import SwiftUI
import KnowledgeStore
import Pipeline

/// On-device hybrid search over everything ingested (FR-14). The index is
/// rebuilt when the library has changed since it was built.
@MainActor
@Observable
final class SearchController {
    static let shared = SearchController()

    private(set) var isIndexing = false
    private var index: HybridSearchIndex?
    private var indexedFingerprint: (articles: Int, chunks: Int)?
    /// Set after pipeline runs: chunks may have been replaced without the
    /// counts changing.
    private var isStale = false
    let embedder = EmbeddingModel.appleSentence()

    /// Checks for changes before the next query.
    func markStale() {
        isStale = true
    }

    /// Drops the index; the next query builds a new one.
    func reset() {
        index = nil
        indexedFingerprint = nil
    }

    /// Context for the strategist: GraphRAG over the library (PLAN §5.2).
    func passages(for query: String, excludingConversation conversationID: UUID?,
                  context: ModelContext) async -> [RetrievedPassage] {
        let trimmed = query.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return [] }
        await ensureIndex(context: context)
        // NFR-4: embedding the question plus GraphRAG, under 500 ms at 100k chunks.
        return await PerfTrace.measureAsync("GraphRAG") {
            let vector = await embedder?.provider.embed(trimmed)
            return (try? GraphRetriever().retrieve(query: trimmed, queryVector: vector, index: index,
                                                   excludingConversation: conversationID, context: context)) ?? []
        }
    }

    func search(_ query: String, context: ModelContext) async -> [SearchHit] {
        let trimmed = query.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return [] }
        await ensureIndex(context: context)
        guard let index else { return [] }
        return await PerfTrace.measureAsync("Search") {
            let vector = await embedder?.provider.embed(trimmed)
            return index.search(trimmed, queryVector: vector)
        }
    }

    /// Keeps the index current: new articles and chunks are added in place,
    /// removed ones retired. A full build (off the main actor) happens only
    /// the first time, or when much of the library changed.
    private func ensureIndex(context: ModelContext) async {
        let fingerprint = (articles: (try? context.fetchCount(FetchDescriptor<Article>())) ?? 0,
                           chunks: (try? context.fetchCount(FetchDescriptor<KnowledgeStore.Chunk>())) ?? 0)
        if !isStale, let indexedFingerprint, index != nil,
           indexedFingerprint.articles == fingerprint.articles, indexedFingerprint.chunks == fingerprint.chunks {
            return
        }
        guard !isIndexing else { return }
        isIndexing = true
        defer { isIndexing = false }

        let modelID = embedder?.id
        if let update = try? SearchCorpus.update(for: index, context: context, embeddingModelID: modelID),
           !update.rebuild, index != nil {
            PerfTrace.measure("Search index update") {
                index?.remove(update.remove)
                index?.add(update.add)
            }
        } else {
            guard let documents = try? SearchCorpus.documents(context: context, embeddingModelID: modelID) else { return }
            let start = Date()
            index = await Task.detached(priority: .userInitiated) {
                HybridSearchIndex(documents: documents)
            }.value
            PerfTrace.record("Search index build", milliseconds: Date().timeIntervalSince(start) * 1_000)
        }
        indexedFingerprint = fingerprint
        isStale = false
    }
}

/// Results for the Reading tab's search field.
struct SearchResultsView: View {
    let query: String

    @Environment(\.modelContext) private var context
    @State private var search = SearchController.shared
    @State private var hits: [SearchHit] = []
    @State private var articles: [UUID: Article] = [:]
    @State private var hasSearched = false

    var body: some View {
        List(hits) { hit in
            if let article = articles[hit.articleID] {
                NavigationLink(value: article) {
                    VStack(alignment: .leading, spacing: 4) {
                        HStack(spacing: 6) {
                            if let source = article.source {
                                Text(source.title.isEmpty ? source.sourceKind.displayName : source.title)
                                    .lineLimit(1)
                            }
                            Spacer(minLength: 4)
                            MatchBadge(kind: hit.matchedBy)
                        }
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        Text(article.title)
                            .font(.headline)
                            .lineLimit(2)
                        Text(hit.snippet)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .lineLimit(3)
                    }
                }
            }
        }
        .listStyle(.plain)
        .overlay {
            if search.isIndexing && hits.isEmpty {
                ProgressView("Indexing your library…")
            } else if hasSearched && hits.isEmpty {
                ContentUnavailableView.search(text: query)
            }
        }
        .task(id: query) {
            // Debounce typing.
            try? await Task.sleep(nanoseconds: 250_000_000)
            guard !Task.isCancelled else { return }
            let results = await search.search(query, context: context)
            guard !Task.isCancelled else { return }
            let ids = results.map(\.articleID)
            let found = (try? context.fetch(FetchDescriptor<Article>(predicate: #Predicate { ids.contains($0.id) }))) ?? []
            var byID: [UUID: Article] = [:]
            for article in found { byID[article.id] = article }
            articles = byID
            hits = results
            hasSearched = true
            // So "open the second one" means the second result.
            AppNavigation.shared.listedArticles = results.compactMap { byID[$0.articleID] }
        }
    }
}

/// Why a result matched: exact words, meaning, or both.
struct MatchBadge: View {
    let kind: SearchHit.MatchKind

    var body: some View {
        let label: String
        if kind.contains(.keyword) && kind.contains(.semantic) {
            label = "Words + meaning"
        } else if kind.contains(.semantic) {
            label = "Meaning"
        } else {
            label = "Words"
        }
        return Text(label)
            .font(.caption2.weight(.medium))
            .padding(.horizontal, 6)
            .padding(.vertical, 2)
            .background(.quaternary, in: Capsule())
    }
}
