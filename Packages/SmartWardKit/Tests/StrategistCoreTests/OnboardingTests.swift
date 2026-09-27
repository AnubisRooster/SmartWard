import XCTest
import SwiftData
import BYOKLLMKit
import KnowledgeStore
@testable import StrategistCore

final class OnboardingSynthesizerTests: XCTestCase {

    func testRequestCarriesTranscriptLinksAndSchema() {
        let request = OnboardingSynthesizer.request(
            provider: .openrouter, model: "m",
            transcript: [.assistant("What are you building?"), .user("An iOS research app."),
                         .toolResult(callID: "x", content: "ignored"), .user("  ")],
            links: [" github.com/AnubisRooster/SmartWard ", ""])

        XCTAssertEqual(request.messages.count, 2)
        XCTAssertEqual(request.messages.first?.role, .system)
        let body = request.messages.last?.text ?? ""
        XCTAssertTrue(body.contains("SmartWard: What are you building?"))
        XCTAssertTrue(body.contains("User: An iOS research app."))
        XCTAssertFalse(body.contains("ignored"))
        XCTAssertTrue(body.contains("- github.com/AnubisRooster/SmartWard"))
        XCTAssertEqual(request.responseFormat,
                       .jsonSchema(name: "onboarding_proposal", schema: OnboardingProposal.schema))
    }

    func testEmptyInputsAreMarked() {
        let body = OnboardingSynthesizer.request(provider: .anthropic, model: "m", transcript: [], links: [])
            .messages.last?.text ?? ""
        XCTAssertTrue(body.contains("Interview transcript:\n(none)"))
        XCTAssertTrue(body.contains("Links the user pasted:\n(none)"))
    }

    func testSchemaIsStrictCompatible() throws {
        let schema = OnboardingProposal.schema
        XCTAssertEqual(schema["additionalProperties"], .bool(false))
        let required = Set(schema["required"]?.arrayValue?.compactMap(\.stringValue) ?? [])
        let properties = Set(schema["properties"]?.objectValue?.keys.map { $0 } ?? [])
        XCTAssertEqual(required, properties, "strict mode needs every property required")

        let project = schema["properties"]?["projects"]?["items"]
        XCTAssertEqual(project?["additionalProperties"], .bool(false))
        XCTAssertEqual(Set(project?["required"]?.arrayValue?.compactMap(\.stringValue) ?? []),
                       Set(project?["properties"]?.objectValue?.keys.map { $0 } ?? []))
    }

    func testDecodeToleratesFences() throws {
        let json = """
        ```json
        {"projects":[{"name":"SmartWard","goal":"Ship v1","constraints":"","links":["https://github.com/a/b"]}],
         "sources":[{"kind":"arxiv","url":"cat:cs.LG","title":"ML"}],
         "interestStatement":"You follow agents.","topics":["agents"],"mutedTopics":["crypto"]}
        ```
        """
        let proposal = try OnboardingSynthesizer.decode(json)
        XCTAssertEqual(proposal.projects, [.init(name: "SmartWard", goal: "Ship v1", links: ["https://github.com/a/b"])])
        XCTAssertEqual(proposal.sources, [.init(kind: "arxiv", url: "cat:cs.LG", title: "ML")])
        XCTAssertEqual(proposal.mutedTopics, ["crypto"])
    }

    func testDecodeRejectsGarbage() {
        XCTAssertThrowsError(try OnboardingSynthesizer.decode("not json"))
    }

    func testOnboardingPromptCoversChecklist() {
        let prompt = StrategistPrompt.system(mode: .onboarding, project: nil)
        for item in StrategistPrompt.onboardingChecklist {
            XCTAssertTrue(prompt.contains(item), item)
        }
        XCTAssertTrue(prompt.contains("Build my setup"))
    }
}

final class OnboardingApplyTests: XCTestCase {

    @MainActor
    func testApplyCreatesEverythingOnce() throws {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        let context = container.mainContext
        let proposal = OnboardingProposal(
            projects: [
                .init(name: "Developer agent", goal: "Automate dev chores",
                      links: ["github.com/AnubisRooster/developer-agent", "https://github.com/AnubisRooster/developer_agent",
                              "github.com/AnubisRooster/developer-agent"]),
                .init(name: "  ", links: ["https://example.com"]),
            ],
            sources: [
                .init(kind: "rss", url: "https://example.com/feed.xml", title: "Blog"),
                .init(kind: "podcast", url: "https://example.com/pod", title: "Unsupported kind"),
                .init(kind: "arxiv", url: "", title: "Empty"),
            ],
            interestStatement: "You follow coding agents.",
            topics: ["coding agents", "Coding Agents", " evals "],
            mutedTopics: ["crypto"])

        let first = try proposal.apply(to: context)
        XCTAssertEqual(first, .init(projectsCreated: 1, projectsUpdated: 0, linksAdded: 2, sourcesAdded: 1))

        let project = try XCTUnwrap(try context.fetch(FetchDescriptor<Project>()).first)
        XCTAssertEqual(project.name, "Developer agent")
        XCTAssertEqual(Set((project.links ?? []).compactMap(\.repoFullName)),
                       ["AnubisRooster/developer-agent", "AnubisRooster/developer_agent"])
        XCTAssertTrue((project.links ?? []).allSatisfy { $0.addedDuring == "onboarding" })

        let source = try XCTUnwrap(try context.fetch(FetchDescriptor<Source>()).first)
        XCTAssertEqual(source.origin, "onboarding")

        let profile = try XCTUnwrap(try context.fetch(FetchDescriptor<InterestProfile>()).first)
        XCTAssertEqual(profile.statement, "You follow coding agents.")
        XCTAssertEqual(profile.explicitTopics, ["coding agents", "evals"])
        XCTAssertEqual(profile.mutedTopics, ["crypto"])

        // Re-running is idempotent: same project gains nothing, no duplicate sources or profiles.
        let second = try proposal.apply(to: context)
        XCTAssertEqual(second, .init(projectsCreated: 0, projectsUpdated: 1, linksAdded: 0, sourcesAdded: 0))
        XCTAssertEqual(try context.fetchCount(FetchDescriptor<Project>()), 1)
        XCTAssertEqual(try context.fetchCount(FetchDescriptor<Source>()), 1)
        XCTAssertEqual(try context.fetchCount(FetchDescriptor<InterestProfile>()), 1)
    }

    @MainActor
    func testApplyMergesIntoExistingProjectWithoutOverwriting() throws {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        let context = container.mainContext
        let existing = Project(name: "SmartWard", goal: "My own goal")
        context.insert(existing)

        let proposal = OnboardingProposal(projects: [
            .init(name: "smartward", goal: "Model's goal", constraints: "iOS only", links: ["github.com/AnubisRooster/SmartWard"]),
        ])
        let result = try proposal.apply(to: context)

        XCTAssertEqual(result.projectsUpdated, 1)
        XCTAssertEqual(existing.goal, "My own goal", "user-entered fields are never overwritten")
        XCTAssertEqual(existing.constraints, "iOS only", "empty fields are filled in")
        XCTAssertEqual(existing.links?.first?.repoFullName, "AnubisRooster/SmartWard")
    }

    func testMergeTopics() {
        XCTAssertEqual(OnboardingProposal.mergeTopics(["A", "b"], ["a", "C", " ", "B "]), ["A", "b", "C"])
    }
}
