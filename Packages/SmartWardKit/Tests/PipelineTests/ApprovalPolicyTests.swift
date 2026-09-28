import XCTest
@testable import Pipeline

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
        let allowed: Set<String> = ["search_corpus", "fetch_url", "add_source", "record_strategy_item", "propose_brief_update"]
        XCTAssertEqual(ActionTools.handsFreeTools(allowed, autoApprove: true),
                       ["search_corpus", "fetch_url", "add_source", "propose_brief_update"])
        XCTAssertEqual(ActionTools.handsFreeTools(allowed, autoApprove: false),
                       ["search_corpus", "propose_brief_update"])
    }
}
