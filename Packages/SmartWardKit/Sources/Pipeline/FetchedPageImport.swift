import Foundation
import SwiftData
import IngestKit
import KnowledgeStore

/// Turns an approved `fetch_url` read into a real, searchable article, so a
/// page you asked the strategist to read doesn't just answer this one turn:
/// the usual pipeline run after a chat message chunks, embeds and links it
/// into your graph like anything else you read. Idempotent per URL:
/// fetching the same page again resurfaces the existing article instead of
/// duplicating it.
public enum FetchedPageImport {
    public static let sourceTitle = "Read in chat"

    /// - Parameter localOnly: forces the article to stay on-device even
    ///   though the page itself is public — set this when the chat that
    ///   asked for it is off the record, so what it turns up gets the same
    ///   treatment as the conversation that found it.
    @MainActor
    @discardableResult
    public static func save(_ page: ExtractedArticle, url: URL, localOnly: Bool,
                            context: ModelContext, now: Date = Date()) throws -> Article {
        let canonical = CanonicalURL.canonicalize(page.canonicalURL ?? url.absoluteString) ?? url.absoluteString
        if let existing = try context.fetch(FetchDescriptor<Article>(
            predicate: #Predicate { $0.canonicalURL == canonical })).first {
            existing.isRead = false
            existing.ingestedAt = now
            existing.localOnly = existing.localOnly || localOnly
            if page.text.count > existing.cleanedText.count {
                existing.cleanedText = page.text
                existing.summary = String(page.text.prefix(500))
            }
            if existing.stage == .triagedOut {
                // You asked for it directly: triage's verdict no longer applies.
                existing.stage = .cleaned
                existing.relevance = 1
                existing.relevanceReason = "You asked to read this"
            }
            try context.save()
            return existing
        }

        let source = try readInChatSource(context: context)
        let article = Article(canonicalURL: canonical,
                              title: page.title.isEmpty ? (url.host ?? canonical) : page.title,
                              cleanedText: page.text, localOnly: localOnly)
        article.summary = String(page.text.prefix(500))
        article.byline = page.byline
        article.publishedAt = page.publishedAt
        article.ingestedAt = now
        article.stage = .cleaned
        article.relevance = 1
        article.relevanceReason = "You asked to read this"
        source.articles?.append(article)
        try context.save()
        return article
    }

    @MainActor
    static func readInChatSource(context: ModelContext) throws -> Source {
        let kind = SourceKind.manual.rawValue
        let title = sourceTitle
        // Filtered by title too: IngestKit's SharedImport keeps its own,
        // separate `.manual` source, and matching on kind alone would
        // non-deterministically hand back whichever one comes back first.
        if let existing = try context.fetch(FetchDescriptor<Source>(
            predicate: #Predicate { $0.kind == kind && $0.title == title })).first {
            return existing
        }
        let source = Source(kind: kind, url: "", title: sourceTitle, origin: "strategist")
        context.insert(source)
        return source
    }
}
