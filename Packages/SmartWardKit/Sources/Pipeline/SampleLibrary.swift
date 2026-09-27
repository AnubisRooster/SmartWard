import Foundation
import SwiftData
import KnowledgeStore

/// A synthetic library for measuring latency on a device (NFR-4: GraphRAG
/// over ≤100k chunks in under 500 ms). Everything it adds is marked, so it
/// can be removed without touching your own data. Developer builds only.
public enum SampleLibrary {
    public static let origin = "sample"
    public static let marker = "Sample library"

    public struct Size: Sendable, Equatable {
        public var chunks: Int
        public var chunksPerArticle: Int
        public var themes: Int
        public var edges: Int

        public init(chunks: Int, chunksPerArticle: Int = 5, themes: Int, edges: Int) {
            self.chunks = chunks
            self.chunksPerArticle = chunksPerArticle
            self.themes = themes
            self.edges = edges
        }

        /// The NFR-4 target size.
        public static let full = Size(chunks: 100_000, themes: 3_000, edges: 30_000)
    }

    static let vocabulary = [
        "agents", "retrieval", "embedding", "vector", "index", "latency", "throughput", "serving", "inference",
        "quantization", "distillation", "fine-tuning", "LoRA", "evaluation", "benchmark", "SWE-bench", "reasoning",
        "planning", "tool", "calling", "context", "window", "cache", "KV", "attention", "transformer", "decoding",
        "speculative", "batching", "scheduler", "GPU", "memory", "on-device", "privacy", "graph", "knowledge",
        "extraction", "entity", "resolution", "prompt", "injection", "safety", "alignment", "dataset", "synthetic",
        "training", "optimizer", "sparse", "mixture", "experts", "routing", "vLLM", "Llama", "Mistral", "Qwen",
    ]

    /// Adds `size` worth of articles, chunks (with vectors from
    /// `embeddingModelID` of `dimension`), themes, mentions and edges. Rows
    /// are written in batches through fresh contexts, so memory stays flat.
    @MainActor
    public static func load(_ size: Size, embeddingModelID: String?, dimension: Int, container: ModelContainer,
                            seed: UInt64 = 1, now: Date = Date(),
                            progress: (Double) -> Void = { _ in }) async throws {
        var random = SplitMix(seed)
        let setup = ModelContext(container)
        let source = Source(kind: SourceKind.manual.rawValue, url: "sample://library", title: marker, origin: origin)
        setup.insert(source)
        var themeIDs: [UUID] = []
        for index in 0..<size.themes {
            let words = (0..<2).map { _ in vocabulary[Int(random.next() % UInt64(vocabulary.count))] }
            let node = ThemeNode(type: ExtractedGraph.entityTypes[index % ExtractedGraph.entityTypes.count],
                                 canonicalLabel: "\(words.joined(separator: " ")) \(index)")
            node.summary = marker
            node.createdAt = now - Double(index) * 60
            setup.insert(node)
            themeIDs.append(node.id)
        }
        for _ in 0..<size.edges where themeIDs.count > 1 {
            let a = themeIDs[Int(random.next() % UInt64(themeIDs.count))]
            let b = themeIDs[Int(random.next() % UInt64(themeIDs.count))]
            guard a != b else { continue }
            setup.insert(ThemeEdge(sourceNodeID: a, targetNodeID: b, type: "RELATES_TO"))
        }
        try setup.save()
        let sourceID = source.id

        let articleCount = (size.chunks + size.chunksPerArticle - 1) / max(1, size.chunksPerArticle)
        let batch = 400
        var written = 0
        var article = 0
        while article < articleCount {
            let context = ModelContext(container)
            let batchSource = try context.fetch(FetchDescriptor<Source>(predicate: #Predicate { $0.id == sourceID })).first
            let marker = self.marker
            var themes: [UUID: ThemeNode] = [:]
            for node in try context.fetch(FetchDescriptor<ThemeNode>(predicate: #Predicate { $0.summary == marker })) {
                themes[node.id] = node
            }
            let end = min(articleCount, article + batch)
            for index in article..<end {
                let item = Article(canonicalURL: "sample://article/\(index)", title: "Sample article \(index)")
                item.source = batchSource
                item.stage = .linked
                item.ingestedAt = now - Double(index) * 30
                context.insert(item)
                for ordinal in 0..<size.chunksPerArticle where written < size.chunks {
                    let words = (0..<40).map { _ in vocabulary[Int(random.next() % UInt64(vocabulary.count))] }
                    let chunk = KnowledgeStore.Chunk(text: words.joined(separator: " "), ordinal: ordinal)
                    if let embeddingModelID, dimension > 0 {
                        chunk.vector = VectorCoding.data(from: randomVector(dimension, &random))
                        chunk.embeddingModel = embeddingModelID
                    }
                    item.chunks?.append(chunk)
                    for _ in 0..<2 where !themeIDs.isEmpty {
                        let id = themeIDs[Int(random.next() % UInt64(themeIDs.count))]
                        let mention = Mention(confidence: 1, createdAt: item.ingestedAt)
                        mention.node = themes[id]
                        chunk.mentions?.append(mention)
                    }
                    written += 1
                }
            }
            try context.save()
            article = end
            progress(Double(written) / Double(max(1, size.chunks)))
            await Task.yield()
        }
    }

    /// Deletes everything `load` added; your own data is untouched.
    /// - Returns: how many sample articles were removed.
    @MainActor
    @discardableResult
    public static func remove(container: ModelContainer) async throws -> Int {
        var removed = 0
        let origin = self.origin
        while true {
            let context = ModelContext(container)
            var descriptor = FetchDescriptor<Article>(predicate: #Predicate { $0.source?.origin == origin })
            descriptor.fetchLimit = 400
            let articles = try context.fetch(descriptor)
            guard !articles.isEmpty else { break }
            for article in articles { context.delete(article) }
            try context.save()
            removed += articles.count
            await Task.yield()
        }

        let context = ModelContext(container)
        let marker = self.marker
        let themes = try context.fetch(FetchDescriptor<ThemeNode>(predicate: #Predicate { $0.summary == marker }))
        let ids = themes.map(\.id)
        for edge in try context.fetch(FetchDescriptor<ThemeEdge>(predicate: #Predicate {
            ids.contains($0.sourceNodeID) || ids.contains($0.targetNodeID)
        })) {
            context.delete(edge)
        }
        for theme in themes { context.delete(theme) }
        for source in try context.fetch(FetchDescriptor<Source>(predicate: #Predicate { $0.origin == origin })) {
            context.delete(source)
        }
        try context.save()
        return removed
    }

    @MainActor
    public static func isLoaded(context: ModelContext) -> Bool {
        let origin = self.origin
        return ((try? context.fetchCount(FetchDescriptor<Source>(predicate: #Predicate { $0.origin == origin }))) ?? 0) > 0
    }

    static func randomVector(_ dimension: Int, _ random: inout SplitMix) -> [Float] {
        (0..<dimension).map { _ in Float(Int64(random.next() % 20_001) - 10_000) / 10_000 }
    }

    /// Repeatable pseudo-random numbers.
    struct SplitMix {
        private var state: UInt64
        init(_ seed: UInt64) { state = seed }
        mutating func next() -> UInt64 {
            state &+= 0x9E37_79B9_7F4A_7C15
            var z = state
            z = (z ^ (z >> 30)) &* 0xBF58_476D_1CE4_E5B9
            z = (z ^ (z >> 27)) &* 0x94D0_49BB_1331_11EB
            return z ^ (z >> 31)
        }
    }
}
