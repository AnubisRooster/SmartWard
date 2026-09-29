import Foundation
import SwiftData
import KnowledgeStore

/// Reading articles that pertain to a project, for the list on its card.
///
/// Nothing is stored: the list is worked out from what the graph already
/// knows each time the project is opened, so it needs no new field and
/// follows the graph as it changes (a merged theme, a new pin, a restored
/// library). An article pertains to a project when:
/// - you shared it to the project from the share sheet, or
/// - it mentions themes tied to the project (pinned themes, or themes found
///   in the project's linked repos and chats): at least
///   `minimumSharedThemes` of them, or any one you pinned, or
/// - its title or summary names one of the project's pinned tools, which
///   also covers articles that haven't been through extraction yet.
///
/// The project's own repo docs and filtered-out (off-topic) items are never
/// listed, except an off-topic item you shared to the project yourself.
public enum ProjectArticles {
    public struct Match: Identifiable {
        public let article: Article
        /// Why it's listed, shortest first, for display under the title.
        public let reasons: [String]
        public let score: Double

        public var id: UUID { article.id }
    }

    /// Articles older than this (by when their themes were found, or when
    /// they were ingested) aren't listed, which bounds the work.
    public static let lookback: TimeInterval = 90 * 86_400
    public static let minimumSharedThemes = 2
    public static let defaultLimit = 15

    static let sharedScore = 10.0
    static let toolScore = 1.5
    static let minimumToolNameLength = 3
    static let labelsShown = 3

    private struct Candidate {
        let article: Article
        var themes: [UUID: String] = [:]
        var isShared = false
        var tools: [String] = []
    }

    @MainActor
    public static func matches(for project: Project, context: ModelContext,
                               limit: Int = defaultLimit, now: Date = Date()) throws -> [Match] {
        let cutoff = now.addingTimeInterval(-lookback)
        let projectID = project.id
        let pinned = project.pinnedNodes ?? []
        let pinnedIDs = Set(pinned.map(\.id))
        let linkedSources = Set((project.links ?? []).compactMap(\.sourceID))
        var candidates: [UUID: Candidate] = [:]

        func isReading(_ article: Article) -> Bool {
            if article.stage == .triagedOut || article.source?.sourceKind == .githubRepo { return false }
            if let sourceID = article.source?.id, linkedSources.contains(sourceID) { return false }
            return true
        }

        // Themes the article shares with the project, from the mentions
        // rows directly (see `GraphSnapshot.scopedIDs` for why not the
        // themes' own `mentions`).
        let scope = try GraphSnapshot.scopedIDs(.project(projectID), context: context, now: now) ?? []
        if !scope.isEmpty {
            var mentions = FetchDescriptor<Mention>(predicate: #Predicate { $0.createdAt >= cutoff })
            mentions.relationshipKeyPathsForPrefetching = [\.node, \.chunk]
            for mention in try context.fetch(mentions) {
                guard let node = mention.node, scope.contains(node.id),
                      let article = mention.chunk?.article, isReading(article) else { continue }
                candidates[article.id, default: Candidate(article: article)].themes[node.id] = node.canonicalLabel
            }
        }

        // Articles you shared to this project.
        let shared = try context.fetch(FetchDescriptor<Article>(predicate: #Predicate { $0.projectID == projectID }))
        for article in shared {
            candidates[article.id, default: Candidate(article: article)].isShared = true
        }

        // Pinned tools named in the title or summary.
        let tools = pinned.filter { $0.type == "tool" && $0.canonicalLabel.count >= minimumToolNameLength }
        if !tools.isEmpty {
            let recent = try context.fetch(FetchDescriptor<Article>(predicate: #Predicate { $0.ingestedAt >= cutoff }))
            for article in recent where isReading(article) {
                let haystack = "\(article.title)\n\(article.summary)".lowercased()
                let named = tools.map(\.canonicalLabel).filter { Triage.containsWord($0.lowercased(), in: haystack) }
                if !named.isEmpty {
                    candidates[article.id, default: Candidate(article: article)].tools = named.sorted()
                }
            }
        }

        var result: [Match] = []
        for candidate in candidates.values {
            let pinnedHits = candidate.themes.keys.filter(pinnedIDs.contains).count
            let themesQualify = candidate.themes.count >= minimumSharedThemes || pinnedHits > 0
            guard candidate.isShared || themesQualify || !candidate.tools.isEmpty else { continue }

            var reasons: [String] = []
            var score = 0.0
            if candidate.isShared {
                reasons.append("Shared to this project")
                score += sharedScore
            }
            if themesQualify {
                let labels = candidate.themes
                    .sorted { lhs, rhs in
                        let (a, b) = (pinnedIDs.contains(lhs.key), pinnedIDs.contains(rhs.key))
                        return a != b ? a : lhs.value.localizedCaseInsensitiveCompare(rhs.value) == .orderedAscending
                    }
                    .map(\.value)
                reasons.append("Covers " + labels.prefix(labelsShown).joined(separator: ", "))
                score += Double(candidate.themes.count + pinnedHits)
            }
            // A pinned tool that extraction already found counts once, as a theme.
            let themeLabels = Set(candidate.themes.values.map { $0.lowercased() })
            let namedOnly = candidate.tools.filter { !themeLabels.contains($0.lowercased()) }
            if !namedOnly.isEmpty {
                reasons.append("Mentions " + namedOnly.prefix(labelsShown).joined(separator: ", "))
                score += toolScore * Double(namedOnly.count)
            }
            result.append(Match(article: candidate.article, reasons: reasons, score: score))
        }

        result.sort { lhs, rhs in
            if lhs.score != rhs.score { return lhs.score > rhs.score }
            let (a, b) = (date(lhs.article), date(rhs.article))
            if a != b { return a > b }
            return lhs.article.title < rhs.article.title
        }
        return Array(result.prefix(max(0, limit)))
    }

    private static func date(_ article: Article) -> Date { article.publishedAt ?? article.ingestedAt }
}
