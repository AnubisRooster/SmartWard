import Foundation
import SwiftData
import KnowledgeStore

/// Writes fetched items into the store (PLAN §3.3 A2): dedupes by canonical
/// URL and content hash across every source, and marks which articles still
/// need their full text fetched.
public enum FeedIngest {
    /// At most this many new items per fetch, newest first, so a first fetch
    /// of a busy feed doesn't flood the inbox.
    public static let maxNewItemsPerFetch = 50
    /// Items older than this are skipped.
    public static let maxItemAge: TimeInterval = 60 * 24 * 60 * 60
    /// Feed content at least this long counts as the full article.
    public static let fullTextThreshold = 1_000
    static let summaryLength = 500

    public struct Result: Equatable, Sendable {
        public var added = 0
        public var updated = 0
        public var duplicates = 0
        public var skippedOld = 0

        public init(added: Int = 0, updated: Int = 0, duplicates: Int = 0, skippedOld: Int = 0) {
            self.added = added
            self.updated = updated
            self.duplicates = duplicates
            self.skippedOld = skippedOld
        }
    }

    /// Stores `fetched` under `source` and records the fetch on the source.
    @MainActor
    @discardableResult
    public static func apply(_ fetched: FetchedSource, to source: Source,
                             context: ModelContext, now: Date = Date()) throws -> Result {
        var result = Result()
        source.etag = fetched.etag
        source.lastModified = fetched.lastModified
        source.lastFetchedAt = now
        source.lastError = nil
        if let discovered = fetched.discoveredFeedURL { source.url = discovered }
        if source.title.isEmpty, !fetched.title.isEmpty { source.title = fetched.title }

        let cutoff = now.addingTimeInterval(-maxItemAge)
        var candidates: [RawItem] = []
        var batchURLs = Set<String>()
        for item in fetched.items {
            if let published = item.publishedAt, published < cutoff {
                result.skippedOld += 1
                continue
            }
            guard batchURLs.insert(item.url).inserted else {
                result.duplicates += 1
                continue
            }
            candidates.append(item)
        }
        candidates.sort { ($0.publishedAt ?? now) > ($1.publishedAt ?? now) }

        let urls = candidates.map(\.url)
        let existingByURL = try context.fetch(FetchDescriptor<Article>(
            predicate: #Predicate { urls.contains($0.canonicalURL) }))
        var byURL: [String: Article] = [:]
        for article in existingByURL { byURL[article.canonicalURL] = article }

        let hashes = candidates.compactMap(dedupeHash)
        let existingByHash = try context.fetch(FetchDescriptor<Article>(
            predicate: #Predicate { hashes.contains($0.contentHash) }))
        var knownHashes = Set(existingByHash.map(\.contentHash))

        for item in candidates {
            let body = item.content.isEmpty ? item.summary : item.content
            if let existing = byURL[item.url] {
                // A watched page changed: refresh it and surface it again.
                if source.sourceKind == .site, existing.source?.id == source.id,
                   let hash = dedupeHash(item), existing.contentHash != hash {
                    existing.cleanedText = body
                    existing.summary = summary(for: item)
                    existing.contentHash = hash
                    existing.stage = .cleaned
                    existing.isRead = false
                    existing.ingestedAt = now
                    result.updated += 1
                } else {
                    result.duplicates += 1
                }
                continue
            }
            guard result.added < maxNewItemsPerFetch else { break }
            let hash = dedupeHash(item)
            if let hash, !knownHashes.insert(hash).inserted {
                result.duplicates += 1
                continue
            }

            let article = Article(canonicalURL: item.url, title: item.title, cleanedText: body)
            article.summary = summary(for: item)
            article.byline = item.author
            article.publishedAt = item.publishedAt
            article.contentHash = hash ?? ""
            article.ingestedAt = now
            article.stage = hasFullText(item, kind: source.sourceKind) ? .cleaned : .fetched
            source.articles?.append(article)
            byURL[item.url] = article
            result.added += 1
        }
        try context.save()
        return result
    }

    /// Replaces a teaser with the page's full text, when the page yielded
    /// more than the article already has.
    /// - Returns: whether the article changed.
    @MainActor
    @discardableResult
    public static func applyFullText(_ page: ExtractedArticle, to article: Article) -> Bool {
        guard page.text.count >= 200, page.text.count > article.cleanedText.count else { return false }
        if article.summary.isEmpty {
            let firstParagraph = page.text.components(separatedBy: "\n\n").first ?? ""
            article.summary = String(firstParagraph.prefix(summaryLength))
        }
        article.cleanedText = page.text
        article.contentHash = RepoSync.contentHash(page.text)
        if article.byline == nil { article.byline = page.byline }
        if article.publishedAt == nil { article.publishedAt = page.publishedAt }
        article.stage = .cleaned
        return true
    }

    /// Records a failed fetch on the source so the Sources list can show it.
    @MainActor
    public static func recordFailure(_ error: Error, on source: Source, context: ModelContext, now: Date = Date()) {
        source.lastFetchedAt = now
        source.lastError = (error as? LocalizedError)?.errorDescription ?? error.localizedDescription
        try? context.save()
    }

    /// Papers are read as their abstracts, and discussion threads as their
    /// text; for everything else the feed's text must be long enough to be
    /// the article rather than a teaser.
    static func hasFullText(_ item: RawItem, kind: SourceKind) -> Bool {
        switch kind {
        case .arxiv, .hfPapers, .githubReleases:
            return true
        case .hn:
            return item.url.hasPrefix("https://news.ycombinator.com/")
        default:
            return item.content.count >= fullTextThreshold
        }
    }

    static func summary(for item: RawItem) -> String {
        let text = item.summary.isEmpty ? item.content : item.summary
        guard text.count > summaryLength else { return text }
        return String(text.prefix(summaryLength)).trimmingCharacters(in: .whitespaces) + "…"
    }

    /// Hash of the body when it's substantial enough that two identical
    /// bodies really are the same article (short teasers collide too often).
    static func dedupeHash(_ item: RawItem) -> String? {
        let body = item.content.isEmpty ? item.summary : item.content
        guard body.count >= 200 else { return nil }
        return RepoSync.contentHash(body)
    }
}
