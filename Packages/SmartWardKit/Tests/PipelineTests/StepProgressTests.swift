import XCTest
@testable import Pipeline

final class StepProgressTests: XCTestCase {
    func testPercentIsWholeAndWithinBounds() {
        XCTAssertEqual(StepProgress(done: 0, total: 8).percent, 0)
        XCTAssertEqual(StepProgress(done: 3, total: 8).percent, 37, "rounded down, so 100% means done")
        XCTAssertEqual(StepProgress(done: 8, total: 8).percent, 100)
        XCTAssertEqual(StepProgress(done: 9, total: 8).percent, 100, "never over")
        XCTAssertEqual(StepProgress(done: -1, total: 8).percent, 0, "never under")
    }

    func testUnknownTotalHasNoPercentage() {
        let unknown = StepProgress(done: 0, total: 0)
        XCTAssertFalse(unknown.isDeterminate)
        XCTAssertEqual(unknown.percent, 0)
        XCTAssertTrue(StepProgress(done: 0, total: 1).isDeterminate)
    }
}
