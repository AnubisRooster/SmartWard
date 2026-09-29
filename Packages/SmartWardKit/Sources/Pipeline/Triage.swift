import Foundation
import SwiftData
import RetrievalKit
import KnowledgeStore

/// What "relevant" means right now, built once per pipeline run from the
/// interest profile, active projects, their dependencies and your reading
/// signals (PLAN FR-4).
public struct InterestModel: Sendable {
    public struct Interest: Sendable {
        public let label: String
        public let vector: [Float]

        public init(label: String, vector: [Float]) {
            self.label = label
            self.vector = vector
        }
    }

    public var interests: [Interest]
    /// Mean vector of articles you opened or starred.
    public var liked: [Float]?
    /// Mean vector of articles you dismissed.
    public var disliked: [Float]?
    /// Lowercased dependency name → the projects that use it (dependency radar).
    public var dependencies: [String: [String]]
    public var mutedTopics: [String]
    /// Profile statement and project names, for the on-device relevance check.
    public var promptSummary: String

    public init(interests: [Interest] = [], liked: [Float]? = nil, disliked: [Float]? = nil,
                dependencies: [String: [String]] = [:], mutedTopics: [String] = [], promptSummary: String = "") {
        self.interests = interests
        self.liked = liked
        self.disliked = disliked
        self.dependencies = dependencies
        self.mutedTopics = mutedTopics
        self.promptSummary = promptSummary
    }

    /// With nothing to compare against, everything is neutral.
    public var isEmpty: Bool { interests.isEmpty && liked == nil && dependencies.isEmpty }

    static let signalLimit = 300

    @MainActor
    public static func build(context: ModelContext, embedder: EmbeddingModel) async throws -> InterestModel {
        var model = InterestModel()
        var texts: [(label: String, text: String)] = []
        var described: [String] = []

        if let profile = try context.fetch(FetchDescriptor<InterestProfile>()).first {
            let statement = profile.statement.trimmingCharacters(in: .whitespacesAndNewlines)
            if !statement.isEmpty {
                texts.append(("your interests", statement))
                described.append(statement)
            }
            for topic in profile.explicitTopics where !topic.trimmingCharacters(in: .whitespaces).isEmpty {
                texts.append((topic, topic))
            }
            model.mutedTopics = profile.mutedTopics
                .map { $0.trimmingCharacters(in: .whitespaces).lowercased() }
                .filter { !$0.isEmpty }
        }

        let projects = try context.fetch(FetchDescriptor<Project>(predicate: #Predicate { $0.isActive }))
        for project in projects {
            let summary = [project.name, project.goal].filter { !$0.isEmpty }.joined(separator: ": ")
            if !summary.isEmpty {
                texts.append((project.name, summary))
                described.append("Project \(summary)")
            }
            if let brief = project.brief?.markdown, !brief.isEmpty {
                texts.append((project.name, String(brief.prefix(1_000))))
            }
            for node in project.pinnedNodes ?? [] where node.type == "tool" {
                let name = node.canonicalLabel.lowercased()
                guard name.count >= 3 else { continue }
                model.dependencies[name, default: []].append(project.name)
            }
        }

        let vectors = await embedder.provider.embed(batch: texts.map(\.text))
        for (index, entry) in texts.enumerated() {
            if let vector = vectors[index] {
                model.interests.append(Interest(label: entry.label, vector: vector))
            }
        }

        var recent = FetchDescriptor<ReadingSignal>(sortBy: [SortDescriptor(\.createdAt, order: .reverse)])
        recent.fetchLimit = signalLimit
        let signals = try context.fetch(recent)
        let likedIDs = Set(signals.filter { $0.kind == "open" || $0.kind == "star" }.map(\.articleID))
        let dislikedIDs = Set(signals.filter { $0.kind == "dismiss" }.map(\.articleID)).subtracting(likedIDs)
        model.liked = try meanVector(of: likedIDs, embedder: embedder, context: context)
        model.disliked = try meanVector(of: dislikedIDs, embedder: embedder, context: context)

        model.promptSummary = described.joined(separator: "\n")
        return model
    }

    /// Mean of the articles' first-chunk vectors from this embedder.
    @MainActor
    static func meanVector(of ids: Set<UUID>, embedder: EmbeddingModel, context: ModelContext) throws -> [Float]? {
        guard !ids.isEmpty else { return nil }
        let idList = Array(ids)
        let articles = try context.fetch(FetchDescriptor<Article>(predicate: #Predicate { idList.contains($0.id) }))
        let vectors: [[Float]] = articles.compactMap { article in
            guard let first = (article.chunks ?? []).min(by: { $0.ordinal < $1.ordinal }),
                  first.embeddingModel == embedder.id, let data = first.vector else { return nil }
            let vector = VectorCoding.vector(from: data)
            return vector.isEmpty ? nil : vector
        }
        return VectorCoding.mean(vectors)
    }
}

public struct TriageScore: Equatable, Sendable {
    public var score: Double
    public var reason: String

    public init(score: Double, reason: String) {
        self.score = score
        self.reason = reason
    }
}

/// T0 triage (PLAN §3.3 A4): embedding similarity to your interests, nudged
/// by what you read and dismiss. Dependencies of your projects always pass;
/// muted topics are pushed down.
public enum Triage {
    public static let neutralScore = 0.5
    static let feedbackWeight: Float = 0.25

    /// Relevance filter strengths. Similarities from on-device sentence
    /// embeddings are modest, so the thresholds are low.
    public enum Strength: String, CaseIterable, Sendable {
        case off, balanced, strict

        public var threshold: Double {
            switch self {
            case .off: return 0
            case .balanced: return 0.22
            case .strict: return 0.32
            }
        }
    }

    /// Scores in `0...1`. `vector` embeds the title and summary; `nil` (e.g.
    /// a language the embedder doesn't cover) scores neutral.
    public static func score(title: String, summary: String, vector: [Float]?, model: InterestModel) -> TriageScore {
        let haystack = "\(title)\n\(summary)".lowercased()

        var result: TriageScore
        if let vector, !model.isEmpty {
            var best: (label: String, similarity: Float)?
            for interest in model.interests {
                let similarity = CosineSimilarity.score(vector, interest.vector)
                if similarity > (best?.similarity ?? -.infinity) { best = (interest.label, similarity) }
            }
            var score = Double(best?.similarity ?? Float(neutralScore))
            var reason = best.map { "Matches \($0.label)" } ?? ""
            if let liked = model.liked {
                let similarity = CosineSimilarity.score(vector, liked)
                score += Double(feedbackWeight * similarity)
                if best == nil || similarity > (best?.similarity ?? 0) { reason = "Similar to what you've been reading" }
            }
            if let disliked = model.disliked {
                score -= Double(feedbackWeight * CosineSimilarity.score(vector, disliked))
            }
            result = TriageScore(score: min(max(score, 0), 1), reason: reason)
        } else {
            result = TriageScore(score: neutralScore, reason: "")
        }

        for (name, projects) in model.dependencies.sorted(by: { $0.key < $1.key })
        where containsWord(name, in: haystack) {
            let users = projects.prefix(2).joined(separator: " and ")
            result = TriageScore(score: max(result.score, 0.9), reason: "Mentions \(name), used by \(users)")
            break
        }
        if let muted = model.mutedTopics.first(where: { haystack.contains($0) }) {
            result = TriageScore(score: result.score * 0.3, reason: "Muted topic: \(muted)")
        }
        return result
    }

    static func containsWord(_ word: String, in text: String) -> Bool {
        let pattern = "(?<![a-z0-9])" + NSRegularExpression.escapedPattern(for: word) + "(?![a-z0-9])"
        return text.range(of: pattern, options: .regularExpression) != nil
    }

    /// Text embedded for triage: the title plus the start of the summary.
    public static func triageText(title: String, summary: String) -> String {
        summary.isEmpty ? title : "\(title). \(summary.prefix(800))"
    }

    /// The relevance to show on an article's card, as a whole percentage, or
    /// `nil` when there is no real score to show:
    /// - triage hasn't scored it yet (still `fetched` or `cleaned`);
    /// - it was relevant by definition (shared by you, from a linked repo);
    /// - it scored neutral because there was nothing to compare against (no
    ///   interests yet, or text the embedder can't read).
    public static func displayPercent(for article: Article) -> Int? {
        switch article.source?.sourceKind {
        case .githubRepo?, .manual?: return nil
        default: break
        }
        switch article.stage {
        case .fetched, .cleaned, .failed: return nil
        default: break
        }
        if article.relevance == neutralScore, article.relevanceReason.isEmpty { return nil }
        return Int((article.relevance * 100).rounded())
    }
}

/// An optional second opinion for borderline items (T1): Apple Foundation
/// Models in the app. `nil` means no verdict (model unavailable or failed).
public protocol RelevanceJudging: Sendable {
    func isRelevant(title: String, summary: String, interests: String) async -> Bool?
}
