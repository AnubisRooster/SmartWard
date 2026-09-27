import SwiftUI
import SwiftData
import IngestKit
import KnowledgeStore

/// Followed, suggested and paused sources. Suggestions come from onboarding
/// and from linked repos' dependencies (the dependency radar); nothing is
/// fetched until you follow it.
struct SourcesView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @Query(sort: \Source.title) private var sources: [Source]
    @State private var ingest = IngestController.shared
    @State private var isAdding = false

    private var listed: [Source] { sources.filter { $0.sourceKind.isPolled } }
    private var following: [Source] { listed.filter(\.isEnabled) }
    private var suggested: [Source] { listed.filter { !$0.isEnabled && $0.origin != "manual" } }
    private var paused: [Source] { listed.filter { !$0.isEnabled && $0.origin == "manual" } }

    var body: some View {
        NavigationStack {
            List {
                Section("Following") {
                    ForEach(following) { source in
                        NavigationLink(value: source) { SourceRow(source: source) }
                    }
                    .onDelete { delete(following, at: $0) }
                }
                if !suggested.isEmpty {
                    Section {
                        ForEach(suggested) { source in
                            HStack {
                                SourceRow(source: source)
                                Spacer()
                                Button("Follow") { follow(source) }
                                    .buttonStyle(.bordered)
                            }
                        }
                        .onDelete { delete(suggested, at: $0) }
                    } header: {
                        Text("Suggested")
                    } footer: {
                        Text("From your setup interview and the dependencies of your linked repos.")
                    }
                }
                if !paused.isEmpty {
                    Section("Paused") {
                        ForEach(paused) { source in
                            NavigationLink(value: source) { SourceRow(source: source) }
                        }
                        .onDelete { delete(paused, at: $0) }
                    }
                }
            }
            .overlay {
                if listed.isEmpty {
                    ContentUnavailableView("No sources", systemImage: "dot.radiowaves.up.forward",
                                           description: Text("Tap + to follow a feed, an arXiv category, a Hacker News search or a project's releases."))
                }
            }
            .navigationTitle("Sources")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: Source.self) { source in
                SourceDetailView(source: source)
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Done") { dismiss() }
                }
                ToolbarItem(placement: .primaryAction) {
                    Button("Add source", systemImage: "plus") { isAdding = true }
                }
            }
            .sheet(isPresented: $isAdding) {
                AddSourceView()
            }
        }
    }

    private func follow(_ source: Source) {
        source.isEnabled = true
        Task { await ingest.refresh([source], context: context) }
    }

    private func delete(_ list: [Source], at offsets: IndexSet) {
        for index in offsets {
            context.delete(list[index])
        }
    }
}

struct SourceRow: View {
    let source: Source
    @State private var ingest = IngestController.shared

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Label(source.title.isEmpty ? source.url : source.title, systemImage: source.sourceKind.systemImage)
                .lineLimit(1)
            Group {
                if ingest.refreshingSourceIDs.contains(source.id) {
                    Text("Refreshing…")
                } else if let error = source.lastError {
                    Text(error).foregroundStyle(.red)
                } else if let fetched = source.lastFetchedAt {
                    Text("\(source.sourceKind.displayName) · updated \(fetched, format: .relative(presentation: .named))")
                } else {
                    Text(source.sourceKind.displayName)
                }
            }
            .font(.caption)
            .foregroundStyle(.secondary)
            .lineLimit(2)
        }
    }
}

struct SourceDetailView: View {
    @Bindable var source: Source
    @Environment(\.modelContext) private var context
    @State private var ingest = IngestController.shared

    var body: some View {
        Form {
            Section {
                TextField("Name", text: $source.title)
                LabeledContent("Type", value: source.sourceKind.displayName)
                LabeledContent("Address") {
                    Text(source.url)
                        .textSelection(.enabled)
                        .lineLimit(3)
                }
                Toggle("Follow", isOn: $source.isEnabled)
            }
            Section {
                if let fetched = source.lastFetchedAt {
                    LabeledContent("Last checked") {
                        Text(fetched, format: .relative(presentation: .named))
                    }
                }
                LabeledContent("Articles", value: "\(source.articles?.count ?? 0)")
                if let error = source.lastError {
                    Text(error).foregroundStyle(.red)
                }
                Button {
                    Task { await ingest.refresh([source], context: context) }
                } label: {
                    if ingest.refreshingSourceIDs.contains(source.id) {
                        ProgressView()
                    } else {
                        Text("Refresh now")
                    }
                }
                .disabled(ingest.isRefreshing || !source.isEnabled)
            }
        }
        .navigationTitle(source.title.isEmpty ? "Source" : source.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
