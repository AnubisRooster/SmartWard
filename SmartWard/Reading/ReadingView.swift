import SwiftUI
import SwiftData
import KnowledgeStore

/// Everything fetched from followed sources, newest first. Linked-repo docs
/// are project context, not reading, so they aren't listed here.
struct ReadingView: View {
    enum Filter: String, CaseIterable, Identifiable {
        case unread = "Unread", starred = "Starred", all = "All"
        var id: Self { self }
    }

    enum Order: String, CaseIterable, Identifiable {
        case newest = "Newest", relevant = "Most relevant"
        var id: Self { self }
    }

    @Environment(\.modelContext) private var context
    @Query(sort: \Article.ingestedAt, order: .reverse) private var articles: [Article]
    @Query private var sources: [Source]
    @State private var filter: Filter = .unread
    @AppStorage("reading.order") private var order: Order = .newest
    @State private var showingFiltered = false
    @State private var pipeline = PipelineController.shared
    @State private var ingest = IngestController.shared
    @State private var showingSources = false
    @State private var query = ""

    private var reading: [Article] {
        articles.filter { $0.source?.sourceKind != .githubRepo }
    }

    private var visible: [Article] {
        let filtered = reading.filter { article in
            switch filter {
            case .unread: return !article.isRead && (showingFiltered || article.stage != .triagedOut)
            case .starred: return article.isStarred
            case .all: return true
            }
        }
        guard order == .relevant else { return filtered }
        return filtered.sorted { $0.relevance > $1.relevance }
    }

    /// Unread items triage judged off-topic (FR-4).
    private var filteredOutCount: Int {
        reading.filter { !$0.isRead && $0.stage == .triagedOut }.count
    }

    private var hasFollowedSources: Bool {
        sources.contains { $0.isEnabled && $0.sourceKind.isPolled }
    }

    var body: some View {
        NavigationStack {
            Group {
                if query.isEmpty {
                    readingList
                } else {
                    SearchResultsView(query: query)
                }
            }
            .searchable(text: $query, prompt: "Search your library")
            .navigationTitle("Reading")
            .navigationDestination(for: Article.self) { article in
                ArticleReaderView(article: article)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Sources", systemImage: "dot.radiowaves.up.forward") { showingSources = true }
                }
                ToolbarItem(placement: .secondaryAction) {
                    Picker("Order", selection: $order) {
                        ForEach(Order.allCases) { Text($0.rawValue).tag($0) }
                    }
                }
                ToolbarItem(placement: .primaryAction) {
                    if ingest.isRefreshing || pipeline.isRunning {
                        ProgressView()
                    } else {
                        Button("Refresh", systemImage: "arrow.clockwise") {
                            Task { await ingest.refreshAll(context: context) }
                        }
                        .disabled(!hasFollowedSources)
                    }
                }
            }
            .sheet(isPresented: $showingSources) {
                SourcesView()
            }
        }
    }

    private var readingList: some View {
        List {
            ForEach(visible) { article in
                NavigationLink(value: article) {
                    ArticleRow(article: article)
                }
                .swipeActions(edge: .leading) {
                    Button(article.isRead ? "Unread" : "Read",
                           systemImage: article.isRead ? "circle.fill" : "checkmark.circle") {
                        article.isRead.toggle()
                    }
                    .tint(.blue)
                }
                .swipeActions(edge: .trailing) {
                    Button("Dismiss", systemImage: "xmark") { dismiss(article) }
                        .tint(.gray)
                    Button(article.isStarred ? "Unstar" : "Star",
                           systemImage: article.isStarred ? "star.slash" : "star") { toggleStar(article) }
                        .tint(.yellow)
                }
            }
            if filter == .unread, filteredOutCount > 0 {
                Button {
                    showingFiltered.toggle()
                } label: {
                    Label(showingFiltered ? "Hide off-topic items" : "Show \(filteredOutCount) off-topic items",
                          systemImage: showingFiltered ? "eye.slash" : "line.3.horizontal.decrease.circle")
                        .font(.subheadline)
                }
                .listRowSeparator(.hidden)
            }
            if let reason = pipeline.unavailableReason {
                Label(reason, systemImage: "exclamationmark.triangle")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .listRowSeparator(.hidden)
            }
        }
        .listStyle(.plain)
        .safeAreaInset(edge: .top) {
            Picker("Show", selection: $filter) {
                ForEach(Filter.allCases) { Text($0.rawValue).tag($0) }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            .padding(.bottom, 8)
            .background(.bar)
        }
        .overlay { emptyState }
        .refreshable {
            await ingest.refreshAll(context: context)
        }
    }

    @ViewBuilder
    private var emptyState: some View {
        if visible.isEmpty {
            if !hasFollowedSources {
                ContentUnavailableView {
                    Label("No sources yet", systemImage: "dot.radiowaves.up.forward")
                } description: {
                    Text("Follow feeds, arXiv categories, Hacker News searches or releases of the libraries you use.")
                } actions: {
                    Button("Add sources") { showingSources = true }
                        .buttonStyle(.borderedProminent)
                }
            } else if let summary = ingest.lastSummary, filter == .unread {
                ContentUnavailableView("All caught up", systemImage: "checkmark.circle",
                                       description: Text("Last refresh: \(summary). Pull to refresh."))
            } else {
                ContentUnavailableView("Nothing here", systemImage: "tray",
                                       description: Text("Pull to refresh your sources."))
            }
        }
    }

    private func toggleStar(_ article: Article) {
        article.isStarred.toggle()
        if article.isStarred {
            context.insert(ReadingSignal(articleID: article.id, kind: "star"))
        }
    }

    private func dismiss(_ article: Article) {
        article.isRead = true
        context.insert(ReadingSignal(articleID: article.id, kind: "dismiss"))
    }
}

struct ArticleRow: View {
    let article: Article

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(spacing: 6) {
                if !article.isRead {
                    Circle().fill(.tint).frame(width: 8, height: 8)
                }
                if let source = article.source {
                    Label(source.title.isEmpty ? source.sourceKind.displayName : source.title,
                          systemImage: source.sourceKind.systemImage)
                        .labelStyle(.titleAndIcon)
                        .lineLimit(1)
                }
                Spacer(minLength: 4)
                if article.isStarred {
                    Image(systemName: "star.fill").foregroundStyle(.yellow)
                }
                Text(article.publishedAt ?? article.ingestedAt, format: .relative(presentation: .named))
            }
            .font(.caption)
            .foregroundStyle(.secondary)

            Text(article.title)
                .font(.headline)
                .foregroundStyle(article.isRead ? .secondary : .primary)
                .lineLimit(3)
            if !article.summary.isEmpty {
                Text(article.summary)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
            }
        }
        .padding(.vertical, 2)
    }
}
