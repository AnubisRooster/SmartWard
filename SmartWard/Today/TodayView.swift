import SwiftUI
import SwiftData
import KnowledgeStore
import Pipeline

/// The daily digest (FR-13): what's new since the last one, by theme, ranked
/// against your projects. Settings live behind the gear.
struct TodayView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \Digest.periodEnd, order: .reverse) private var digests: [Digest]
    @State private var controller = DigestController.shared
    @State private var showSettings = false
    @State private var navigation = AppNavigation.shared

    var body: some View {
        NavigationStack(path: $navigation.todayPath) {
            List {
                if let latest = digests.first {
                    DigestSections(digest: latest)
                    if digests.count > 1 {
                        Section("Earlier") {
                            ForEach(digests.dropFirst().prefix(14)) { digest in
                                NavigationLink(value: digest) {
                                    DigestRow(digest: digest)
                                }
                            }
                        }
                    }
                }
                if let message = controller.message {
                    Text(message).font(.footnote).foregroundStyle(.secondary)
                }
            }
            .overlay {
                if digests.isEmpty {
                    ContentUnavailableView {
                        Label("No digest yet", systemImage: "sun.max")
                    } description: {
                        Text("Once your sources have been read and linked into the graph, new themes are gathered here, ranked by how much they touch your projects.")
                    } actions: {
                        Button("Build digest") { build() }
                            .buttonStyle(.borderedProminent)
                            .disabled(controller.isBuilding)
                    }
                }
            }
            .navigationTitle("Today")
            .navigationDestination(for: Article.self) { article in
                ArticleReaderView(article: article)
            }
            .navigationDestination(for: Digest.self) { digest in
                List { DigestSections(digest: digest) }
                    .navigationTitle(digest.periodEnd.formatted(date: .abbreviated, time: .omitted))
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Settings", systemImage: "gearshape") { showSettings = true }
                }
                ToolbarItem(placement: .primaryAction) {
                    if controller.isBuilding {
                        ProgressView()
                    } else {
                        Button("Build digest", systemImage: "arrow.clockwise") { build() }
                    }
                }
            }
            .sheet(isPresented: $showSettings) { SettingsView() }
            .refreshable { await controller.buildIfDue(context: context, force: true) }
            .task { await controller.buildIfDue(context: context) }
            .onAppear {
                if let latest = digests.first, latest.readAt == nil { latest.readAt = Date() }
            }
        }
    }

    private func build() {
        Task { await controller.buildIfDue(context: context, force: true) }
    }
}

private struct DigestRow: View {
    let digest: Digest

    var body: some View {
        let clusters = digest.clusters
        VStack(alignment: .leading, spacing: 2) {
            Text(digest.periodEnd.formatted(date: .abbreviated, time: .shortened))
            Text(clusters.prefix(3).map(\.title).joined(separator: ", "))
                .font(.caption)
                .foregroundStyle(.secondary)
                .lineLimit(1)
        }
    }
}

/// One digest: a section per theme cluster, best first.
struct DigestSections: View {
    let digest: Digest

    var body: some View {
        let clusters = digest.clusters
        let articles = clusters.reduce(0) { $0 + $1.articleCount }
        Section {
            Text("\(clusters.count) \(clusters.count == 1 ? "theme" : "themes") from \(articles) \(articles == 1 ? "article" : "articles") since \(digest.periodStart.formatted(date: .abbreviated, time: .shortened)).")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        ForEach(clusters) { cluster in
            DigestClusterSection(cluster: cluster)
        }
    }
}

private struct DigestClusterSection: View {
    let cluster: DigestCluster

    @Environment(\.modelContext) private var context

    var body: some View {
        Section {
            VStack(alignment: .leading, spacing: 6) {
                Text(cluster.title.isEmpty ? "New reading" : cluster.title)
                    .font(.headline)
                if !cluster.summary.isEmpty {
                    Text(cluster.summary)
                        .font(.subheadline)
                }
                HStack(spacing: 6) {
                    if cluster.novelty >= 0.5 {
                        Label("New themes", systemImage: "sparkle").foregroundStyle(.orange)
                    }
                    ForEach(cluster.projects.prefix(3), id: \.id) { project in
                        Label(project.name, systemImage: "folder")
                    }
                }
                .font(.caption)
                .labelStyle(.titleAndIcon)
                if cluster.themes.count > 2 {
                    Text("Also: \(cluster.themes.dropFirst(2).prefix(5).joined(separator: ", "))")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
            .padding(.vertical, 2)
            ForEach(cluster.articles, id: \.id) { ref in
                if let article = linkedArticle(ref.id) {
                    NavigationLink(value: article) {
                        Text(ref.title).font(.subheadline).lineLimit(2)
                    }
                } else {
                    Text(ref.title).font(.subheadline).foregroundStyle(.secondary)
                }
            }
        } footer: {
            Text(Self.provenance(cluster))
        }
    }

    private func linkedArticle(_ id: UUID) -> Article? {
        try? context.fetch(FetchDescriptor<Article>(predicate: #Predicate { $0.id == id })).first
    }

    static func provenance(_ cluster: DigestCluster) -> String {
        let more = cluster.articleCount > cluster.articles.count ? " (showing \(cluster.articles.count))" : ""
        let source: String
        switch cluster.summaryTier {
        case "byok": source = "Summarized by your provider."
        case "onDevice": source = "Summarized on-device."
        default: source = "No summary: Apple Intelligence and your provider were unavailable."
        }
        return "\(cluster.articleCount) \(cluster.articleCount == 1 ? "article" : "articles")\(more). \(source)"
    }
}

/// Settings → Digest.
struct DigestSettingsSection: View {
    @AppStorage(DigestController.notifyKey) private var notify = false
    @State private var denied = false

    var body: some View {
        Section {
            Toggle("Notify me when a digest is ready", isOn: $notify)
                .onChange(of: notify) { _, enabled in
                    guard enabled else { return }
                    Task {
                        let allowed = await DigestController.shared.requestPermission()
                        if !allowed {
                            notify = false
                            denied = true
                        }
                    }
                }
        } header: {
            Text("Digest")
        } footer: {
            if denied {
                Text("Notifications are off for SmartWard. Turn them on in the Settings app.")
            } else {
                Text("A digest of new themes is built about once a day after your sources are read. The top three are summarized by your provider while the daily budget allows; the rest on-device.")
            }
        }
    }
}
