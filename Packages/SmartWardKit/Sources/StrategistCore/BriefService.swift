import Foundation
import BYOKLLMKit
import KnowledgeStore

/// A line-by-line diff of two brief versions, for review.
public enum BriefDiff {
    public enum Line: Equatable, Sendable {
        case same(String)
        case added(String)
        case removed(String)
    }

    /// Longest-common-subsequence diff: removals come before the additions
    /// that replace them.
    public static func lines(from old: String, to new: String) -> [Line] {
        let a = split(old)
        let b = split(new)
        guard !a.isEmpty || !b.isEmpty else { return [] }

        // lengths[i][j]: LCS length of a[i...] and b[j...].
        var lengths = Array(repeating: Array(repeating: 0, count: b.count + 1), count: a.count + 1)
        for i in stride(from: a.count - 1, through: 0, by: -1) {
            for j in stride(from: b.count - 1, through: 0, by: -1) {
                lengths[i][j] = a[i] == b[j] ? lengths[i + 1][j + 1] + 1 : max(lengths[i + 1][j], lengths[i][j + 1])
            }
        }

        var result: [Line] = []
        var i = 0
        var j = 0
        while i < a.count || j < b.count {
            if i < a.count, j < b.count, a[i] == b[j] {
                result.append(.same(a[i]))
                i += 1
                j += 1
            } else if i < a.count, j == b.count || lengths[i + 1][j] >= lengths[i][j + 1] {
                result.append(.removed(a[i]))
                i += 1
            } else {
                result.append(.added(b[j]))
                j += 1
            }
        }
        return result
    }

    /// How many lines were added and removed.
    public static func counts(_ lines: [Line]) -> (added: Int, removed: Int) {
        var added = 0
        var removed = 0
        for line in lines {
            switch line {
            case .added: added += 1
            case .removed: removed += 1
            case .same: break
            }
        }
        return (added, removed)
    }

    private static func split(_ text: String) -> [String] {
        text.isEmpty ? [] : text.components(separatedBy: "\n")
    }
}

public enum BriefError: LocalizedError, Equatable {
    case empty
    case tooLong(limit: Int)
    case unchanged
    /// The brief changed after the proposal was made.
    case outdated
    case notPending

    public var errorDescription: String? {
        switch self {
        case .empty: return "The brief can't be empty."
        case .tooLong(let limit): return "The brief is longer than \(limit) characters."
        case .unchanged: return "That's the same as the current brief."
        case .outdated: return "The brief changed after this was suggested. Ask for a fresh suggestion."
        case .notPending: return "This suggestion was already decided."
        }
    }
}

/// The living project brief (PLAN §5.5, FR-9): every change is a
/// `BriefRevision`. The strategist and the reviser only propose; the brief
/// changes when you accept, or when you edit it yourself.
@MainActor
public enum BriefEditing {
    public static let maxCharacters = 12_000

    /// The project's brief, created empty if it has none.
    public static func ensuredBrief(for project: Project) -> ProjectBrief {
        if let brief = project.brief { return brief }
        let brief = ProjectBrief()
        project.brief = brief
        return brief
    }

    /// The newest proposal waiting for you, if any.
    public static func pending(for project: Project) -> BriefRevision? {
        (project.brief?.revisions ?? [])
            .filter { $0.status == .pending }
            .max { $0.createdAt < $1.createdAt }
    }

    /// Changes you accepted or made, newest first.
    public static func history(for project: Project) -> [BriefRevision] {
        (project.brief?.revisions ?? [])
            .filter { $0.status == .accepted }
            .sorted { $0.createdAt > $1.createdAt }
    }

    /// Queues a proposal for review. It replaces any proposal still waiting.
    @discardableResult
    public static func propose(_ markdown: String, rationale: String, origin: String,
                               coversUntil: Date? = nil, for project: Project,
                               now: Date = Date()) throws -> BriefRevision {
        let text = try normalized(markdown)
        let brief = ensuredBrief(for: project)
        guard text != brief.markdown else { throw BriefError.unchanged }
        supersedePending(in: brief, now: now)
        let revision = BriefRevision(baseMarkdown: brief.markdown, proposedMarkdown: text,
                                     rationale: rationale.trimmingCharacters(in: .whitespacesAndNewlines),
                                     origin: origin, coversUntil: coversUntil)
        revision.createdAt = now
        brief.revisions?.append(revision)
        return revision
    }

    /// Applies a proposal, unless the brief changed since it was made (then
    /// it's marked superseded, so nothing you wrote is overwritten).
    public static func accept(_ revision: BriefRevision, now: Date = Date()) throws {
        guard revision.status == .pending, let brief = revision.brief else { throw BriefError.notPending }
        guard brief.markdown == revision.baseMarkdown else {
            revision.status = .superseded
            revision.resolvedAt = now
            throw BriefError.outdated
        }
        brief.markdown = revision.proposedMarkdown
        brief.updatedAt = now
        if let covered = revision.coversUntil, covered > brief.sourceWatermark {
            brief.sourceWatermark = covered
        }
        revision.status = .accepted
        revision.resolvedAt = now
    }

    public static func reject(_ revision: BriefRevision, now: Date = Date()) throws {
        guard revision.status == .pending else { throw BriefError.notPending }
        revision.status = .rejected
        revision.resolvedAt = now
    }

    /// Your own edit: applied at once and kept in the history. A proposal
    /// still waiting was made against the old text, so it's superseded.
    public static func edit(_ project: Project, markdown: String, now: Date = Date()) throws {
        let brief = ensuredBrief(for: project)
        let text = markdown.trimmingCharacters(in: .whitespacesAndNewlines)
        guard text.count <= maxCharacters else { throw BriefError.tooLong(limit: maxCharacters) }
        guard text != brief.markdown else { return }
        supersedePending(in: brief, now: now)
        let revision = BriefRevision(baseMarkdown: brief.markdown, proposedMarkdown: text, origin: "user")
        revision.status = .accepted
        revision.createdAt = now
        revision.resolvedAt = now
        brief.revisions?.append(revision)
        brief.markdown = text
        brief.updatedAt = now
    }

    /// Material recorded since the brief last took it in, oldest first.
    public static func newItems(for project: Project) -> [StrategyItem] {
        let watermark = project.brief?.sourceWatermark ?? .distantPast
        return (project.items ?? [])
            .filter { $0.createdAt > watermark }
            .sorted { $0.createdAt < $1.createdAt }
    }

    private static func normalized(_ markdown: String) throws -> String {
        let text = markdown.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !text.isEmpty else { throw BriefError.empty }
        guard text.count <= maxCharacters else { throw BriefError.tooLong(limit: maxCharacters) }
        return text
    }

    private static func supersedePending(in brief: ProjectBrief, now: Date) {
        for revision in brief.revisions ?? [] where revision.status == .pending {
            revision.status = .superseded
            revision.resolvedAt = now
        }
    }
}

/// Drafts a revised brief from the project's state and what was recorded
/// since the brief last took it in (the Selfward revise-in-place pattern).
/// The result is a proposal for you to review, never an edit.
@MainActor
public struct BriefReviser {
    private let llm: any LLMCompleting

    public init(llm: any LLMCompleting) {
        self.llm = llm
    }

    public struct Suggestion {
        /// `nil` when the model found nothing to change.
        public let revision: BriefRevision?
        public let response: LLMResponse
    }

    static let instructions = """
    You maintain the living brief for one of the user's projects: a short Markdown document that says what the \
    project is, the current approach, key decisions, open questions, risks and next steps. Revise the current \
    brief in place to take in the new material. Keep the user's structure and wording wherever it's still true, \
    drop what the new material supersedes, and don't invent facts that aren't in the material. Stay under 600 \
    words. Reply with the complete revised brief inside <brief></brief>, then one sentence on what changed \
    inside <why></why>.
    """

    public func suggest(for project: Project, provider: LLMProvider, model: String,
                        now: Date = Date()) async throws -> Suggestion {
        let brief = BriefEditing.ensuredBrief(for: project)
        let fresh = BriefEditing.newItems(for: project)
        let request = LLMRequest(provider: provider, model: model,
                                 messages: [.system(Self.instructions),
                                            .user(Self.material(for: project, currentBrief: brief.markdown, newItems: fresh))],
                                 maxTokens: 2_000)
        let response = try await llm.complete(request)
        let parsed = Self.parse(response.text)
        let coversUntil = fresh.last?.createdAt ?? now
        do {
            let revision = try BriefEditing.propose(parsed.markdown, rationale: parsed.rationale, origin: "reviser",
                                                    coversUntil: coversUntil, for: project, now: now)
            return Suggestion(revision: revision, response: response)
        } catch BriefError.unchanged {
            brief.sourceWatermark = max(brief.sourceWatermark, coversUntil)
            return Suggestion(revision: nil, response: response)
        }
    }

    static func material(for project: Project, currentBrief: String, newItems: [StrategyItem]) -> String {
        // The current brief goes in its own section below.
        let full = ProjectSnapshot(project: project)
        let snapshot = ProjectSnapshot(name: full.name, goal: full.goal, constraints: full.constraints,
                                       openItems: full.openItems, linkNames: full.linkNames)
        var parts = [StrategistPrompt.projectContext(snapshot)]
        parts.append("Current brief:\n" + (currentBrief.isEmpty ? "(none yet: write the first version)" : currentBrief))
        if newItems.isEmpty {
            parts.append("New since the last revision: nothing recorded. Tighten the brief against the project state.")
        } else {
            let lines = newItems.map { "- [\(StrategistPrompt.label(for: $0.kind)), \($0.status.rawValue)] \($0.text)" }
            parts.append("New since the last revision:\n" + lines.joined(separator: "\n"))
        }
        return parts.joined(separator: "\n\n")
    }

    /// The brief between <brief> tags and the reason between <why> tags. A
    /// reply without tags is taken as the brief itself.
    nonisolated static func parse(_ text: String) -> (markdown: String, rationale: String) {
        func between(_ open: String, _ close: String) -> String? {
            guard let start = text.range(of: open, options: .caseInsensitive),
                  let end = text.range(of: close, options: [.caseInsensitive, .backwards]),
                  start.upperBound <= end.lowerBound else { return nil }
            return String(text[start.upperBound..<end.lowerBound]).trimmingCharacters(in: .whitespacesAndNewlines)
        }
        let rationale = between("<why>", "</why>") ?? ""
        var markdown = between("<brief>", "</brief>") ?? text.trimmingCharacters(in: .whitespacesAndNewlines)
        if markdown.hasPrefix("```") {
            var lines = markdown.components(separatedBy: "\n")
            lines.removeFirst()
            if lines.last?.hasPrefix("```") == true { lines.removeLast() }
            markdown = lines.joined(separator: "\n").trimmingCharacters(in: .whitespacesAndNewlines)
        }
        return (markdown, rationale)
    }
}
