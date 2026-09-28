import XCTest
import SwiftData
import KnowledgeStore
import StrategistCore
@testable import Pipeline

final class SourceIntakeTests: XCTestCase {

    @MainActor
    func testShortcutsAndTheStrategistShareOneValidation() throws {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        let context = container.mainContext

        let plan = try SourceIntake.plan(kind: .rss, address: " example.com/feed.xml ", title: "  ", context: context)
        XCTAssertEqual(plan, SourceIntake.Plan(kind: .rss, url: "https://example.com/feed.xml", title: "example.com/feed.xml"),
                       "the address names the source when no name is given")
        let source = SourceIntake.add(plan, origin: "shortcut", context: context)
        XCTAssertEqual(source.origin, "shortcut")
        XCTAssertTrue(source.isEnabled)

        func refusal(_ kind: SourceKind, _ address: String) -> SourceIntake.Refusal? {
            do {
                _ = try SourceIntake.plan(kind: kind, address: address, title: nil, context: context)
                return nil
            } catch {
                return error as? SourceIntake.Refusal
            }
        }
        XCTAssertEqual(refusal(.rss, "https://EXAMPLE.com/feed.xml"), .alreadyFollowed)
        XCTAssertEqual(refusal(.githubRepo, "me/app"), .unsupportedKind("github_repo"))
        XCTAssertEqual(refusal(.githubReleases, "not a repo"), .invalidAddress("not a repo", kind: "github_releases"))
        guard case .unsafeAddress? = refusal(.site, "http://192.168.1.1/admin") else {
            return XCTFail("local addresses are refused")
        }
        XCTAssertEqual(try SourceIntake.plan(kind: .arxiv, address: "cs.CL", title: "NLP", context: context).title, "NLP")
    }

    @MainActor
    func testOnboardingSourcesGetTheSameValidation() throws {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        let context = container.mainContext
        context.insert(Source(kind: "rss", url: "https://followed.example/feed.xml", title: "Followed"))
        try context.save()

        let proposal = OnboardingProposal(
            projects: [],
            sources: [
                .init(kind: "rss", url: " example.com/feed.xml ", title: "Example"),
                .init(kind: "site", url: "http://192.168.1.1/admin", title: "Router"),
                .init(kind: "rss", url: "https://followed.example/feed.xml", title: "Again"),
                .init(kind: "github_repo", url: "me/app", title: "Not a feed"),
                .init(kind: "arxiv", url: "cs.CL", title: "NLP"),
            ],
            interestStatement: "", topics: [], mutedTopics: [])
        let checked = SourceIntake.checked(proposal, context: context)
        XCTAssertEqual(checked.sources, [
            .init(kind: "rss", url: "https://example.com/feed.xml", title: "Example"),
            .init(kind: "arxiv", url: try SourceIntake.plan(kind: .arxiv, address: "cs.CL", title: "NLP", context: context).url,
                  title: "NLP"),
        ], "normalized, and local, repeated or unsupported ones dropped")
    }
}
