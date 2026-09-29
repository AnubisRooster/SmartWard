import SwiftUI
import SwiftData
import KnowledgeStore
import Pipeline

/// The five-question summary at the top of an article: what it's about,
/// what it says, what supports it, why it matters, what to remember. Each
/// answer is one or two bullets of at most two lines.
struct ArticleSummaryCard: View {
    let article: Article

    @Environment(\.modelContext) private var context
    @State private var controller = ArticleSummaryController.shared

    private var state: ArticleSummaryController.State? { controller.states[article.id] }

    var body: some View {
        let summary = ArticleSummarizer.cached(for: article)
        VStack(alignment: .leading, spacing: 12) {
            Label("Summary", systemImage: "list.bullet.rectangle")
                .font(.subheadline.weight(.semibold))
            if let summary {
                ForEach(ArticleSummary.Question.allCases, id: \.self) { question in
                    section(question, bullets: summary.bullets(for: question))
                }
                footer(summary)
            } else {
                status
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.quaternary, in: RoundedRectangle(cornerRadius: 12))
        .accessibilityElement(children: .contain)
    }

    @ViewBuilder
    private func section(_ question: ArticleSummary.Question, bullets: [String]) -> some View {
        if !bullets.isEmpty {
            VStack(alignment: .leading, spacing: 4) {
                Text(question.title)
                    .font(.footnote.weight(.semibold))
                    .foregroundStyle(.secondary)
                ForEach(Array(bullets.enumerated()), id: \.offset) { _, bullet in
                    HStack(alignment: .firstTextBaseline, spacing: 6) {
                        Text("•")
                        Text(verbatim: bullet)
                            .lineLimit(2)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .font(.subheadline)
                }
            }
        }
    }

    private func footer(_ summary: ArticleSummary) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text([summary.writtenBy, summary.partial ? "from the first part of a long article" : nil]
                    .compactMap { $0 }.joined(separator: " · "))
                    .font(.caption2)
                    .foregroundStyle(.secondary)
                Spacer(minLength: 8)
                if state == .generating {
                    ProgressView()
                } else {
                    Button("Summarize again", systemImage: "arrow.clockwise") { regenerate() }
                        .labelStyle(.iconOnly)
                        .font(.caption)
                }
            }
            // A failed "summarize again" keeps the earlier summary; say so.
            if case .failed(let message)? = state {
                Text(message)
                    .font(.caption2)
                    .foregroundStyle(.red)
            }
        }
    }

    @ViewBuilder
    private var status: some View {
        if state == .tooShort {
            Label("Load the full article to get a summary.", systemImage: "doc.text.magnifyingglass")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        } else if state == .unavailable {
            Text("Summaries need Apple Intelligence, or a provider key in Settings. Private items only ever use Apple Intelligence.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        } else if case .failed(let message)? = state {
            VStack(alignment: .leading, spacing: 8) {
                Text(message)
                    .font(.subheadline)
                    .foregroundStyle(.red)
                Button("Try again", systemImage: "arrow.clockwise") { regenerate() }
                    .buttonStyle(.bordered)
            }
        } else {
            ProgressView("Summarizing…")
                .font(.subheadline)
        }
    }

    private func regenerate() {
        Task { await controller.ensure(article, context: context, force: true) }
    }
}
