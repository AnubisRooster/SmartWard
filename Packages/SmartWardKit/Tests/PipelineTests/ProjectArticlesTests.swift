import XCTest
import SwiftData
import KnowledgeStore
@testable import Pipeline

/// The "Related reading" list on a project's card.
final class ProjectArticlesTests: XCTestCase {
    private let now = Date(timeIntervalSince1970: 1_800_000_000)

    @MainActor
    private struct World {
        let context: ModelContext
        let project: Project
        let feed: Source
        let repo: Source
        let vllm: ThemeNode      // pinned tool
        let rag: ThemeNode       // found in the project's linked repo
        let agents: ThemeNode    // found in the project's linked repo
        let unrelated: ThemeNode // not tied to the project
    }

    @MainActor
    private func makeWorld() throws -> World {
        let context = try KnowledgeSchema.makeContainer(inMemory: true).mainContext
        let project = Project(name: "Inference stack")
        let feed = Source(kind: "rss", url: "https://blog.example/feed", title: "Blog")
        let repo = Source(kind: "github_repo", url: "https://github.com/me/stack", title: "me/stack")
        context.insert(project)
        context.insert(feed)
        context.insert(repo)

        let vllm = ThemeNode(type: "tool", canonicalLabel: "vLLM")
        let rag = ThemeNode(type: "technique", canonicalLabel: "RAG")
        let agents = ThemeNode(type: "concept", canonicalLabel: "Agents")
        let unrelated = ThemeNode(type: "concept", canonicalLabel: "Sourdough")
        for node in [vllm, rag, agents, unrelated] { context.insert(node) }
        project.pinnedNodes?.append(vllm)

        let link = ProjectLink(kind: .githubRepo, url: "https://github.com/me/stack", repoFullName: "me/stack")
        link.sourceID = repo.id
        project.links?.append(link)
        // The project's own docs are where "RAG" and "Agents" come from.
        let readme = Article(canonicalURL: "https://github.com/me/stack/README.md", title: "README")
        readme.source = repo
        readme.stage = .linked
        context.insert(readme)
        mention([rag, agents], in: readme, at: now)
        try context.save()
        return World(context: context, project: project, feed: feed, repo: repo,
                     vllm: vllm, rag: rag, agents: agents, unrelated: unrelated)
    }

    @MainActor
    private func mention(_ nodes: [ThemeNode], in article: Article, at date: Date) {
        let chunk = KnowledgeStore.Chunk(text: nodes.map(\.canonicalLabel).joined(separator: " "),
                                         ordinal: article.chunks?.count ?? 0)
        article.chunks?.append(chunk)
        for node in nodes {
            let mention = Mention(confidence: 1, createdAt: date)
            mention.node = node
            chunk.mentions?.append(mention)
        }
    }

    @MainActor
    private func reading(_ world: World, _ title: String, themes: [ThemeNode] = [], summary: String = "",
                         stage: ArticleStage = .linked, daysAgo: Double = 1, source: Source? = nil) -> Article {
        let article = Article(canonicalURL: "https://blog.example/\(title.replacingOccurrences(of: " ", with: "-"))",
                              title: title)
        article.summary = summary
        article.source = source ?? world.feed
        article.stage = stage
        article.ingestedAt = now.addingTimeInterval(-daysAgo * 86_400)
        world.context.insert(article)
        mention(themes, in: article, at: article.ingestedAt)
        return article
    }

    @MainActor
    private func titles(_ world: World, limit: Int = ProjectArticles.defaultLimit) throws -> [String] {
        try world.context.save()
        return try ProjectArticles.matches(for: world.project, context: world.context, limit: limit, now: now)
            .map(\.article.title)
    }

    @MainActor
    func testSharingTwoThemesWithTheProjectQualifiesButOneDoesNot() throws {
        let world = try makeWorld()
        _ = reading(world, "Both themes", themes: [world.rag, world.agents])
        _ = reading(world, "One theme", themes: [world.rag])
        _ = reading(world, "Elsewhere", themes: [world.unrelated])

        XCTAssertEqual(try titles(world), ["Both themes"])
        let match = try XCTUnwrap(ProjectArticles.matches(for: world.project, context: world.context, now: now).first)
        XCTAssertEqual(match.reasons, ["Covers Agents, RAG"])
    }

    @MainActor
    func testAPinnedThemeIsEnoughAndPinnedThemesAreNamedFirst() throws {
        let world = try makeWorld()
        _ = reading(world, "Pinned only", themes: [world.vllm])
        _ = reading(world, "Pinned and others", themes: [world.agents, world.vllm, world.rag])

        let matches = try ProjectArticles.matches(for: world.project, context: world.context, now: now)
        let byTitle = Dictionary(uniqueKeysWithValues: matches.map { ($0.article.title, $0) })
        XCTAssertEqual(byTitle["Pinned only"]?.reasons, ["Covers vLLM"])
        XCTAssertEqual(byTitle["Pinned and others"]?.reasons, ["Covers vLLM, Agents, RAG"])
        XCTAssertEqual(matches.first?.article.title, "Pinned and others", "more shared themes rank higher")
    }

    @MainActor
    func testSharedArticlesAreListedFirstWithTheirReason() throws {
        let world = try makeWorld()
        _ = reading(world, "Strong overlap", themes: [world.vllm, world.rag, world.agents])
        let shared = reading(world, "Shared by me", stage: .triagedOut)
        shared.projectID = world.project.id

        let matches = try ProjectArticles.matches(for: world.project, context: world.context, now: now)
        XCTAssertEqual(matches.map(\.article.title), ["Shared by me", "Strong overlap"],
                       "an article you shared is listed even when triage filtered it out")
        XCTAssertEqual(matches.first?.reasons, ["Shared to this project"])
    }

    @MainActor
    func testRepoDocsAndFilteredOutItemsAreNotListed() throws {
        let world = try makeWorld()
        _ = reading(world, "Repo doc", themes: [world.vllm, world.rag], source: world.repo)
        let otherRepo = Source(kind: "github_repo", url: "https://github.com/x/y", title: "x/y")
        world.context.insert(otherRepo)
        _ = reading(world, "Other repo's doc", themes: [world.vllm, world.rag], source: otherRepo)
        _ = reading(world, "Off topic", themes: [world.vllm, world.rag], stage: .triagedOut)
        _ = reading(world, "Reading", themes: [world.vllm, world.rag])

        XCTAssertEqual(try titles(world), ["Reading"])
    }

    @MainActor
    func testANamedPinnedToolCountsBeforeExtractionAndOnlyOnceAfter() throws {
        let world = try makeWorld()
        _ = reading(world, "vLLM 0.9 released", summary: "Faster scheduling", stage: .embedded)
        _ = reading(world, "Serving with vLLM", themes: [world.vllm], summary: "How vLLM batches requests")
        _ = reading(world, "vllmx rewrite", stage: .embedded)

        let matches = try ProjectArticles.matches(for: world.project, context: world.context, now: now)
        let byTitle = Dictionary(uniqueKeysWithValues: matches.map { ($0.article.title, $0) })
        XCTAssertEqual(byTitle["vLLM 0.9 released"]?.reasons, ["Mentions vLLM"])
        XCTAssertEqual(byTitle["Serving with vLLM"]?.reasons, ["Covers vLLM"],
                       "extraction already found it, so it isn't listed twice")
        XCTAssertNil(byTitle["vllmx rewrite"], "only the whole word counts")
    }

    @MainActor
    func testOldArticlesFallOutOfTheLookbackAndTheListIsLimited() throws {
        let world = try makeWorld()
        let old = ProjectArticles.lookback / 86_400 + 5
        _ = reading(world, "Old", themes: [world.vllm], daysAgo: old)
        for index in 1...4 {
            _ = reading(world, "New \(index)", themes: [world.vllm], daysAgo: Double(index))
        }

        XCTAssertEqual(try titles(world), ["New 1", "New 2", "New 3", "New 4"],
                       "equal scores fall back to newest first")
        XCTAssertEqual(try titles(world, limit: 2), ["New 1", "New 2"])
    }

    @MainActor
    func testAProjectWithNothingLinkedListsNothing() throws {
        let context = try KnowledgeSchema.makeContainer(inMemory: true).mainContext
        let project = Project(name: "Empty")
        let feed = Source(kind: "rss", url: "https://blog.example/feed")
        context.insert(project)
        context.insert(feed)
        let article = Article(canonicalURL: "https://blog.example/a", title: "Anything")
        article.source = feed
        article.stage = .linked
        context.insert(article)
        try context.save()

        XCTAssertTrue(try ProjectArticles.matches(for: project, context: context, now: now).isEmpty)
    }
}
