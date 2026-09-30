import Foundation
import KnowledgeStore

/// Numbers segments in order as they're added, one group per item.
struct SegmentBuilder {
    let clean: (String) -> String
    var segments: [ReadoutSegment] = []

    init(clean: @escaping (String) -> String) { self.clean = clean }

    mutating func add(_ anchor: ReadoutSegment.Anchor, _ text: String, group: Int) {
        let spoken = clean(text).trimmingCharacters(in: .whitespacesAndNewlines)
        guard !spoken.isEmpty else { return }
        segments.append(ReadoutSegment(id: segments.count, anchor: anchor, text: spoken, group: group))
    }
}

/// A spoken briefing of your unread articles, for when you can't look at the
/// screen: each article gets its number, title and source, then a two-line
/// gist. "Read this one" swaps a gist for the whole article.
public enum ArticleBriefing {
    public static let defaultLimit = 12
    /// A teaser (when there's no summary yet) is cut to about this long.
    public static let teaserLength = 220

    /// The unread articles worth a briefing, most relevant first (newest
    /// first among equals). Not the project's own repo docs, and not what
    /// triage filtered out as off-topic.
    @MainActor
    public static func queue(from articles: [Article], limit: Int = defaultLimit) -> [Article] {
        let candidates = articles.filter {
            !$0.isRead && $0.stage != .triagedOut && $0.source?.sourceKind != .githubRepo
        }
        let ranked = candidates.sorted { lhs, rhs in
            if lhs.relevance != rhs.relevance { return lhs.relevance > rhs.relevance }
            return (lhs.publishedAt ?? lhs.ingestedAt) > (rhs.publishedAt ?? rhs.ingestedAt)
        }
        return Array(ranked.prefix(max(0, limit)))
    }

    /// The whole briefing: an opening line, then each article as its own
    /// group (in order), then a closing line.
    /// - Parameter sourceName: how the app labels an article's source.
    @MainActor
    public static func segments(for articles: [Article], sourceName: (Article) -> String? = { $0.source?.title },
                                clean: @escaping (String) -> String = { $0 }) -> [ReadoutSegment] {
        guard !articles.isEmpty else { return [] }
        var builder = SegmentBuilder(clean: clean)
        for (index, article) in articles.enumerated() {
            if index == 0 {
                let count = articles.count
                builder.add(.note, "Here \(count == 1 ? "is your unread article" : "are your \(count) top unread articles").",
                            group: 0)
            }
            var header = "Number \(index + 1) of \(articles.count). \(sentence(article.title))"
            if let source = sourceName(article)?.trimmingCharacters(in: .whitespacesAndNewlines), !source.isEmpty {
                header += " From \(source)."
            }
            builder.add(.title, header, group: index)
            if let gist = gist(of: article) { builder.add(.summary, gist, group: index) }
            if index == articles.count - 1 { builder.add(.note, "That's everything for now.", group: index) }
        }
        return builder.segments
    }

    /// The first answers of the article's summary; without one, the start of
    /// its teaser; without that, `nil`.
    @MainActor
    public static func gist(of article: Article) -> String? {
        if let summary = ArticleSummarizer.cached(for: article) {
            let bits = (summary.about.prefix(1) + summary.says.prefix(1)).map(sentence)
            if !bits.isEmpty { return bits.joined(separator: " ") }
        }
        let teaser = article.summary.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !teaser.isEmpty else { return nil }
        return cut(teaser, to: teaserLength)
    }

    /// `text` ending in sentence punctuation, so the voice pauses after it.
    static func sentence(_ text: String) -> String {
        let trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let last = trimmed.last else { return trimmed }
        return ".!?".contains(last) ? trimmed : trimmed + "."
    }

    /// `text` cut to at most `length`, at a sentence end when there is one
    /// in reach, otherwise at a word.
    static func cut(_ text: String, to length: Int) -> String {
        guard text.count > length else { return sentence(text) }
        let prefix = text.prefix(length)
        let sentenceEnd = prefix.indices.last { index in
            let next = prefix.index(after: index)
            return ".!?".contains(prefix[index]) && next < prefix.endIndex && prefix[next].isWhitespace
        }
        if let sentenceEnd, prefix.distance(from: prefix.startIndex, to: sentenceEnd) > length / 3 {
            return String(prefix[...sentenceEnd])
        }
        if let space = prefix.lastIndex(where: \.isWhitespace) {
            return sentence(String(prefix[..<space]))
        }
        return sentence(String(prefix))
    }
}

/// Today's digest, read aloud one theme at a time.
public enum DigestReadout {
    public static func segments(for digest: Digest, clean: @escaping (String) -> String = { $0 }) -> [ReadoutSegment] {
        let clusters = digest.clusters
        guard !clusters.isEmpty else { return [] }
        var builder = SegmentBuilder(clean: clean)
        let articleCount = clusters.reduce(0) { $0 + $1.articleCount }
        for (index, cluster) in clusters.enumerated() {
            if index == 0 {
                builder.add(.note, "Today's digest: \(clusters.count) \(clusters.count == 1 ? "theme" : "themes") from \(articleCount) \(articleCount == 1 ? "article" : "articles").",
                            group: 0)
            }
            let title = cluster.title.isEmpty ? "New reading" : cluster.title
            builder.add(.title, "Theme \(index + 1): \(ArticleBriefing.sentence(title))", group: index)

            let summary = cluster.summary.trimmingCharacters(in: .whitespacesAndNewlines)
            if !summary.isEmpty {
                builder.add(.summary, ArticleBriefing.sentence(summary), group: index)
            } else if !cluster.articles.isEmpty {
                let titles = cluster.articles.prefix(2).map(\.title).map(ArticleBriefing.sentence).joined(separator: " ")
                builder.add(.summary, "\(cluster.articleCount) \(cluster.articleCount == 1 ? "article" : "articles"). \(titles)",
                            group: index)
            }
            if !cluster.projects.isEmpty {
                builder.add(.relevance, "Touches " + naturalList(cluster.projects.prefix(3).map(\.name)) + ".", group: index)
            }
            if index == clusters.count - 1 { builder.add(.note, "That's the whole digest.", group: index) }
        }
        return builder.segments
    }

    /// "A", "A and B", "A, B and C".
    static func naturalList(_ items: [String]) -> String {
        switch items.count {
        case 0: return ""
        case 1: return items[0]
        default: return items.dropLast().joined(separator: ", ") + " and " + items[items.count - 1]
        }
    }
}
