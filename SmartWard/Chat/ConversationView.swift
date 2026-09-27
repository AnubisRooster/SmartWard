import SwiftUI
import SwiftData
import KnowledgeStore
import Pipeline

struct ConversationView: View {
    let conversation: Conversation

    @Environment(\.modelContext) private var context
    @State private var controller = ChatController()
    @FocusState private var composerFocused: Bool

    private var messages: [Message] {
        (conversation.messages ?? []).sorted { $0.createdAt < $1.createdAt }
    }

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 12) {
                    ForEach(messages) { message in
                        VStack(alignment: .leading, spacing: 6) {
                            MessageRow(role: message.role, text: message.content)
                            if let sources = SourcesList.passages(from: message.referencesJSON), !sources.isEmpty {
                                SourcesList(passages: sources)
                            }
                        }
                        .id(message.id)
                    }
                    if controller.isRunning {
                        ForEach(controller.activity, id: \.self) { line in
                            MessageRow(role: "tool", text: line)
                        }
                        MessageRow(role: "assistant",
                                   text: controller.streamingText.isEmpty ? "…" : controller.streamingText)
                            .id("streaming")
                    }
                    if let error = controller.errorMessage {
                        Label(error, systemImage: "exclamationmark.triangle")
                            .font(.footnote)
                            .foregroundStyle(.red)
                    }
                }
                .padding()
            }
            .onChange(of: controller.streamingText) { _, _ in
                proxy.scrollTo("streaming", anchor: .bottom)
            }
            .onChange(of: messages.count) { _, _ in
                if let last = messages.last { proxy.scrollTo(last.id, anchor: .bottom) }
            }
        }
        .safeAreaInset(edge: .bottom) { composer }
        .navigationTitle(conversation.title.isEmpty ? "New chat" : conversation.title)
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(for: Article.self) { article in
            ArticleReaderView(article: article)
        }
    }

    private var composer: some View {
        HStack(alignment: .bottom, spacing: 8) {
            TextField("Message", text: $controller.draft, axis: .vertical)
                .lineLimit(1...6)
                .textFieldStyle(.roundedBorder)
                .focused($composerFocused)
            Button {
                Task { await controller.send(in: conversation, context: context) }
            } label: {
                Image(systemName: "arrow.up.circle.fill").font(.title2)
            }
            .disabled(controller.isRunning || controller.draft.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            .accessibilityLabel("Send")
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(.bar)
    }
}

private struct MessageRow: View {
    let role: String
    let text: String

    var body: some View {
        switch role {
        case "user":
            HStack {
                Spacer(minLength: 40)
                Text(text)
                    .padding(10)
                    .background(Color.accentColor.opacity(0.15), in: RoundedRectangle(cornerRadius: 12))
            }
        case "tool":
            Label(text, systemImage: "wrench.and.screwdriver")
                .font(.caption)
                .foregroundStyle(.secondary)
        default:
            Text(LocalizedStringKey(text))
                .textSelection(.enabled)
        }
    }
}

/// The library passages a reply was given, and why each was retrieved (FR-11).
struct SourcesList: View {
    let passages: [RetrievedPassage]

    @Environment(\.modelContext) private var context

    static func passages(from json: String?) -> [RetrievedPassage]? {
        guard let json, let data = json.data(using: .utf8) else { return nil }
        return try? JSONDecoder().decode([RetrievedPassage].self, from: data)
    }

    var body: some View {
        DisclosureGroup {
            VStack(alignment: .leading, spacing: 8) {
                ForEach(passages) { passage in
                    if let article = linkedArticle(for: passage) {
                        NavigationLink(value: article) { row(passage) }
                            .buttonStyle(.plain)
                    } else {
                        row(passage)
                    }
                }
            }
            .padding(.top, 4)
        } label: {
            Label("Sources (\(passages.count))", systemImage: "books.vertical")
                .font(.caption)
        }
        .foregroundStyle(.secondary)
    }

    private func row(_ passage: RetrievedPassage) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("[\(passage.id)] \(passage.title)")
                .font(.caption.weight(.medium))
                .foregroundStyle(.primary)
                .lineLimit(2)
            Label(passage.why.description,
                  systemImage: passage.why.isGraphHop ? "point.3.connected.trianglepath.dotted" : "text.magnifyingglass")
                .font(.caption2)
        }
    }

    private func linkedArticle(for passage: RetrievedPassage) -> Article? {
        guard let id = passage.articleID else { return nil }
        return try? context.fetch(FetchDescriptor<Article>(predicate: #Predicate { $0.id == id })).first
    }
}
