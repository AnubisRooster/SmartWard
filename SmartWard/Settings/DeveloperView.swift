import SwiftUI
import SwiftData
import KnowledgeStore
import Pipeline

/// Settings → Developer: a synthetic 100k-chunk library and a latency check
/// for NFR-4 (GraphRAG under 500 ms). Shown in Debug builds, or in Release
/// when the scheme passes `-SmartWardDeveloper YES`, which gives realistic
/// timings.
enum DeveloperSettings {
    static var isEnabled: Bool {
        #if DEBUG
        return true
        #else
        return UserDefaults.standard.bool(forKey: "SmartWardDeveloper")
        #endif
    }
}

struct DeveloperView: View {
    @Environment(\.modelContext) private var context
    @State private var progress: Double?
    @State private var message: String?
    @State private var isChecking = false
    @State private var checkResult: String?
    @State private var refresh = 0

    static let targetMilliseconds = 500.0
    static let questions = [
        "What's new in speculative decoding for serving?", "How do LoRA and quantization compare for fine-tuning?",
        "Which retrieval approaches work best on-device?", "What are the risks of prompt injection in agents?",
        "How does KV cache size affect latency?", "Summarize recent work on mixture of experts routing.",
        "What benchmarks measure reasoning and tool calling?", "How should I evaluate extraction quality?",
        "What changed in vLLM batching?", "Where does attention memory go at long context?",
    ]

    private var sampleLoaded: Bool { SampleLibrary.isLoaded(context: context) }

    var body: some View {
        Form {
            Section {
                if let progress {
                    ProgressView(value: progress) {
                        Text("Loading sample library…")
                    }
                } else if sampleLoaded {
                    Button("Remove sample library", role: .destructive) { remove() }
                } else {
                    Button("Load sample library (100k chunks)") { load() }
                }
                if let message { Text(message).font(.footnote).foregroundStyle(.secondary) }
            } header: {
                Text("Sample library")
            } footer: {
                Text("100,000 chunks with on-device-sized vectors, 3,000 themes and 30,000 connections, all marked as sample data and removable. Loading takes a few minutes and about 250 MB.")
            }

            Section {
                Button {
                    Task { await runLatencyCheck() }
                } label: {
                    HStack {
                        Text("Run latency check")
                        Spacer()
                        if isChecking { ProgressView() }
                    }
                }
                .disabled(isChecking || progress != nil)
                if let checkResult { Text(checkResult).font(.callout.monospacedDigit()) }
            } header: {
                Text("GraphRAG latency (NFR-4)")
            } footer: {
                Text("Asks \(Self.questions.count) questions twice, the way chat does (embedding plus GraphRAG), and reports the median and 95th percentile against the \(Int(Self.targetMilliseconds)) ms target. Use a Release build for real numbers; each run is also a signpost in Instruments → Points of Interest.")
            }

            Section("Recent timings") {
                let names = PerfTrace.names
                if names.isEmpty {
                    Text("Nothing measured yet.").foregroundStyle(.secondary)
                }
                ForEach(names, id: \.self) { name in
                    if let summary = PerfTrace.summary(name) {
                        LabeledContent(name) {
                            Text("p50 \(Self.ms(summary.p50)) · p95 \(Self.ms(summary.p95)) · \(summary.count)×")
                                .font(.caption.monospacedDigit())
                        }
                    }
                }
                Button("Clear timings") {
                    PerfTrace.reset()
                    refresh += 1
                }
            }
            .id(refresh)
        }
        .navigationTitle("Developer")
    }

    static func ms(_ value: Double) -> String {
        value < 10 ? String(format: "%.1f ms", value) : String(format: "%.0f ms", value)
    }

    private func load() {
        guard case .success(let container) = AppStore.container else { return }
        let embedder = SearchController.shared.embedder
        progress = 0
        message = nil
        Task {
            let start = Date()
            do {
                try await SampleLibrary.load(.full, embeddingModelID: embedder?.id,
                                             dimension: embedder?.provider.dimension ?? 0,
                                             container: container) { fraction in
                    progress = fraction
                }
                SearchController.shared.reset()
                message = "Loaded in \(Int(Date().timeIntervalSince(start))) s."
            } catch {
                message = error.localizedDescription
            }
            progress = nil
        }
    }

    private func remove() {
        guard case .success(let container) = AppStore.container else { return }
        progress = 0
        Task {
            do {
                let removed = try await SampleLibrary.remove(container: container)
                SearchController.shared.reset()
                message = "Removed \(removed) sample articles."
            } catch {
                message = error.localizedDescription
            }
            progress = nil
        }
    }

    private func runLatencyCheck() async {
        isChecking = true
        defer { isChecking = false }
        let search = SearchController.shared
        // The first call may build the index; measure that separately.
        let warmup = Date()
        _ = await search.passages(for: "warm up", excludingConversation: nil, context: context)
        let indexSeconds = Date().timeIntervalSince(warmup)

        var times: [Double] = []
        for question in Self.questions + Self.questions {
            let start = DispatchTime.now()
            _ = await search.passages(for: question, excludingConversation: nil, context: context)
            times.append(Double(DispatchTime.now().uptimeNanoseconds - start.uptimeNanoseconds) / 1_000_000)
        }
        times.sort()
        let p50 = times[times.count / 2]
        let p95 = times[min(times.count - 1, Int(Double(times.count) * 0.95))]
        let chunks = (try? context.fetchCount(FetchDescriptor<KnowledgeStore.Chunk>())) ?? 0
        let verdict = p95 < Self.targetMilliseconds ? "✓ under" : "✗ over"
        checkResult = """
        \(chunks.formatted()) chunks · first call \(String(format: "%.1f", indexSeconds)) s
        p50 \(Self.ms(p50)) · p95 \(Self.ms(p95)) · \(verdict) \(Int(Self.targetMilliseconds)) ms
        """
        refresh += 1
    }
}
