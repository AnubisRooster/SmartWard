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

    @MainActor
    func testApplyPastedURLKeepsSyncStateWhenTheRepoIsUnchanged() throws {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        defer { _ = container }

        let link = ProjectLink.fromPastedURL("https://github.com/AnubisRooster/SmartWard")
        let sourceID = UUID()
        link.sourceID = sourceID
        link.etag = "abc"
        link.defaultBranchSHA = "deadbeef"
        link.lastSyncedAt = Date()
        link.isPrivate = true

        // A cosmetically different URL for the same repo shouldn't disturb sync state.
        link.applyPastedURL("github.com/AnubisRooster/SmartWard.git")
        XCTAssertEqual(link.repoFullName, "AnubisRooster/SmartWard")
        XCTAssertEqual(link.sourceID, sourceID)
        XCTAssertEqual(link.etag, "abc")
        XCTAssertEqual(link.defaultBranchSHA, "deadbeef")
        XCTAssertNotNil(link.lastSyncedAt)
        XCTAssertTrue(link.isPrivate)
    }

    @MainActor
    func testApplyPastedURLClearsSyncStateWhenTheRepoIdentityChanges() throws {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        defer { _ = container }

        let link = ProjectLink.fromPastedURL("https://github.com/AnubisRooster/SmartWard")
        link.sourceID = UUID()
        link.etag = "abc"
        link.defaultBranchSHA = "deadbeef"
        link.lastSyncedAt = Date()
        link.isPrivate = true

        link.applyPastedURL("https://github.com/AnubisRooster/OnDeviceKit")
        XCTAssertEqual(link.kind, .githubRepo)
        XCTAssertEqual(link.repoFullName, "AnubisRooster/OnDeviceKit")
        XCTAssertEqual(link.url, "https://github.com/AnubisRooster/OnDeviceKit")
        XCTAssertNil(link.sourceID, "would otherwise reuse the old repo's Source")
        XCTAssertNil(link.etag)
        XCTAssertNil(link.defaultBranchSHA)
        XCTAssertNil(link.lastSyncedAt)
        XCTAssertFalse(link.isPrivate)
    }

    @MainActor
    func testApplyPastedURLSwitchesKindBothWays() throws {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        defer { _ = container }

        let toPlain = ProjectLink.fromPastedURL("https://github.com/AnubisRooster/SmartWard")
        toPlain.sourceID = UUID()
        toPlain.applyPastedURL("https://example.com/roadmap")
        XCTAssertEqual(toPlain.kind, .url)
        XCTAssertEqual(toPlain.url, "https://example.com/roadmap")
        XCTAssertNil(toPlain.repoFullName)
        XCTAssertNil(toPlain.sourceID)

        let toRepo = ProjectLink.fromPastedURL("https://example.com/roadmap")
        toRepo.applyPastedURL("github.com/AnubisRooster/SmartWard")
        XCTAssertEqual(toRepo.kind, .githubRepo)
        XCTAssertEqual(toRepo.repoFullName, "AnubisRooster/SmartWard")
        XCTAssertEqual(toRepo.url, "https://github.com/AnubisRooster/SmartWard")
    }
}
