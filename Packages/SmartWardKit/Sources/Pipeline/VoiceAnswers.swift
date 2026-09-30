import Foundation
import SwiftData
import KnowledgeStore

/// Short spoken answers to "how many unread?", "which sources are failing?",
/// "how much have I spent?" and the like. Pure text, so tests cover the
/// wording; the app fetches the numbers.
public enum VoiceAnswers {
    public static func unread(_ count: Int) -> String {
        switch count {
        case ..<1: return "You're all caught up. Nothing is unread."
        case 1: return "You have 1 unread article."
        default: return "You have \(count) unread articles."
        }
    }

    /// - Parameter lastSummary: what the last refresh reported ("5 new items · 1 source failed").
    public static func refresh(isRefreshing: Bool, lastSummary: String?) -> String {
        if isRefreshing { return "Still refreshing." }
        let summary = lastSummary?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        guard !summary.isEmpty else { return "Nothing has been refreshed since the app opened." }
        return "The refresh is done: " + summary.replacingOccurrences(of: " · ", with: ", ") + "."
    }

    public static func failingSources(_ names: [String]) -> String {
        switch names.count {
        case 0: return "All your sources are working."
        case 1: return "One source is failing: \(names[0])."
        case 2...3: return "\(names.count) sources are failing: \(DigestReadout.naturalList(names))."
        default:
            let shown = Array(names.prefix(3))
            return "\(names.count) sources are failing, including \(DigestReadout.naturalList(shown))."
        }
    }

    /// - Parameter cap: the daily budget, or `nil` when there's none.
    public static func spend(spent: Double, cap: Double?) -> String {
        let said = spent < 0.005 ? "You haven't spent anything today." : "You've spent \(money(spent)) today."
        guard let cap else { return said + " There's no daily cap." }
        if spent >= cap { return said + " That's your whole \(money(cap)) daily budget." }
        return said + " Your daily budget is \(money(cap))."
    }

    /// "12 cents", "1 dollar", "3 dollars and 5 cents".
    public static func money(_ amount: Double) -> String {
        var cents = Int((max(0, amount) * 100).rounded())
        let dollars = cents / 100
        cents %= 100
        func part(_ n: Int, _ unit: String) -> String { "\(n) \(unit)\(n == 1 ? "" : "s")" }
        switch (dollars, cents) {
        case (0, _): return part(cents, "cent")
        case (_, 0): return part(dollars, "dollar")
        default: return part(dollars, "dollar") + " and " + part(cents, "cent")
        }
    }

    public static func topThemes(_ labels: [String]) -> String {
        guard !labels.isEmpty else { return "There aren't any themes in your graph yet." }
        return "Your top themes are " + DigestReadout.naturalList(labels) + "."
    }

    /// Up to three titles, numbered, so "open the first one" has something to mean.
    public static func searchResults(query: String, titles: [String], total: Int) -> String {
        guard total > 0, !titles.isEmpty else { return "I found nothing for \(query)." }
        let numbers = ["one", "two", "three"]
        let top = titles.prefix(3).enumerated().map { "Number \(numbers[$0.offset]): \(ArticleBriefing.sentence($0.element))" }
        return "I found \(total) \(total == 1 ? "result" : "results") for \(query). " + top.joined(separator: " ")
    }

    public static func about(_ theme: ThemeDescription) -> String {
        var parts = ["\(theme.label) is a \(theme.type.isEmpty ? "theme" : theme.type)."]
        if theme.articleCount > 0 {
            parts.append("It's in \(theme.articleCount) \(theme.articleCount == 1 ? "article" : "articles").")
        } else {
            parts.append("It isn't in any articles yet.")
        }
        if !theme.projects.isEmpty {
            parts.append("Pinned by \(DigestReadout.naturalList(theme.projects)).")
        }
        if let latest = theme.recentTitles.first {
            parts.append("The latest is \(ArticleBriefing.sentence(latest))")
        }
        return parts.joined(separator: " ")
    }
}

/// What the graph knows about one theme, for "tell me about X".
public struct ThemeDescription: Equatable, Sendable {
    public var label: String
    public var type: String
    public var articleCount: Int
    public var projects: [String]
    /// Newest first.
    public var recentTitles: [String]

    public init(label: String, type: String, articleCount: Int, projects: [String], recentTitles: [String]) {
        self.label = label
        self.type = type
        self.articleCount = articleCount
        self.projects = projects
        self.recentTitles = recentTitles
    }
}

/// The library questions voice can ask.
@MainActor
public enum LibraryVoiceQueries {
    /// Unread reading: not the repo docs, not what triage filtered out.
    public static func unreadCount(in articles: [Article]) -> Int {
        articles.filter { !$0.isRead && $0.stage != .triagedOut && $0.source?.sourceKind != .githubRepo }.count
    }

    /// The strongest themes right now, by decayed mention strength.
    public static func topThemes(context: ModelContext, limit: Int = 5, now: Date = Date()) -> [String] {
        guard let strengths = try? ThemeStrengths.compute(context: context, now: now),
              let nodes = try? context.fetch(FetchDescriptor<ThemeNode>()) else { return [] }
        let ranked = nodes.filter { strengths[$0.id] != nil }.sorted { lhs, rhs in
            let l = strengths[lhs.id]?.strength ?? 0, r = strengths[rhs.id]?.strength ?? 0
            return l != r ? l > r : lhs.canonicalLabel < rhs.canonicalLabel
        }
        return ranked.prefix(max(0, limit)).map(\.canonicalLabel)
    }

    /// The theme best matching what was said (its label or an alias), or `nil`.
    public static func describeTheme(matching query: String, context: ModelContext) -> ThemeDescription? {
        guard let nodes = try? context.fetch(FetchDescriptor<ThemeNode>()), !nodes.isEmpty else { return nil }
        guard let index = VoiceItemMatcher.best(query, in: nodes.map(\.canonicalLabel)) else { return nil }
        let node = nodes[index]
        var seen = Set<UUID>()
        let articles = (node.mentions ?? []).compactMap { $0.chunk?.article }.filter { seen.insert($0.id).inserted }
            .sorted { ($0.publishedAt ?? $0.ingestedAt) > ($1.publishedAt ?? $1.ingestedAt) }
        return ThemeDescription(label: node.canonicalLabel, type: node.type, articleCount: articles.count,
                                projects: (node.pinnedByProjects ?? []).map(\.name).sorted(),
                                recentTitles: articles.prefix(3).map(\.title))
    }
}

/// A spoken answer (the strategist's reply, say) as readout segments, so
/// pause, keep going and stop work on it like on an article.
public enum SpokenAnswer {
    @MainActor
    public static func segments(_ text: String) -> [ReadoutSegment] {
        var builder = SegmentBuilder(clean: { $0 })
        for paragraph in text.components(separatedBy: "\n\n") {
            for piece in ArticleReadout.pieces(of: paragraph) { builder.add(.note, piece, group: 0) }
        }
        return builder.segments
    }
}
