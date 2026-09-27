import XCTest
import SwiftData
import KnowledgeStore
import ShareInbox
@testable import IngestKit

final class SharedInboxTests: XCTestCase {
    private var directory: URL!

    override func setUpWithError() throws {
        directory = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString)
    }

    override func tearDownWithError() throws {
        try? FileManager.default.removeItem(at: directory)
    }

    func testItemsRoundTripOldestFirstAndCanBeRemoved() throws {
        let inbox = SharedInbox(directory: directory)
        XCTAssertEqual(inbox.pending(), [], "a missing folder is an empty inbox")

        let later = SharedItem(url: "https://b.example", createdAt: Date(timeIntervalSince1970: 200))
        let earlier = SharedItem(text: "a quote", projectID: UUID(), createdAt: Date(timeIntervalSince1970: 100))
        try inbox.write(later)
        try inbox.write(earlier)
        try Data("garbage".utf8).write(to: directory.appendingPathComponent("Items/bad.json"))

        XCTAssertEqual(inbox.pending(), [earlier, later])
        inbox.remove(earlier.id)
        XCTAssertEqual(inbox.pending(), [later])
    }

    func testProjectsSnapshot() throws {
        let inbox = SharedInbox(directory: directory)
        XCTAssertEqual(inbox.projects(), [])
        let projects = [SharedProject(id: UUID(), name: "SmartWard")]
        try inbox.writeProjects(projects)
        XCTAssertEqual(inbox.projects(), projects)
    }
}

final class SharedImportTests: XCTestCase {
    private let now = Date(timeIntervalSince1970: 1_800_000_000)

    @MainActor
    func testImportsLinksAndTextUnderOneSharedSource() throws {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        let context = container.mainContext
        let projectID = UUID()
        let items = [
            SharedItem(url: "https://blog.example/post?utm_source=share", title: "A post", projectID: projectID),
            SharedItem(text: "Hidden\u{200B}text is removed.\n\nSecond paragraph."),
            SharedItem(url: "not a url"),
        ]
        let result = try SharedImport.importItems(items, context: context, now: now)
        XCTAssertEqual(result, SharedImport.Result(added: 2))

        let sources = try context.fetch(FetchDescriptor<Source>())
        XCTAssertEqual(sources.map(\.sourceKind), [.manual])
        XCTAssertEqual(sources.first?.title, SharedImport.sourceTitle)

        let articles = try context.fetch(FetchDescriptor<Article>())
        let link = try XCTUnwrap(articles.first { $0.canonicalURL == "https://blog.example/post" })
        XCTAssertEqual(link.title, "A post")
        XCTAssertEqual(link.stage, .fetched, "the pipeline fetches its full text")
        XCTAssertEqual(link.projectID, projectID)

        let note = try XCTUnwrap(articles.first { $0.canonicalURL.hasPrefix("smartward://shared/") })
        XCTAssertEqual(note.cleanedText, "Hiddentext is removed.\n\nSecond paragraph.")
        XCTAssertEqual(note.stage, .cleaned)
    }

    @MainActor
    func testSharingAnExistingArticleResurfacesIt() throws {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        let context = container.mainContext
        let existing = Article(canonicalURL: "https://blog.example/post", title: "Post")
        existing.isRead = true
        existing.stage = .triagedOut
        context.insert(existing)
        try context.save()

        let result = try SharedImport.importItems([SharedItem(url: "https://blog.example/post#top")],
                                                  context: context, now: now)
        XCTAssertEqual(result, SharedImport.Result(resurfaced: 1))
        XCTAssertFalse(existing.isRead)
        XCTAssertEqual(existing.stage, .triaged, "you chose it: straight to indexing")
        XCTAssertEqual(existing.relevanceReason, "You shared this")
        XCTAssertEqual(try context.fetchCount(FetchDescriptor<Article>()), 1)

        // The same shared source is reused.
        try SharedImport.importItems([SharedItem(url: "https://c.example/x")], context: context, now: now)
        try SharedImport.importItems([SharedItem(url: "https://d.example/y")], context: context, now: now)
        XCTAssertEqual(try context.fetchCount(FetchDescriptor<Source>()), 1)
    }
}
