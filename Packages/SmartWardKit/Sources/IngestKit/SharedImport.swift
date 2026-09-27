import Foundation
import SwiftData
import KnowledgeStore
import ShareInbox

/// Turns share-sheet items into articles under one "Shared" source. The
/// pipeline treats them as relevant (you chose them) and fetches the full
/// text of shared links.
public enum SharedImport {
    public static let sourceTitle = "Shared with SmartWard"

    public struct Result: Equatable, Sendable {
        public var added = 0
        public var resurfaced = 0

        public init(added: Int = 0, resurfaced: Int = 0) {
            self.added = added
            self.resurfaced = resurfaced
        }
    }

    /// Imports `items` and returns what changed. Idempotent per item: a link
    /// shared again resurfaces the existing article instead of duplicating it.
    @MainActor
    @discardableResult
    public static func importItems(_ items: [SharedItem], context: ModelContext,
                                   now: Date = Date()) throws -> Result {
        var result = Result()
        guard !items.isEmpty else { return result }
        let source = try sharedSource(context: context)

        for item in items {
            let text = ArticleExtractor.sanitize(item.text ?? "")
            let title = ArticleExtractor.cleanInline(item.title ?? "")

            if let raw = item.url, let url = CanonicalURL.canonicalize(raw) {
                let existing = try context.fetch(FetchDescriptor<Article>(predicate: #Predicate { $0.canonicalURL == url }))
                if let article = existing.first {
                    article.isRead = false
                    article.ingestedAt = now
                    if let projectID = item.projectID { article.projectID = projectID }
                    if article.stage == .triagedOut {
                        // You chose it, so triage's verdict no longer applies.
                        article.stage = .triaged
                        article.relevance = 1
                        article.relevanceReason = "You shared this"
                    }
                    result.resurfaced += 1
                    continue
                }
                let article = Article(canonicalURL: url, title: title.isEmpty ? url : title, cleanedText: text)
                article.summary = String(text.prefix(500))
                article.projectID = item.projectID
                article.ingestedAt = now
                article.stage = text.count >= FeedIngest.fullTextThreshold ? .cleaned : .fetched
                source.articles?.append(article)
                result.added += 1
            } else if !text.isEmpty {
                let fallbackTitle = String(text.prefix(80))
                let article = Article(canonicalURL: "smartward://shared/\(item.id.uuidString)",
                                      title: title.isEmpty ? fallbackTitle : title, cleanedText: text)
                article.summary = String(text.prefix(500))
                article.projectID = item.projectID
                article.ingestedAt = now
                article.stage = .cleaned
                source.articles?.append(article)
                result.added += 1
            }
        }
        try context.save()
        return result
    }

    @MainActor
    static func sharedSource(context: ModelContext) throws -> Source {
        let manual = SourceKind.manual.rawValue
        let title = sourceTitle
        // Filtered by title too, not just kind: other `.manual` sources exist
        // (Pipeline's FetchedPageImport keeps its own), and matching on kind
        // alone would non-deterministically hand back whichever one a fetch
        // happens to return first.
        if let existing = try context.fetch(FetchDescriptor<Source>(
            predicate: #Predicate { $0.kind == manual && $0.title == title })).first {
            return existing
        }
        let source = Source(kind: manual, url: "", title: sourceTitle)
        context.insert(source)
        return source
    }
}
