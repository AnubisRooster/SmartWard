import XCTest
import SwiftData
import BYOKLLMKit
import KnowledgeStore
@testable import StrategistCore

/// Answers every `complete` with the same text and records requests.
final class CannedLLM: LLMCompleting, @unchecked Sendable {
    let text: String
    private(set) var requests: [LLMRequest] = []

    init(_ text: String) {
        self.text = text
    }

    func complete(_ request: LLMRequest) async throws -> LLMResponse {
        requests.append(request)
        return LLMResponse(message: .assistant(text), stopReason: .endTurn,
                           usage: LLMUsage(inputTokens: 100, outputTokens: 50), model: "m")
    }

    func stream(_ request: LLMRequest) -> AsyncThrowingStream<LLMStreamEvent, Error> {
        AsyncThrowingStream { $0.finish() }
    }
}

final class BriefDiffTests: XCTestCase {

    func testLineDiff() {
        let lines = BriefDiff.lines(from: "# P\nold idea\nkeep", to: "# P\nnew idea\nkeep\nnext step")
        XCTAssertEqual(lines, [.same("# P"), .removed("old idea"), .added("new idea"), .same("keep"), .added("next step")])
        XCTAssertTrue(BriefDiff.counts(lines) == (added: 2, removed: 1))
        XCTAssertEqual(BriefDiff.lines(from: "", to: ""), [])
        XCTAssertEqual(BriefDiff.lines(from: "", to: "a"), [.added("a")])
        XCTAssertEqual(BriefDiff.lines(from: "a\nb", to: ""), [.removed("a"), .removed("b")])
    }
}

final class BriefEditingTests: XCTestCase {
    private let now = Date(timeIntervalSince1970: 1_800_000_000)

    @MainActor
    func testProposalsWaitForYouAndAcceptingAppliesThem() throws {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        let project = Project(name: "P")
        container.mainContext.insert(project)

        let first = try BriefEditing.propose("# P\nFirst", rationale: "Start", origin: "strategist", for: project, now: now)
        XCTAssertEqual(project.brief?.markdown, "", "a proposal doesn't change the brief")
        let second = try BriefEditing.propose("  # P\nSecond\n", rationale: " Better ", origin: "reviser",
                                              coversUntil: now + 5, for: project, now: now + 10)
        XCTAssertEqual(first.status, .superseded, "a newer proposal replaces one still waiting")
        XCTAssertEqual(BriefEditing.pending(for: project)?.id, second.id)
        XCTAssertEqual(second.proposedMarkdown, "# P\nSecond")
        XCTAssertEqual(second.rationale, "Better")

        XCTAssertThrowsError(try BriefEditing.accept(first)) { XCTAssertEqual($0 as? BriefError, .notPending) }
        try BriefEditing.accept(second, now: now + 20)
        XCTAssertEqual(project.brief?.markdown, "# P\nSecond")
        XCTAssertEqual(project.brief?.sourceWatermark, now + 5)
        XCTAssertEqual(second.status, .accepted)
        XCTAssertNil(BriefEditing.pending(for: project))
        XCTAssertEqual(BriefEditing.history(for: project).map(\.id), [second.id])

        XCTAssertThrowsError(try BriefEditing.propose("# P\nSecond", rationale: "", origin: "strategist", for: project)) {
            XCTAssertEqual($0 as? BriefError, .unchanged)
        }
        XCTAssertThrowsError(try BriefEditing.propose("  ", rationale: "", origin: "strategist", for: project)) {
            XCTAssertEqual($0 as? BriefError, .empty)
        }
        let long = String(repeating: "x", count: BriefEditing.maxCharacters + 1)
        XCTAssertThrowsError(try BriefEditing.propose(long, rationale: "", origin: "strategist", for: project)) {
            XCTAssertEqual($0 as? BriefError, .tooLong(limit: BriefEditing.maxCharacters))
        }
    }

    @MainActor
    func testRejectEditAndStaleProposalsNeverOverwriteYourText() throws {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        let project = Project(name: "P")
        container.mainContext.insert(project)

        let rejected = try BriefEditing.propose("Draft", rationale: "", origin: "strategist", for: project, now: now)
        try BriefEditing.reject(rejected, now: now)
        XCTAssertEqual(rejected.status, .rejected)
        XCTAssertEqual(project.brief?.markdown, "")

        try BriefEditing.edit(project, markdown: "Mine\n", now: now + 1)
        XCTAssertEqual(project.brief?.markdown, "Mine")
        let pending = try BriefEditing.propose("Mine\nMore", rationale: "", origin: "strategist", for: project, now: now + 2)
        try BriefEditing.edit(project, markdown: "Mine, revised", now: now + 3)
        XCTAssertEqual(pending.status, .superseded, "your edit replaces a proposal made against the old text")

        let stale = try BriefEditing.propose("Theirs", rationale: "", origin: "strategist", for: project, now: now + 4)
        project.brief?.markdown = "Changed on another device"
        XCTAssertThrowsError(try BriefEditing.accept(stale)) { XCTAssertEqual($0 as? BriefError, .outdated) }
        XCTAssertEqual(project.brief?.markdown, "Changed on another device")
        XCTAssertEqual(stale.status, .superseded)

        let history = BriefEditing.history(for: project)
        XCTAssertEqual(history.map(\.proposedMarkdown), ["Mine, revised", "Mine"], "newest first")
        XCTAssertEqual(history.map(\.origin), ["user", "user"])
        XCTAssertEqual(history.first?.baseMarkdown, "Mine", "restoring means editing back to the base")
    }

    @MainActor
    func testTheStrategistToolOnlyProposes() async throws {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        let project = Project(name: "P")
        container.mainContext.insert(project)
        project.brief = ProjectBrief(markdown: "# P")
        let tool = ProposeBriefUpdateTool(project: project)
        XCTAssertEqual(tool.definition.name, "propose_brief_update")
        XCTAssertNil(try tool.confirmation(for: [:]), "a proposal changes nothing, so it isn't gated")
        XCTAssertFalse(tool.asksForApproval)

        let result = try await tool.run(arguments: ["markdown": "# P\nWe serve with vLLM.\nNext: benchmark.",
                                                    "rationale": "Records the serving decision."])
        XCTAssertTrue(result.hasPrefix("Proposed a brief update (+2 −0 lines)."))
        XCTAssertEqual(project.brief?.markdown, "# P")
        XCTAssertEqual(BriefEditing.pending(for: project)?.origin, "strategist")
        XCTAssertEqual(BriefEditing.pending(for: project)?.rationale, "Records the serving decision.")

        do {
            _ = try await tool.run(arguments: ["markdown": "# P"])
            XCTFail("an unchanged brief is reported to the model")
        } catch {
            XCTAssertEqual(error as? BriefError, .unchanged)
        }
    }
}

final class BriefReviserTests: XCTestCase {
    private let now = Date(timeIntervalSince1970: 1_800_000_000)

    @MainActor
    func testRevisesFromNewItemsAndAdvancesTheWatermarkOnAccept() async throws {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        let project = Project(name: "Inference", goal: "Cut serving cost")
        container.mainContext.insert(project)
        project.brief = ProjectBrief(markdown: "# Inference\nGoal: cut cost.")
        project.brief?.sourceWatermark = now - 100
        let old = StrategyItem(kind: .decision, text: "Use Python")
        old.createdAt = now - 200
        let decision = StrategyItem(kind: .decision, text: "Serve with vLLM")
        decision.createdAt = now - 50
        project.items?.append(contentsOf: [old, decision])
        project.links?.append(ProjectLink(kind: .githubRepo, url: "https://github.com/me/secret",
                                          repoFullName: "me/secret", isPrivate: true))

        let llm = CannedLLM("""
        <brief>
        # Inference
        Goal: cut cost.
        Decision: serve with vLLM.
        </brief>
        <why>Adds the serving decision.</why>
        """)
        let suggestion = try await BriefReviser(llm: llm).suggest(for: project, provider: .anthropic, model: "m", now: now)
        let revision = try XCTUnwrap(suggestion.revision)
        XCTAssertEqual(revision.origin, "reviser")
        XCTAssertEqual(revision.rationale, "Adds the serving decision.")
        XCTAssertEqual(revision.proposedMarkdown, "# Inference\nGoal: cut cost.\nDecision: serve with vLLM.")
        XCTAssertEqual(revision.coversUntil, now - 50)
        XCTAssertEqual(suggestion.response.usage?.inputTokens, 100)

        let sent = try XCTUnwrap(llm.requests.first?.messages.last?.text)
        XCTAssertTrue(sent.contains("New since the last revision:\n- [decision, open] Serve with vLLM"))
        XCTAssertFalse(sent.contains("New since the last revision:\n- [decision, open] Use Python"))
        XCTAssertTrue(sent.contains("Current brief:\n# Inference\nGoal: cut cost."))
        XCTAssertFalse(sent.contains("secret"), "private repos never reach the provider (D5)")

        try BriefEditing.accept(revision, now: now)
        XCTAssertEqual(project.brief?.sourceWatermark, now - 50)
        XCTAssertTrue(BriefEditing.newItems(for: project).isEmpty)

        // Nothing to change: no proposal, but the material counts as taken in.
        let same = CannedLLM("<brief>\(revision.proposedMarkdown)</brief><why>No change.</why>")
        let later = StrategyItem(kind: .openQuestion, text: "Batch size?")
        later.createdAt = now + 10
        project.items?.append(later)
        let unchanged = try await BriefReviser(llm: same).suggest(for: project, provider: .anthropic, model: "m", now: now + 20)
        XCTAssertNil(unchanged.revision)
        XCTAssertEqual(project.brief?.sourceWatermark, now + 10)
    }

    func testParsesTaggedFencedAndBareReplies() {
        XCTAssertTrue(BriefReviser.parse("<brief>\n# A\n</brief>\n<why> Because. </why>") == (markdown: "# A", rationale: "Because."))
        XCTAssertTrue(BriefReviser.parse("<brief>\n```markdown\n# A\nB\n```\n</brief>") == (markdown: "# A\nB", rationale: ""))
        XCTAssertTrue(BriefReviser.parse("  # Just the brief\n") == (markdown: "# Just the brief", rationale: ""))
    }
}
