import SwiftUI
import SwiftData
import KnowledgeStore

struct ChatListView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \Conversation.updatedAt, order: .reverse) private var conversations: [Conversation]
    @State private var isCreating = false
    @State private var path: [Conversation] = []

    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(conversations) { conversation in
                    NavigationLink(value: conversation) {
                        VStack(alignment: .leading, spacing: 2) {
                            Text(conversation.title.isEmpty ? "New chat" : conversation.title)
                                .font(.headline)
                                .lineLimit(1)
                            Text(subtitle(for: conversation))
                                .font(.caption)
                                .foregroundStyle(.secondary)
                                .lineLimit(1)
                        }
                    }
                }
                .onDelete { offsets in
                    for index in offsets { context.delete(conversations[index]) }
                }
            }
            .overlay {
                if conversations.isEmpty {
                    ContentUnavailableView("No chats yet",
                                           systemImage: "bubble.left.and.bubble.right",
                                           description: Text("Start a chat to brainstorm, critique a plan, or map out research."))
                }
            }
            .navigationTitle("Chat")
            .navigationDestination(for: Conversation.self) { conversation in
                ConversationView(conversation: conversation)
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("New chat", systemImage: "square.and.pencil") { isCreating = true }
                }
            }
            .sheet(isPresented: $isCreating) {
                NewConversationView { created in
                    path.append(created)
                }
            }
        }
    }

    private func subtitle(for conversation: Conversation) -> String {
        var parts = [modeLabel(conversation.mode)]
        if let project = conversation.project { parts.append(project.name) }
        parts.append(conversation.model)
        return parts.joined(separator: " · ")
    }
}

func modeLabel(_ mode: ConversationMode) -> String {
    switch mode {
    case .brainstorm:   return "Brainstorm"
    case .critique:     return "Critique"
    case .researchPlan: return "Research plan"
    case .weeklyReview: return "Weekly review"
    case .onboarding:   return "Onboarding"
    }
}
