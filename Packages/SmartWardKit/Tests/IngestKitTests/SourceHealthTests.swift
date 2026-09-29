import XCTest
@testable import IngestKit

final class SourceHealthTests: XCTestCase {
    func testEveryFailureSaysWhatToDo() {
        XCTAssertTrue(SourceHealth.hint(for: IngestError.http(status: 404))?.contains("moved or been removed") == true)
        XCTAssertTrue(SourceHealth.hint(for: IngestError.http(status: 403))?.contains("refuses") == true)
        XCTAssertTrue(SourceHealth.hint(for: IngestError.http(status: 429))?.contains("slow down") == true)
        XCTAssertTrue(SourceHealth.hint(for: IngestError.http(status: 503))?.contains("having trouble") == true)
        XCTAssertNotNil(SourceHealth.hint(for: IngestError.http(status: 418)), "an unlisted status still gets a hint")
        let others: [IngestError] = [.invalidURL("x"), .disallowedByRobots("x"), .backingOff(host: "h", until: .now),
                                     .tooLarge, .notAFeed, .invalidResponse, .redirectedAway(host: nil)]
        for error in others {
            XCTAssertNotNil(error.recoverySuggestion, "\(error)")
        }
    }

    func testARefusedRedirectNamesWhereItWentWithoutSayingHTTP() {
        let message = IngestError.redirectedAway(host: "127.0.0.1").errorDescription ?? ""
        XCTAssertTrue(message.contains("127.0.0.1"))
        XCTAssertFalse(message.contains("HTTP"))
        XCTAssertNotNil(IngestError.redirectedAway(host: nil).errorDescription)
    }

    func testNetworkErrorsGetHintsAndUnknownOnesDont() {
        XCTAssertTrue(SourceHealth.hint(for: URLError(.notConnectedToInternet))?.contains("offline") == true)
        XCTAssertTrue(SourceHealth.hint(for: URLError(.timedOut))?.contains("too long") == true)
        XCTAssertTrue(SourceHealth.hint(for: URLError(.cannotFindHost))?.contains("typo") == true)
        XCTAssertTrue(SourceHealth.hint(for: URLError(.serverCertificateUntrusted))?.contains("certificate") == true)
        XCTAssertNil(SourceHealth.hint(for: URLError(.badServerResponse)))
        XCTAssertNil(SourceHealth.hint(for: NSError(domain: "x", code: 1)))
    }

    func testTheHintIsSavedWithTheMessageAndSplitBackOut() {
        let stored = SourceHealth.stored(IngestError.http(status: 404))
        let parts = SourceHealth.split(stored)
        XCTAssertEqual(parts.message, "The server returned HTTP 404.")
        XCTAssertEqual(parts.hint, IngestError.http(status: 404).recoverySuggestion)

        // No hint to add, and errors saved before hints existed.
        XCTAssertEqual(SourceHealth.stored(URLError(.badServerResponse)), URLError(.badServerResponse).localizedDescription)
        let old = SourceHealth.split("The server returned HTTP 500.")
        XCTAssertEqual(old.message, "The server returned HTTP 500.")
        XCTAssertNil(old.hint)
        XCTAssertNil(SourceHealth.split("Oops\n  \n").hint, "a blank second line isn't a hint")
    }

    func testTheFailingSourcesAreNamed() {
        XCTAssertNil(SourceHealth.summary(failing: []))
        XCTAssertEqual(SourceHealth.summary(failing: ["Hacker News"]), "Couldn't refresh Hacker News")
        XCTAssertEqual(SourceHealth.summary(failing: ["A", "B"]), "Couldn't refresh A and B")
        XCTAssertEqual(SourceHealth.summary(failing: ["A", "B", "C"]), "Couldn't refresh A, B and 1 more")
        XCTAssertEqual(SourceHealth.summary(failing: ["A", "B", "C", "D", "E"]), "Couldn't refresh A, B and 3 more")
    }
}
