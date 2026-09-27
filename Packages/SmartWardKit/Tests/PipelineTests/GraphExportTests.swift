import XCTest
@testable import KnowledgeStore
@testable import Pipeline

final class GraphExportTests: XCTestCase {

    func testGraphMLHasEveryThemeAndCountedEdges() {
        let now = Date(timeIntervalSince1970: 1_800_000_000)
        var archive = LibraryArchive(exportedAt: now, includesPrivate: false, includesEmbeddings: false)
        let vllm = UUID(), spec = UUID(), llama = UUID()
        archive.themeNodes = [
            .init(id: vllm, type: "tool", canonicalLabel: "vLLM", normalizedKey: "vllm", summary: nil, createdAt: now,
                  labelVector: nil, labelVectorModel: ""),
            .init(id: spec, type: "technique", canonicalLabel: "Speculative <decoding> & more", normalizedKey: "spec",
                  summary: nil, createdAt: now, labelVector: nil, labelVectorModel: ""),
            .init(id: llama, type: "model", canonicalLabel: "Llama 3", normalizedKey: "llama3", summary: nil,
                  createdAt: now, labelVector: nil, labelVectorModel: ""),
        ]
        archive.mentions = [.init(id: UUID(), nodeID: vllm, chunkID: nil, confidence: 1, createdAt: now)]
        archive.edges = [
            .init(id: UUID(), sourceNodeID: vllm, targetNodeID: spec, type: "USES", evidenceChunkID: nil, createdAt: now),
            .init(id: UUID(), sourceNodeID: vllm, targetNodeID: spec, type: "USES", evidenceChunkID: nil, createdAt: now),
            .init(id: UUID(), sourceNodeID: spec, targetNodeID: llama, type: "EVALUATED_ON", evidenceChunkID: nil, createdAt: now),
            .init(id: UUID(), sourceNodeID: llama, targetNodeID: llama, type: "RELATES_TO", evidenceChunkID: nil, createdAt: now),
        ]

        let session = GraphExport.session(archive, now: now)
        XCTAssertEqual(session.nodes.count, 3)
        XCTAssertEqual(session.nodes.first { $0.label == "vLLM" }?.strength, 1, "one mention today")
        XCTAssertEqual(session.edges.count, 2, "duplicates counted, self-loops dropped")
        XCTAssertEqual(session.edges.first { $0.type == "USES" }?.weight, 2)

        let graphML = GraphExport.graphML(archive, now: now)
        XCTAssertTrue(graphML.hasPrefix("<?xml"))
        XCTAssertEqual(graphML.components(separatedBy: "<node ").count - 1, 3)
        XCTAssertEqual(graphML.components(separatedBy: "<edge ").count - 1, 2)
        XCTAssertTrue(graphML.contains("Speculative &lt;decoding&gt; &amp; more"), "labels are escaped")
    }
}
