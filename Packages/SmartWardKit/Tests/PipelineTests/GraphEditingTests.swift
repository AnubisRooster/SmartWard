import XCTest
import SwiftData
import KnowledgeStore
@testable import Pipeline

final class GraphEditingTests: XCTestCase {
    private let now = Date(timeIntervalSince1970: 1_800_000_000)

    @MainActor
    private func mention(_ node: ThemeNode, in chunk: KnowledgeStore.Chunk, at date: Date) {
        let mention = Mention(confidence: 1, createdAt: date)
        mention.node = node
        chunk.mentions?.append(mention)
    }

    @MainActor
    func testMergeMovesEverythingAndTheResolverRemembers() async throws {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        let context = container.mainContext
        let article = Article(canonicalURL: "https://x.example/1", title: "A", cleanedText: "Llama three and Llama 3")
        context.insert(article)
        let chunk = KnowledgeStore.Chunk(text: "Llama three and Llama 3 and vLLM")
        article.chunks?.append(chunk)

        let dup = ThemeNode(type: "model", canonicalLabel: "Llama three")
        let llama = ThemeNode(type: "model", canonicalLabel: "Llama 3")
        let vllm = ThemeNode(type: "tool", canonicalLabel: "vLLM")
        for node in [dup, llama, vllm] { context.insert(node) }
        dup.aliases?.append(EntityAlias(alias: "llama-three", origin: "auto"))
        mention(dup, in: chunk, at: now)
        mention(llama, in: chunk, at: now)
        mention(vllm, in: chunk, at: now)
        context.insert(ThemeEdge(sourceNodeID: vllm.id, targetNodeID: dup.id, type: "USES", evidenceChunkID: chunk.id))
        context.insert(ThemeEdge(sourceNodeID: dup.id, targetNodeID: llama.id, type: "RELATES_TO", evidenceChunkID: chunk.id))
        let project = Project(name: "P")
        context.insert(project)
        project.pinnedNodes?.append(dup)
        context.insert(MergeSuggestion(nodeID: dup.id, candidateID: llama.id, similarity: 0.85))
        let unrelated = MergeSuggestion(nodeID: dup.id, candidateID: vllm.id, similarity: 0.83)
        context.insert(unrelated)
        try context.save()

        try GraphEditing.merge(dup, into: llama, context: context)
        try context.save()

        XCTAssertEqual(try context.fetchCount(FetchDescriptor<ThemeNode>()), 2)
        XCTAssertEqual(llama.mentions?.count, 2, "the duplicate's mention moved")
        let edges = try context.fetch(FetchDescriptor<ThemeEdge>())
        XCTAssertEqual(edges.count, 1, "the edge between the two became a self-loop and was dropped")
        XCTAssertEqual(edges.first?.targetNodeID, llama.id)
        XCTAssertEqual((llama.aliases ?? []).filter { $0.origin == "user" }.map(\.alias), ["Llama three"],
                       "one user alias per distinct name")
        XCTAssertTrue((project.pinnedNodes ?? []).contains { $0.id == llama.id })
        let suggestions = try context.fetch(FetchDescriptor<MergeSuggestion>())
        XCTAssertEqual(suggestions.map(\.status), ["merged"], "the other suggestion about the deleted node is gone")

        let resolver = try EntityResolver(context: context, embedder: nil)
        let resolved = await resolver.resolve(name: "Llama Three", type: "model")
        XCTAssertEqual(resolved.node.id, llama.id, "extraction maps the merged name to the survivor")
    }

    @MainActor
    func testSplitCreatesANodeThatStaysSplit() async throws {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        let context = container.mainContext
        let article = Article(canonicalURL: "https://x.example/1", title: "A")
        context.insert(article)
        let onlyMini = KnowledgeStore.Chunk(text: "gpt-4o mini is cheap", ordinal: 0)
        let both = KnowledgeStore.Chunk(text: "GPT-4o beats gpt-4o mini", ordinal: 1)
        article.chunks?.append(contentsOf: [onlyMini, both])
        let gpt = ThemeNode(type: "model", canonicalLabel: "GPT-4o")
        context.insert(gpt)
        let alias = EntityAlias(alias: "gpt-4o mini", origin: "auto")
        gpt.aliases?.append(alias)
        mention(gpt, in: onlyMini, at: now)
        mention(gpt, in: both, at: now)
        try context.save()

        let mini = GraphEditing.split(alias, from: gpt, context: context)
        try context.save()

        XCTAssertEqual(mini.canonicalLabel, "gpt-4o mini")
        XCTAssertEqual(mini.mentions?.count, 1, "only the chunk that names just the alias moves")
        XCTAssertEqual(gpt.mentions?.count, 1)
        XCTAssertTrue((gpt.aliases ?? []).isEmpty)

        let resolver = try EntityResolver(context: context, embedder: nil)
        let resolved = await resolver.resolve(name: "GPT-4o Mini", type: "model")
        XCTAssertEqual(resolved.node.id, mini.id)
    }

    @MainActor
    func testDismissKeepsThePairSeparate() throws {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        let suggestion = MergeSuggestion(nodeID: UUID(), candidateID: UUID(), similarity: 0.9)
        container.mainContext.insert(suggestion)
        GraphEditing.dismiss(suggestion)
        XCTAssertEqual(suggestion.status, "dismissed")
    }
}

final class GraphSnapshotTests: XCTestCase {
    private let now = Date(timeIntervalSince1970: 1_800_000_000)

    @MainActor
    func testScopesStrengthDormancyAndEdgeWeights() throws {
        let container = try KnowledgeSchema.makeContainer(inMemory: true)
        let context = container.mainContext

        let feed = Source(kind: "rss", url: "https://feed.example")
        context.insert(feed)
        let article = Article(canonicalURL: "https://feed.example/1", title: "A")
        context.insert(article)
        article.source = feed
        let articleChunk = KnowledgeStore.Chunk(text: "a")
        article.chunks?.append(articleChunk)

        let project = Project(name: "P")
        context.insert(project)
        let conversation = Conversation(title: "c")
        project.conversations?.append(conversation)
        let turn = Message(role: "user", content: "t")
        conversation.messages?.append(turn)
        let turnChunk = KnowledgeStore.Chunk(text: "t")
        turn.chunks?.append(turnChunk)

        let vllm = ThemeNode(type: "tool", canonicalLabel: "vLLM")
        let spec = ThemeNode(type: "technique", canonicalLabel: "speculative decoding")
        let old = ThemeNode(type: "concept", canonicalLabel: "Expert systems")
        for node in [vllm, spec, old] { context.insert(node) }
        func mention(_ node: ThemeNode, _ chunk: KnowledgeStore.Chunk, daysAgo: Double) {
            let mention = Mention(confidence: 1, createdAt: now - daysAgo * 86_400)
            mention.node = node
            chunk.mentions?.append(mention)
        }
        mention(vllm, articleChunk, daysAgo: 1)
        mention(vllm, turnChunk, daysAgo: 1)
        mention(spec, articleChunk, daysAgo: 30)
        mention(old, articleChunk, daysAgo: 400)
        for _ in 0..<3 {
            context.insert(ThemeEdge(sourceNodeID: vllm.id, targetNodeID: spec.id, type: "USES"))
        }
        context.insert(ThemeEdge(sourceNodeID: spec.id, targetNodeID: vllm.id, type: "RELATES_TO"))
        context.insert(ThemeEdge(sourceNodeID: vllm.id, targetNodeID: old.id, type: "RELATES_TO"))
        try context.save()

        let all = try GraphSnapshot.build(context: context, now: now)
        XCTAssertEqual(all.nodes.map(\.label), ["vLLM", "speculative decoding"], "strongest first; dormant hidden")
        XCTAssertEqual(all.edges.count, 1, "edges to hidden nodes are left out")
        XCTAssertEqual(all.edges.first?.weight, 4, "both directions count as one connection")
        XCTAssertEqual(all.edges.first?.type, "USES")

        let withDormant = try GraphSnapshot.build(context: context, includeDormant: true, now: now)
        XCTAssertEqual(withDormant.nodes.count, 3)

        let recent = try GraphSnapshot.build(context: context, scope: .recent(days: 14), now: now)
        XCTAssertEqual(recent.nodes.map(\.label), ["vLLM"])

        let byProject = try GraphSnapshot.build(context: context, scope: .project(project.id), now: now)
        XCTAssertEqual(byProject.nodes.map(\.label), ["vLLM"], "only themes from the project's conversations")

        let bySource = try GraphSnapshot.build(context: context, scope: .source(feed.id), now: now)
        XCTAssertEqual(Set(bySource.nodes.map(\.label)), ["vLLM", "speculative decoding"])

        let limited = try GraphSnapshot.build(context: context, limit: 1, now: now)
        XCTAssertEqual(limited.nodes.map(\.label), ["vLLM"])
        XCTAssertTrue(limited.edges.isEmpty)
    }

    func testLayoutIsDeterministicInBoundsAndPullsNeighborsTogether() {
        let ids = (0..<6).map { _ in UUID() }
        let nodes = ids.enumerated().map { index, id in
            GraphSnapshot.Node(id: id, label: "n\(index)", type: "concept", strength: 1, mentions: 1)
        }
        let edges = [GraphSnapshot.Edge(source: ids[0], target: ids[1], type: "USES", weight: 5)]
        let snapshot = GraphSnapshot(nodes: nodes, edges: edges)

        let first = ForceLayout.layout(snapshot)
        XCTAssertEqual(first, ForceLayout.layout(snapshot))
        XCTAssertEqual(first.count, 6)
        XCTAssertTrue(first.values.allSatisfy { (0.05...0.95).contains($0.x) && (0.05...0.95).contains($0.y) })

        func distance(_ a: UUID, _ b: UUID) -> Double {
            let p = first[a]!, q = first[b]!
            return ((p.x - q.x) * (p.x - q.x) + (p.y - q.y) * (p.y - q.y)).squareRoot()
        }
        XCTAssertLessThan(distance(ids[0], ids[1]), distance(ids[2], ids[4]))

        XCTAssertEqual(ForceLayout.layout(GraphSnapshot(nodes: [], edges: [])), [:])
        XCTAssertEqual(ForceLayout.layout(GraphSnapshot(nodes: [nodes[0]], edges: [])), [ids[0]: ForceLayout.Point(x: 0.5, y: 0.5)])
    }
}
