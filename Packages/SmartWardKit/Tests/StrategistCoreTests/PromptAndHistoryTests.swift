import XCTest
import SwiftData
import BYOKLLMKit
import KnowledgeStore
@testable import StrategistCore

final class StrategistPromptTests: XCTestCase {

    func testProjectContextAndModeAreIncluded() {
        let snapshot = ProjectSnapshot(name: "SmartWard", goal: "Ship v1", constraints: "BYOK only",
                                       brief: "# Brief", openItems: [.init(kind: .openQuestion, text: "Which embedder?")],
                                       linkNames: ["AnubisRooster/SmartWard"])
        let prompt = StrategistPrompt.system(mode: .critique, project: snapshot)

        XCTAssertTrue(prompt.contains("Mode: Critique."))
        XCTAssertTrue(prompt.contains("Project: SmartWard"))
        XCTAssertTrue(prompt.contains("Goal: Ship v1"))
        XCTAssertTrue(prompt.contains("Constraints: BYOK only"))
        XCTAssertTrue(prompt.contains("Linked: AnubisRooster/SmartWard"))
        XCTAssertTrue(prompt.contains("- [open question] Which embedder?"))
        XCTAssertTrue(prompt.contains("# Brief"))
        XCTAssertTrue(prompt.contains("record_strategy_item"), "tool guidance appears when there's a project")
    }

    func testGeneralConversationHasNoProjectOrToolGuidance() {
        let prompt = StrategistPrompt.system(mode: .brainstorm, project: nil)
        XCTAssertTrue(prompt.contains("Mode: Brainstorm."))
        XCTAssertFalse(prompt.contains("Project:"))
        XCTAssertFalse(prompt.contains("record_strategy_item"))
    }

    @MainActor
    func testSnapshotOmitsPrivateReposAndClosedItems() throws {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        let project = Project(name: "SmartWard", goal: "Ship v1")
        container.mainContext.insert(project)
        project.links?.append(ProjectLink(kind: .githubRepo, url: "u1", repoFullName: "me/public-repo"))
        project.links?.append(ProjectLink(kind: .githubRepo, url: "u2", repoFullName: "me/secret-repo", isPrivate: true))
        let open = StrategyItem(kind: .risk, text: "Scope creep")
        let closed = StrategyItem(kind: .decision, text: "Superseded idea")
        project.items?.append(open)
        project.items?.append(closed)
        closed.status = .superseded

        let snapshot = ProjectSnapshot(project: project)
        XCTAssertEqual(snapshot.linkNames, ["me/public-repo"])
        XCTAssertEqual(snapshot.openItems, [.init(kind: .risk, text: "Scope creep")])
        XCTAssertFalse(StrategistPrompt.system(mode: .brainstorm, project: snapshot).contains("secret-repo"))
    }

    func testEveryModeHasAProfile() {
        for mode in ConversationMode.allCases {
            XCTAssertTrue(StrategistPrompt.modeProfile(mode).hasPrefix("Mode: "), "\(mode)")
        }
    }
}

final class ConversationHistoryTests: XCTestCase {
    private let t0 = Date(timeIntervalSince1970: 1_800_000_000)

    private func entry(_ role: String, _ content: String, _ offset: TimeInterval) -> ConversationHistory.Entry {
        .init(role: role, content: content, createdAt: t0 + offset)
    }

    func testSortsFiltersAndMaps() {
        let messages = ConversationHistory.messages(from: [
            entry("assistant", "second", 2),
            entry("user", "first", 1),
            entry("tool", "list_project_state done", 3),
            entry("user", "", 4),
            entry("user", "third", 5),
        ])
        XCTAssertEqual(messages, [.user("first"), .assistant("second"), .user("third")])
    }

    func testTrimsOldestToBudgetButKeepsNewest() {
        let messages = ConversationHistory.messages(from: [
            entry("user", String(repeating: "a", count: 10), 1),
            entry("assistant", String(repeating: "b", count: 10), 2),
            entry("user", String(repeating: "c", count: 10), 3),
        ], budgetCharacters: 15)
        XCTAssertEqual(messages, [.user(String(repeating: "c", count: 10))])

        let oversized = ConversationHistory.messages(from: [entry("user", String(repeating: "x", count: 100), 1)],
                                                     budgetCharacters: 10)
        XCTAssertEqual(oversized.count, 1, "the newest turn is kept even when it alone exceeds the budget")
    }

    func testHistoryNeverOpensWithAnAssistantTurn() {
        let messages = ConversationHistory.messages(from: [
            entry("user", String(repeating: "a", count: 10), 1),
            entry("assistant", "bb", 2),
            entry("user", "cc", 3),
        ], budgetCharacters: 5)
        XCTAssertEqual(messages, [.user("cc")])
    }
}

final class ProjectToolTests: XCTestCase {

    @MainActor
    func testRecordStrategyItemAddsToProject() async throws {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        let project = Project(name: "SmartWard")
        container.mainContext.insert(project)

        let tool = RecordStrategyItemTool(project: project)
        let output = try await tool.run(arguments: ["kind": "decision", "text": " Use OpenRouter as the default. "])

        XCTAssertEqual(output, "Recorded decision: Use OpenRouter as the default.")
        XCTAssertEqual(project.items?.count, 1)
        XCTAssertEqual(project.items?.first?.kind, .decision)
        XCTAssertEqual(project.items?.first?.text, "Use OpenRouter as the default.")
    }

    @MainActor
    func testRecordStrategyItemRejectsBadArguments() async throws {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        let project = Project(name: "SmartWard")
        container.mainContext.insert(project)
        let tool = RecordStrategyItemTool(project: project)

        for bad: JSONValue in [["kind": "wish", "text": "x"], ["kind": "decision", "text": "  "], ["text": "x"]] {
            do {
                _ = try await tool.run(arguments: bad)
                XCTFail("expected invalidArguments for \(bad.jsonString)")
            } catch {
                XCTAssertTrue(error is ProjectToolError, "\(error)")
            }
        }
        XCTAssertEqual(project.items?.count, 0)
    }

    @MainActor
    func testProjectStateListsOpenItemsOnly() async throws {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        let project = Project(name: "SmartWard", goal: "Ship v1")
        container.mainContext.insert(project)
        let open = StrategyItem(kind: .actionItem, text: "Wire chat")
        let done = StrategyItem(kind: .decision, text: "Old call")
        project.items?.append(open)
        project.items?.append(done)
        done.status = .done

        let output = try await ProjectStateTool(project: project).run(arguments: [:])
        XCTAssertTrue(output.contains("Goal: Ship v1"))
        XCTAssertTrue(output.contains("- [action item] Wire chat"))
        XCTAssertFalse(output.contains("Old call"))

        open.status = .done
        let empty = try await ProjectStateTool(project: project).run(arguments: [:])
        XCTAssertTrue(empty.hasSuffix("No open items."))
    }
}
