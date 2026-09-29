import XCTest
import SwiftData
import BYOKLLMKit
import KnowledgeStore
import StrategistCore
@testable import Pipeline

/// A tool that only declares whether it asks first.
private struct StubTool: StrategistTool {
    let name: String
    let asksForApproval: Bool
    var definition: LLMTool { LLMTool(name: name, description: "Stub.", inputSchema: ["type": "object"]) }

    @MainActor
    func run(arguments: JSONValue) async throws -> String { "" }
}

final class ApprovalPolicyTests: XCTestCase {

    func testTypedChatsAskUnlessAutoApproved() {
        XCTAssertEqual(ActionTools.decision(for: "fetch_url", autoApprove: false, handsFree: false, declinesAll: false), .ask)
        XCTAssertEqual(ActionTools.decision(for: "fetch_url", autoApprove: true, handsFree: false, declinesAll: false), .approve)
        XCTAssertEqual(ActionTools.decision(for: "record_strategy_item", autoApprove: true, handsFree: false, declinesAll: false),
                       .ask, "auto-approve never covers what a project remembers")
    }

    func testHandsFreeNeverWaitsOnACard() {
        XCTAssertEqual(ActionTools.decision(for: "record_strategy_item", autoApprove: true, handsFree: true, declinesAll: false),
                       .decline)
        XCTAssertEqual(ActionTools.decision(for: "fetch_url", autoApprove: false, handsFree: true, declinesAll: false),
                       .decline)
        XCTAssertEqual(ActionTools.decision(for: "add_source", autoApprove: true, handsFree: true, declinesAll: false),
                       .approve)
    }

    func testDeclinesAllWins() {
        XCTAssertEqual(ActionTools.decision(for: "fetch_url", autoApprove: true, handsFree: false, declinesAll: true), .decline)
    }

    func testHandsFreeOffersOnlyToolsItCanUse() {
        let tools: [any StrategistTool] = [
            StubTool(name: "search_corpus", asksForApproval: false),
            StubTool(name: "fetch_url", asksForApproval: true),
            StubTool(name: "add_source", asksForApproval: true),
            StubTool(name: "record_strategy_item", asksForApproval: true),
            StubTool(name: "propose_brief_update", asksForApproval: false),
            StubTool(name: "some_new_tool", asksForApproval: true),
        ]
        func names(_ tools: [any StrategistTool]) -> [String] { tools.map { $0.definition.name } }

        XCTAssertEqual(names(ActionTools.handsFreeTools(tools, autoApprove: true)),
                       ["search_corpus", "fetch_url", "add_source", "propose_brief_update"],
                       "auto-approve covers fetch_url and add_source only; a new tool that asks is left out")
        XCTAssertEqual(names(ActionTools.handsFreeTools(tools, autoApprove: false)),
                       ["search_corpus", "propose_brief_update"])
    }

    @MainActor
    func testEachToolDeclaresWhetherItAsksAndMatchesWhatItDoes() throws {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        let context = container.mainContext
        let ledger = ReferenceLedger()

        let asking: [(tool: any StrategistTool, arguments: JSONValue)] = [
            (FetchURLTool(fetcher: FakeFullText(), ledger: ledger), ["url": "https://vllm.ai/blog"]),
            (AddSourceTool(context: context), ["kind": "arxiv", "address": "cs.CL"]),
        ]
        for (tool, arguments) in asking {
            XCTAssertTrue(tool.asksForApproval, tool.definition.name)
            XCTAssertNotNil(try tool.confirmation(for: arguments), tool.definition.name)
        }

        let quiet: [any StrategistTool] = [
            SearchCorpusTool(ledger: ledger) { _ in [] },
            GraphNeighborsTool(context: context),
            OpenArticleTool(ledger: ledger, context: context),
        ]
        for tool in quiet {
            XCTAssertFalse(tool.asksForApproval, tool.definition.name)
            XCTAssertNil(try tool.confirmation(for: [:]), tool.definition.name)
        }
    }
}
