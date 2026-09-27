import SwiftUI
import SwiftData
import KnowledgeStore

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
                        MessageRow(role: message.role, text: message.content)
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
