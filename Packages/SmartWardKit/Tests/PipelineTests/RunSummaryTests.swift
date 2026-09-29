import XCTest
@testable import Pipeline

final class RunSummaryTests: XCTestCase {
    func testAFinishedRun() {
        XCTAssertEqual(RunSummary.text(elapsed: 42, stoppedEarly: false, fetch: "5 new items", indexed: 5, waiting: 0),
                       "Finished in less than a minute · 5 new items · 5 indexed")
    }

    func testAStoppedRunSaysHowFarItGot() {
        XCTAssertEqual(RunSummary.text(elapsed: 190, stoppedEarly: true, fetch: "5 new items · 1 source failed",
                                       indexed: 12, waiting: 40),
                       "Stopped early after 3 min · 5 new items · 1 source failed · 12 indexed · 40 articles waiting to be indexed")
    }

    func testLeavesOutWhatDidNotHappen() {
        XCTAssertEqual(RunSummary.text(elapsed: 600, stoppedEarly: true, fetch: nil, indexed: 0, waiting: 1),
                       "Stopped early after 10 min · 1 article waiting to be indexed")
        XCTAssertEqual(RunSummary.text(elapsed: 5, stoppedEarly: false, fetch: "", indexed: 0, waiting: 0),
                       "Finished in less than a minute")
    }
}
