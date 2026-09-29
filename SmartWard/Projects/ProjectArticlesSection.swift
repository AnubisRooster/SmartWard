import SwiftUI
import SwiftData
import KnowledgeStore
import Pipeline

/// Reading articles that pertain to the project (`ProjectArticles`), worked
/// out when the card opens. Tapping one opens it in the reader.
struct ProjectArticlesSection: View {
    let project: Project

    @Environment(\.modelContext) private var context
    @State private var matches: [ProjectArticles.Match] = []
    @State private var isLoaded = false
    @State private var showsAll = false

    private static let collapsedCount = 5

    private var shown: [ProjectArticles.Match] {
        showsAll ? matches : Array(matches.prefix(Self.collapsedCount))
    }

    var body: some View {
        Section {
            ForEach(shown) { match in
                NavigationLink(value: match.article) {
                    ProjectArticleRow(match: match)
                }
            }
            if matches.count > Self.collapsedCount {
                Button(showsAll ? "Show fewer" : "Show all \(matches.count)") {
                    showsAll.toggle()
                }
            }
            if isLoaded && matches.isEmpty {
                Text("Nothing from Reading yet. Articles show up here once their themes connect to this project. Pinning themes, linking a repo or chatting about it all help.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        } header: {
            Text("Related reading")
        }
        .task(id: project.id) {
            matches = (try? ProjectArticles.matches(for: project, context: context)) ?? []
            isLoaded = true
        }
    }
}

private struct ProjectArticleRow: View {
    let match: ProjectArticles.Match

    private var article: Article { match.article }

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(article.title)
                .font(.subheadline.weight(article.isRead ? .regular : .semibold))
                .foregroundStyle(article.isRead ? .secondary : .primary)
                .lineLimit(2)
            HStack(spacing: 6) {
                if let source = article.source {
                    Text(source.title.isEmpty ? source.sourceKind.displayName : source.title)
                        .lineLimit(1)
                    Text("·").accessibilityHidden(true)
                }
                Text(article.publishedAt ?? article.ingestedAt, format: .relative(presentation: .named))
            }
            .font(.caption)
            .foregroundStyle(.secondary)
            Text(match.reasons.joined(separator: " · "))
                .font(.caption)
                .foregroundStyle(.secondary)
                .lineLimit(2)
        }
        .padding(.vertical, 2)
        .accessibilityElement(children: .combine)
    }
}
