import XCTest
import SwiftData
@testable import KnowledgeStore

final class LinkParsingTests: XCTestCase {

    func testParsesRepoURLs() {
        XCTAssertEqual(ProjectLink.githubRepoFullName(from: "https://github.com/AnubisRooster/OnDeviceKit"),
                       "AnubisRooster/OnDeviceKit")
        XCTAssertEqual(ProjectLink.githubRepoFullName(from: "github.com/AnubisRooster/therAIpist.git"),
                       "AnubisRooster/therAIpist")
        XCTAssertEqual(ProjectLink.githubRepoFullName(from: " https://www.github.com/a/b/pull/6 "), "a/b")
        XCTAssertEqual(ProjectLink.githubRepoFullName(from: "https://github.com/a/b/blob/main/README.md"), "a/b")
    }

    func testRejectsNonRepoURLs() {
        XCTAssertNil(ProjectLink.githubRepoFullName(from: "https://github.com/AnubisRooster"))
        XCTAssertNil(ProjectLink.githubRepoFullName(from: "https://github.com/orgs/foo/people"))
        XCTAssertNil(ProjectLink.githubRepoFullName(from: "https://gitlab.com/a/b"))
        XCTAssertNil(ProjectLink.githubRepoFullName(from: "https://notgithub.com/a/b"))
        XCTAssertNil(ProjectLink.githubRepoFullName(from: ""))
    }

    @MainActor
    func testFromPastedURL() throws {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        defer { _ = container }

        let repo = ProjectLink.fromPastedURL("github.com/AnubisRooster/SmartWard/")
        XCTAssertEqual(repo.kind, .githubRepo)
        XCTAssertEqual(repo.repoFullName, "AnubisRooster/SmartWard")
        XCTAssertEqual(repo.url, "https://github.com/AnubisRooster/SmartWard")

        let page = ProjectLink.fromPastedURL(" https://example.com/notes ")
        XCTAssertEqual(page.kind, .url)
        XCTAssertEqual(page.url, "https://example.com/notes")
        XCTAssertNil(page.repoFullName)
    }
}
