import XCTest
import SwiftData
@testable import KnowledgeStore

@MainActor
final class LibraryFixture {
    let container: ModelContainer
    let context: ModelContext
    let project: Project
    let publicNode: ThemeNode
    let privateNode: ThemeNode
    let now = Date(timeIntervalSince1970: 1_800_000_000)

    init() throws {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        let context = container.mainContext

        let project = Project(name: "Inference", goal: "Cut serving cost", constraints: "iPhone only")
        context.insert(project)
        let brief = ProjectBrief(markdown: "# Plan\nServe with vLLM.")
        project.brief = brief
        let revision = BriefRevision(baseMarkdown: "", proposedMarkdown: "# Plan\nServe with vLLM.",
                                     rationale: "First draft", origin: "reviser")
        revision.status = .accepted
        brief.revisions?.append(revision)
        project.items?.append(StrategyItem(kind: .decision, text: "Use vLLM"))
        let question = StrategyItem(kind: .openQuestion, text: "Which batch size?")
        question.status = .done
        project.items?.append(question)
        project.links?.append(ProjectLink(kind: .githubRepo, url: "https://github.com/me/public", repoFullName: "me/public"))
        let privateLink = ProjectLink(kind: .githubRepo, url: "https://github.com/me/secret",
                                      repoFullName: "me/secret", isPrivate: true)
        project.links?.append(privateLink)

        let feed = Source(kind: "rss", url: "https://blog.example/feed")
        let repo = Source(kind: "github_repo", url: "https://github.com/me/secret")
        context.insert(feed)
        context.insert(repo)
        privateLink.sourceID = repo.id

        let article = Article(canonicalURL: "https://blog.example/1", title: "vLLM notes", cleanedText: "vLLM is fast.")
        article.source = feed
        context.insert(article)
        let chunk = Chunk(text: "vLLM is fast.")
        chunk.vector = Data([1, 2, 3, 4])
        chunk.embeddingModel = "fake-v1"
        article.chunks?.append(chunk)

        let secret = Article(canonicalURL: "https://github.com/me/secret/README.md", title: "Secret README",
                             cleanedText: "Project Nightjar", localOnly: true)
        secret.source = repo
        context.insert(secret)
        let secretChunk = Chunk(text: "Project Nightjar", localOnly: true)
        secret.chunks?.append(secretChunk)

        let publicNode = ThemeNode(type: "tool", canonicalLabel: "vLLM")
        let privateNode = ThemeNode(type: "concept", canonicalLabel: "Project Nightjar")
        context.insert(publicNode)
        context.insert(privateNode)
        publicNode.aliases?.append(EntityAlias(alias: "vllm", origin: "auto"))
        for (node, target) in [(publicNode, chunk), (privateNode, secretChunk)] {
            let mention = Mention(confidence: 1, createdAt: Date(timeIntervalSince1970: 1_799_000_000))
            mention.node = node
            target.mentions?.append(mention)
        }
        context.insert(ThemeEdge(sourceNodeID: publicNode.id, targetNodeID: privateNode.id, type: "USES"))
        project.pinnedNodes?.append(contentsOf: [publicNode, privateNode])

        let conversation = Conversation(title: "Serving plan")
        project.conversations?.append(conversation)
        conversation.messages?.append(Message(role: "user", content: "Should we use vLLM?"))
        context.insert(UsageRecord(provider: "openrouter", model: "m", feature: "chat", inputTokens: 10, outputTokens: 2, costUSD: 0.01))
        context.insert(Digest(periodStart: Date(timeIntervalSince1970: 1_799_000_000), periodEnd: Date(timeIntervalSince1970: 1_800_000_000), clusters: []))
        try context.save()

        self.container = container
        self.context = context
        self.project = project
        self.publicNode = publicNode
        self.privateNode = privateNode
    }
}

final class LibraryArchiveTests: XCTestCase {

    @MainActor
    func testTheArchiveHoldsEveryTableWithRelationshipsAsIDs() throws {
        let fixture = try LibraryFixture()
        let archive = try LibraryArchive.snapshot(context: fixture.context, includePrivate: true,
                                                  includeEmbeddings: true, now: fixture.now)
        XCTAssertEqual(archive.projects.map(\.name), ["Inference"])
        XCTAssertEqual(Set(archive.projects[0].pinnedNodeIDs), [fixture.publicNode.id, fixture.privateNode.id])
        XCTAssertEqual(archive.briefs.first?.projectID, fixture.project.id)
        XCTAssertEqual(archive.briefRevisions.first?.briefID, archive.briefs.first?.id)
        XCTAssertEqual(archive.briefRevisions.first?.status, "accepted")
        XCTAssertEqual(archive.strategyItems.count, 2)
        XCTAssertEqual(archive.projectLinks.count, 2)
        XCTAssertEqual(archive.sources.count, 2)
        XCTAssertEqual(archive.articles.count, 2)
        XCTAssertEqual(archive.chunks.count, 2)
        XCTAssertEqual(archive.chunks.first { $0.vector != nil }?.vector, Data([1, 2, 3, 4]))
        XCTAssertEqual(archive.themeNodes.count, 2)
        XCTAssertEqual(archive.aliases.first?.nodeID, fixture.publicNode.id)
        XCTAssertEqual(archive.mentions.count, 2)
        XCTAssertEqual(archive.edges.count, 1)
        XCTAssertEqual(archive.conversations.first?.projectID, fixture.project.id)
        XCTAssertEqual(archive.messages.first?.conversationID, archive.conversations.first?.id)
        XCTAssertEqual(archive.usage.count, 1)
        XCTAssertEqual(archive.digests.count, 1)
        XCTAssertEqual(archive.articles.map(\.id), archive.articles.map(\.id).sorted { $0.uuidString < $1.uuidString },
                       "rows are in id order")
    }

    @MainActor
    func testPrivateContentAndEmbeddingsAreLeftOutByDefault() throws {
        let fixture = try LibraryFixture()
        let archive = try LibraryArchive.snapshot(context: fixture.context, includePrivate: false,
                                                  includeEmbeddings: false, now: fixture.now)
        XCTAssertFalse(archive.includesPrivate)
        XCTAssertEqual(archive.articles.map(\.title), ["vLLM notes"])
        XCTAssertEqual(archive.chunks.map(\.text), ["vLLM is fast."])
        XCTAssertNil(archive.chunks.first?.vector)
        XCTAssertEqual(archive.chunks.first?.embeddingModel, "")
        XCTAssertEqual(archive.projectLinks.map(\.repoFullName), ["me/public"])
        XCTAssertEqual(archive.sources.map(\.kind), ["rss"], "the private repo's source is left out")
        XCTAssertEqual(archive.themeNodes.map(\.canonicalLabel), ["vLLM"], "a theme known only from private content would reveal it")
        XCTAssertEqual(archive.mentions.count, 1)
        XCTAssertTrue(archive.edges.isEmpty)
        XCTAssertEqual(archive.projects.first?.pinnedNodeIDs, [fixture.publicNode.id])

        let text = String(decoding: try archive.encoded(), as: UTF8.self)
        XCTAssertFalse(text.contains("Nightjar"))
        XCTAssertFalse(text.contains("me/secret"))
    }

    @MainActor
    func testEncodingRoundTripsExactlyAndRejectsOtherFiles() throws {
        let fixture = try LibraryFixture()
        let archive = try LibraryArchive.snapshot(context: fixture.context, includePrivate: true,
                                                  includeEmbeddings: true, now: fixture.now)
        let data = try archive.encoded()
        XCTAssertEqual(try LibraryArchive.decode(data), archive)
        XCTAssertEqual(try archive.encoded(), data, "same library, same bytes")

        XCTAssertThrowsError(try LibraryArchive.decode(Data("{\"hello\":1}".utf8))) {
            XCTAssertEqual($0 as? LibraryArchive.ArchiveError, .notAnArchive)
        }
        var newer = archive
        newer.version = LibraryArchive.currentVersion + 1
        XCTAssertThrowsError(try LibraryArchive.decode(try newer.encoded())) {
            XCTAssertEqual($0 as? LibraryArchive.ArchiveError, .newerVersion(LibraryArchive.currentVersion + 1))
        }
    }
}

final class MarkdownExportTests: XCTestCase {

    @MainActor
    func testProjectsRenderWithBriefItemsAndHistory() throws {
        let fixture = try LibraryFixture()
        let markdown = try MarkdownExport.projects(context: fixture.context, includePrivate: false, now: fixture.now)
        XCTAssertTrue(markdown.hasPrefix("# SmartWard projects\nExported 2027-01-15.\n"))
        XCTAssertTrue(markdown.contains("## Inference\n\n**Goal:** Cut serving cost\n\n**Constraints:** iPhone only"))
        XCTAssertTrue(markdown.contains("- me/public (https://github.com/me/public)"))
        XCTAssertFalse(markdown.contains("me/secret"))
        XCTAssertTrue(markdown.contains("### Brief\n\n#### Plan\nServe with vLLM."), "the brief's headings nest under the project")
        XCTAssertTrue(markdown.contains("### Decisions\n\n- [ ] Use vLLM"))
        XCTAssertTrue(markdown.contains("### Open questions\n\n- [x] Which batch size? _(done)_"))
        XCTAssertTrue(markdown.contains("### Brief history\n\n- "))
        XCTAssertTrue(markdown.contains("Accepted from the reviser: First draft"))

        let withPrivate = try MarkdownExport.projects(context: fixture.context, includePrivate: true, now: fixture.now)
        XCTAssertTrue(withPrivate.contains("- me/secret (https://github.com/me/secret)"))
    }

    func testDemotingHeadingsSkipsCodeAndCapsAtSix() {
        let markdown = "# A\n```\n# not a heading\n```\n##### B\n#hashtag"
        XCTAssertEqual(MarkdownExport.demoted(markdown, by: 3), "#### A\n```\n# not a heading\n```\n###### B\n#hashtag")
    }
}
