import SwiftUI
import SwiftData
import KnowledgeStore
import Pipeline
import BYOKLLMKit
import StrategistCore
import VoiceLoopKit

struct ConversationView: View {
    let conversation: Conversation

    @Environment(\.modelContext) private var context
    @State private var controller = ChatController()
    @StateObject private var voice = VoiceConversationController()
    @AppStorage(ActionTools.autoApproveKey) private var autoApprove = false
    @State private var showingVoiceGate = false
    @FocusState private var composerFocused: Bool

    private var messages: [Message] {
        (conversation.messages ?? []).sorted { $0.createdAt < $1.createdAt }
    }

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 12) {
                    if let warning = missingKeyWarning {
                        Label(warning, systemImage: "key.slash")
                            .font(.footnote)
                            .foregroundStyle(.orange)
                    }
                    if messages.isEmpty && !controller.isRunning {
                        EmptyChatHint(conversation: conversation)
                    }
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
                        if let action = controller.pendingAction {
                            ActionConfirmationCard(action: action) { approved in
                                controller.resolve(approved: approved)
                            }
                            .id("confirmation")
                        }
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
            .onChange(of: controller.pendingAction) { _, action in
                if action != nil { proxy.scrollTo("confirmation", anchor: .bottom) }
            }
            .onChange(of: messages.count) { _, _ in
                if let last = messages.last { proxy.scrollTo(last.id, anchor: .bottom) }
            }
        }
        .safeAreaInset(edge: .bottom) { composer }
        .navigationTitle(conversation.title.isEmpty ? "New chat" : conversation.title)
        .navigationBarTitleDisplayMode(.inline)
        .onDisappear {
            controller.resolve(approved: false)
            voice.stop()
        }
        .onChange(of: voice.pendingUtterance) { _, utterance in
            guard let utterance else { return }
            Task {
                controller.draft = utterance.text
                let reply = await controller.send(in: conversation, context: context)
                voice.deliverResponse(reply)
            }
        }
        .navigationDestination(for: Article.self) { article in
            ArticleReaderView(article: article)
        }
    }

    /// Sending fails without a key; say so before you type.
    private var missingKeyWarning: String? {
        guard let provider = LLMProvider(rawValue: conversation.provider) else {
            return "This chat's provider isn't available any more. Start a new chat."
        }
        guard !LLMKeychainStore.shared.hasKey(for: provider) else { return nil }
        return "There's no API key for \(provider.displayName). Add one in Settings, behind the gear on Today."
    }

    private var composer: some View {
        VStack(alignment: .leading, spacing: 4) {
            if voice.isActive {
                voiceStatus
            }
            HStack(alignment: .bottom, spacing: 8) {
                TextField("Message", text: $controller.draft, axis: .vertical)
                    .lineLimit(1...6)
                    .textFieldStyle(.roundedBorder)
                    .focused($composerFocused)
                    .disabled(voice.isActive)
                Button(action: toggleVoice) {
                    Image(systemName: voice.isActive ? "mic.fill" : "mic")
                        .font(.title2)
                        .foregroundStyle(voice.isActive ? Color.accentColor : Color.primary)
                }
                .accessibilityLabel(voice.isActive ? "Stop voice conversation" : "Start voice conversation")
                Button {
                    Task { await controller.send(in: conversation, context: context) }
                } label: {
                    Image(systemName: "arrow.up.circle.fill").font(.title2)
                }
                .disabled(controller.isRunning || voice.isActive
                          || controller.draft.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                .accessibilityLabel("Send")
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(.bar)
        .alert("Turn on automatic approval?", isPresented: $showingVoiceGate) {
            Button("Turn On & Start") {
                autoApprove = true
                startVoice()
            }
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("A voice conversation needs Settings → \"Approve fetches and new sources automatically\" turned on, so the strategist is never left waiting for a tap you can't make hands-free.")
        }
        .alert("Voice trouble", isPresented: Binding(get: { voice.errorMessage != nil },
                                                      set: { if !$0 { voice.errorMessage = nil } })) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(voice.errorMessage ?? "")
        }
    }

    private var voiceStatus: some View {
        HStack(spacing: 6) {
            Image(systemName: voice.phase == .speaking ? "speaker.wave.2.fill" : "waveform")
                .foregroundStyle(.secondary)
            Text(voiceStatusText)
                .font(.caption)
                .foregroundStyle(.secondary)
                .lineLimit(1)
            Spacer()
        }
        .accessibilityElement(children: .combine)
    }

    private var voiceStatusText: String {
        switch voice.phase {
        case .idle: return ""
        case .listening: return voice.partialText.isEmpty ? "Listening…" : voice.partialText
        case .thinking: return "Thinking…"
        case .speaking: return "Speaking…"
        }
    }

    private func toggleVoice() {
        if voice.isActive {
            voice.stop()
        } else if autoApprove {
            startVoice()
        } else {
            showingVoiceGate = true
        }
    }

    /// `record_strategy_item` (saving a decision/open item) always asks
    /// regardless of this setting — a project-scoped voice conversation can
    /// still stall on that one card. Not solved here: out of scope for what
    /// auto-approve covers (PLAN §5.7, ActionTools.autoApprovableTools).
    private func startVoice() {
        voice.config = VoiceSettings.current
        voice.start()
    }
}

/// Asks before the strategist fetches a page or changes your library (PLAN §5.7).
private struct ActionConfirmationCard: View {
    let action: ActionRequest
    let onResolve: (Bool) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Label(action.title, systemImage: Self.systemImage(for: action.tool))
                .font(.subheadline.weight(.semibold))
            Text(action.detail)
                .font(.caption.monospaced())
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
            HStack {
                Button("Approve") { onResolve(true) }
                    .buttonStyle(.borderedProminent)
                Button("Decline", role: .cancel) { onResolve(false) }
                    .buttonStyle(.bordered)
            }
            .controlSize(.small)
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.orange.opacity(0.12), in: RoundedRectangle(cornerRadius: 12))
        .accessibilityElement(children: .contain)
    }

    static func systemImage(for tool: String) -> String {
        switch tool {
        case "fetch_url": return "globe"
        case "record_strategy_item": return "square.and.pencil"
        default: return "plus.circle"
        }
    }
}

/// What a new chat is for, before the first message.
private struct EmptyChatHint: View {
    let conversation: Conversation

    private var purpose: String {
        switch conversation.mode {
        case .brainstorm: return "Brainstorm: widen the options and find the promising directions."
        case .critique: return "Critique: find the weakest assumption in a plan and what would test it."
        case .researchPlan: return "Research plan: turn a question into what to read and test next."
        case .weeklyReview: return "Weekly review: open questions, stale action items, and what matters next."
        case .onboarding: return "Setup interview."
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(purpose)
            if let project = conversation.project {
                Text("Working in \(project.name), with its brief and open items.")
            }
            Text("Answers draw on your library and cite it. Fetching a page, adding a source or saving a decision always asks you first.")
            if conversation.offTheRecord {
                Text("Off the record: this chat is added to your knowledge graph on-device only, never through your provider.")
            }
        }
        .font(.footnote)
        .foregroundStyle(.secondary)
        .padding(.vertical, 8)
    }
}

private struct MessageRow: View {
    let role: String
    let text: String

    var body: some View {
        bubble
            .accessibilityElement(children: .combine)
            .accessibilityLabel("\(speaker): \(text)")
    }

    private var speaker: String {
        switch role {
        case "user": return "You"
        case "tool": return "Activity"
        default: return "SmartWard"
        }
    }

    @ViewBuilder
    private var bubble: some View {
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
            Label(passage.why.description, systemImage: Self.systemImage(for: passage.why))
                .font(.caption2)
        }
    }

    static func systemImage(for why: RetrievedPassage.Why) -> String {
        switch why {
        case .fetched: return "globe"
        case .connected: return "point.3.connected.trianglepath.dotted"
        case .direct, .named: return "text.magnifyingglass"
        }
    }

    private func linkedArticle(for passage: RetrievedPassage) -> Article? {
        guard let id = passage.articleID else { return nil }
        return try? context.fetch(FetchDescriptor<Article>(predicate: #Predicate { $0.id == id })).first
    }
}
