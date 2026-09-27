import SwiftUI
import SwiftData
import KnowledgeStore

/// Reader view: the article's cleaned text, with a fallback to fetch the full
/// page when the source only carried a teaser.
struct ArticleReaderView: View {
    let article: Article

    @Environment(\.modelContext) private var context
    @State private var ingest = IngestController.shared
    @State private var isLoadingFullText = false
    @State private var fullTextError: String?
    @State private var recordedOpen = false

    private var paragraphs: [String] {
        let text = article.cleanedText.isEmpty ? article.summary : article.cleanedText
        return text.components(separatedBy: "\n\n").filter { !$0.isEmpty }
    }

    private var originalURL: URL? { URL(string: article.canonicalURL) }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(article.title)
                    .font(.title2.bold())
                metadata

                ThemesRow(article: article)

                if !article.relevanceReason.isEmpty {
                    Label(article.relevanceReason, systemImage: "sparkle.magnifyingglass")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }

                if article.stage == .fetched || (article.stage == .triagedOut && article.cleanedText.count < 1_000) {
                    fullTextBanner
                }

                if paragraphs.isEmpty && article.stage != .fetched {
                    Label("Only the headline was saved for this item. Open the original to read it.",
                          systemImage: "doc.text.magnifyingglass")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }

                ForEach(Array(paragraphs.enumerated()), id: \.offset) { _, paragraph in
                    Text(paragraph)
                        .font(.body)
                        .lineSpacing(3)
                }
                .textSelection(.enabled)

                if let originalURL {
                    Link(destination: originalURL) {
                        Label("Open original", systemImage: "safari")
                    }
                    .padding(.top, 8)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .primaryAction) {
                Button(article.isStarred ? "Unstar" : "Star",
                       systemImage: article.isStarred ? "star.fill" : "star") {
                    article.isStarred.toggle()
                    if article.isStarred {
                        context.insert(ReadingSignal(articleID: article.id, kind: "star"))
                    }
                }
                if let originalURL {
                    ShareLink(item: originalURL)
                }
            }
        }
        .task { recordOpen() }
    }

    private var metadata: some View {
        VStack(alignment: .leading, spacing: 2) {
            if let source = article.source {
                Label(source.title.isEmpty ? source.sourceKind.displayName : source.title,
                      systemImage: source.sourceKind.systemImage)
            }
            HStack(spacing: 4) {
                if let byline = article.byline, !byline.isEmpty {
                    Text(byline).lineLimit(1)
                    Text("·")
                }
                Text(article.publishedAt ?? article.ingestedAt, format: .dateTime.day().month().year())
            }
        }
        .font(.subheadline)
        .foregroundStyle(.secondary)
    }

    private var fullTextBanner: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("This source only includes a preview.")
                .font(.subheadline)
            if isLoadingFullText {
                ProgressView("Fetching the article…")
            } else {
                Button("Load full article", systemImage: "arrow.down.doc") {
                    Task { await loadFullText() }
                }
                .buttonStyle(.bordered)
            }
            if let fullTextError {
                Text(fullTextError)
                    .font(.footnote)
                    .foregroundStyle(.red)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.quaternary, in: RoundedRectangle(cornerRadius: 12))
    }

    private func loadFullText() async {
        isLoadingFullText = true
        defer { isLoadingFullText = false }
        do {
            try await ingest.loadFullText(of: article, context: context)
            fullTextError = nil
        } catch {
            fullTextError = error.localizedDescription
        }
    }

    /// Marks the article read and logs one `open` signal per visit; triage
    /// learns from these (PLAN FR-4).
    private func recordOpen() {
        guard !recordedOpen else { return }
        recordedOpen = true
        article.isRead = true
        context.insert(ReadingSignal(articleID: article.id, kind: "open"))
    }
}
