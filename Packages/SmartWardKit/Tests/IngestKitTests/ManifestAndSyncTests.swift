import XCTest
import SwiftData
import KnowledgeStore
@testable import IngestKit

final class ManifestParserTests: XCTestCase {

    func testSwiftPackage() {
        let text = """
        dependencies: [
            .package(url: "https://github.com/AnubisRooster/OnDeviceKit", branch: "main"),
            .package(name: "X", url: "git@github.com:apple/swift-collections.git", from: "1.0.0"),
            .package(path: "../Local"),
        ]
        """
        XCTAssertEqual(ManifestParser.dependencies(path: "Package.swift", text: text), [
            Dependency(name: "OnDeviceKit", ecosystem: "swift", githubRepo: "AnubisRooster/OnDeviceKit"),
            Dependency(name: "swift-collections", ecosystem: "swift", githubRepo: "apple/swift-collections"),
        ])
    }

    func testPackageJSON() {
        let text = #"{"dependencies":{"react":"^19.0.0","tool":"github:acme/tool#v2"},"devDependencies":{"jest":"^30"}}"#
        XCTAssertEqual(ManifestParser.dependencies(path: "web/package.json", text: text), [
            Dependency(name: "react", ecosystem: "npm"),
            Dependency(name: "tool", ecosystem: "npm", githubRepo: "acme/tool"),
        ])
        XCTAssertEqual(ManifestParser.dependencies(path: "package.json", text: "not json"), [])
    }

    func testPython() {
        let requirements = """
        # comment
        fastapi>=0.110
        httpx[http2]==0.27.0 ; python_version >= "3.10"
        -r dev.txt
        git+https://github.com/acme/thing.git
        """
        XCTAssertEqual(ManifestParser.dependencies(path: "requirements.txt", text: requirements).map(\.name),
                       ["fastapi", "httpx"])

        let pyproject = """
        [project]
        name = "app"
        dependencies = [
            "sqlalchemy>=2",
            'pydantic~=2.7',
        ]

        [tool.poetry.dependencies]
        python = "^3.12"
        langgraph = "^0.2"
        """
        XCTAssertEqual(ManifestParser.dependencies(path: "pyproject.toml", text: pyproject).map(\.name),
                       ["sqlalchemy", "pydantic", "langgraph"])
    }

    func testCargoAndGo() {
        let cargo = """
        [package]
        name = "x"

        [dependencies]
        serde = { version = "1", features = ["derive"] }
        mylib = { git = "https://github.com/acme/mylib" }

        [dev-dependencies]
        criterion = "0.5"
        """
        XCTAssertEqual(ManifestParser.dependencies(path: "Cargo.toml", text: cargo), [
            Dependency(name: "serde", ecosystem: "rust"),
            Dependency(name: "mylib", ecosystem: "rust", githubRepo: "acme/mylib"),
        ])

        let gomod = """
        module example.com/app

        require github.com/spf13/cobra v1.8.0

        require (
        \tgolang.org/x/sync v0.7.0
        \tgithub.com/stretchr/testify v1.9.0 // indirect
        )
        """
        XCTAssertEqual(ManifestParser.dependencies(path: "go.mod", text: gomod), [
            Dependency(name: "github.com/spf13/cobra", ecosystem: "go", githubRepo: "spf13/cobra"),
            Dependency(name: "golang.org/x/sync", ecosystem: "go"),
            Dependency(name: "github.com/stretchr/testify", ecosystem: "go", githubRepo: "stretchr/testify"),
        ])
    }

    func testUnknownFilesAndDuplicates() {
        XCTAssertEqual(ManifestParser.dependencies(path: "Gemfile", text: "gem 'rails'"), [])
        XCTAssertEqual(ManifestParser.dependencies(path: "requirements.txt", text: "numpy\nNumPy\n").count, 1)
    }
}

final class RepoSyncTests: XCTestCase {

    private func repoJSON(private isPrivate: Bool) -> String {
        #"{"full_name":"me/app","private":\#(isPrivate),"default_branch":"main","html_url":"https://github.com/me/app"}"#
    }

    func testFetchReadsOnlyExistingTrackedFiles() async throws {
        let json = repoJSON(private: false)
        let transport = FakeTransport { request in
            switch request.url?.path ?? "" {
            case "/repos/me/app":
                return (200, ["ETag": "\"e1\""], json)
            case "/repos/me/app/git/trees/main":
                return (200, [:], #"{"tree":[{"path":"CLAUDE.md","type":"blob"},{"path":"Package.swift","type":"blob"}],"truncated":false}"#)
            case "/repos/me/app/readme":
                return (200, [:], "# App")
            case "/repos/me/app/contents/CLAUDE.md":
                return (200, [:], "Rules")
            case "/repos/me/app/contents/Package.swift":
                return (200, [:], #".package(url: "https://github.com/acme/kit", from: "1.0.0")"#)
            default:
                return (404, [:], "{}")
            }
        }
        let snapshot = try await RepoSync.fetch("me/app", etag: nil, client: GitHubClient(transport: transport))

        XCTAssertEqual(snapshot?.etag, "\"e1\"")
        XCTAssertEqual(snapshot?.documents.map(\.path), ["README.md", "CLAUDE.md"])
        XCTAssertEqual(snapshot?.dependencies, [Dependency(name: "kit", ecosystem: "swift", githubRepo: "acme/kit")])
        XCTAssertFalse(transport.requests.contains { $0.url?.path == "/repos/me/app/contents/AGENTS.md" },
                       "files missing from the tree are never requested")
        XCTAssertTrue(transport.requests.allSatisfy { $0.httpMethod == "GET" })
    }

    func testFetchUnchangedRepoIsOneRequest() async throws {
        let transport = FakeTransport { _ in (304, [:], "") }
        let snapshot = try await RepoSync.fetch("me/app", etag: "\"e1\"", client: GitHubClient(transport: transport))
        XCTAssertNil(snapshot)
        XCTAssertEqual(transport.requests.count, 1)
    }

    @MainActor
    func testApplyCreatesUpdatesAndRemovesArticles() throws {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        let context = container.mainContext
        let project = Project(name: "App")
        context.insert(project)
        let link = ProjectLink(kind: .githubRepo, url: "https://github.com/me/app", repoFullName: "me/app")
        project.links?.append(link)

        let repo = GitHubRepo(fullName: "me/app")
        let deps = [Dependency(name: "kit", ecosystem: "swift", githubRepo: "acme/kit"),
                    Dependency(name: "react", ecosystem: "npm")]
        let first = RepoSnapshot(repo: repo, etag: "\"e1\"",
                                 documents: [.init(path: "README.md", text: "v1"), .init(path: "CLAUDE.md", text: "rules")],
                                 dependencies: deps)
        let r1 = try RepoSync.apply(first, to: link, context: context)
        XCTAssertEqual(r1, .init(articlesAdded: 2, dependenciesPinned: 2, sourcesSuggested: 1))
        XCTAssertEqual(link.etag, "\"e1\"")
        XCTAssertNotNil(link.sourceID)
        XCTAssertEqual(Set((project.pinnedNodes ?? []).map(\.canonicalLabel)), ["kit", "react"])

        let suggestion = try XCTUnwrap(try context.fetch(FetchDescriptor<Source>()).first { $0.kind == "github_releases" })
        XCTAssertEqual(suggestion.url, "https://github.com/acme/kit/releases.atom")
        XCTAssertFalse(suggestion.isEnabled, "dependency sources are suggestions until enabled")
        XCTAssertEqual(suggestion.origin, "dependency_radar")

        // Same content: nothing changes. README edited, CLAUDE.md deleted.
        let unchanged = try RepoSync.apply(first, to: link, context: context)
        XCTAssertEqual(unchanged, .init())
        let second = RepoSnapshot(repo: repo, etag: "\"e2\"", documents: [.init(path: "README.md", text: "v2")], dependencies: deps)
        let r2 = try RepoSync.apply(second, to: link, context: context)
        XCTAssertEqual(r2, .init(articlesUpdated: 1, articlesRemoved: 1))

        let articles = try context.fetch(FetchDescriptor<Article>())
        XCTAssertEqual(articles.map(\.cleanedText), ["v2"])
        XCTAssertEqual(articles.first?.canonicalURL, "https://github.com/me/app/blob/main/README.md")
        XCTAssertEqual(try context.fetchCount(FetchDescriptor<ThemeNode>()), 2, "nodes are reused, not duplicated")
    }

    @MainActor
    func testPrivateRepoContentIsLocalOnly() throws {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        let context = container.mainContext
        let project = Project(name: "Secret")
        context.insert(project)
        let link = ProjectLink(kind: .githubRepo, url: "https://github.com/me/secret", repoFullName: "me/secret")
        project.links?.append(link)

        let snapshot = RepoSnapshot(repo: GitHubRepo(fullName: "me/secret", isPrivate: true), etag: nil,
                                    documents: [.init(path: "README.md", text: "internal")], dependencies: [])
        try RepoSync.apply(snapshot, to: link, context: context)

        XCTAssertTrue(link.isPrivate)
        XCTAssertFalse(link.sendsContentToBYOK)
        let article = try XCTUnwrap(try context.fetch(FetchDescriptor<Article>()).first)
        XCTAssertTrue(article.localOnly)
        let chunk = Chunk(text: "internal")
        article.chunks?.append(chunk)
        try context.save()
        XCTAssertFalse(ContextPolicy.mayLeaveDevice(chunk), "D5: private repo content never reaches a provider")
    }
}
