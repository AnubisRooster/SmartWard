import SwiftUI
import SwiftData
import AVFoundation
import KnowledgeStore
import Pipeline
import BYOKLLMKit
import StrategistCore
import VoiceLoopKit

struct ConversationView: View {
    let conversation: Conversation

    @Environment(\.modelContext) private var context
    @Environment(\.scenePhase) private var scenePhase
    @State private var controller = ChatController()
    @State private var lock = AppLockController.shared
    @StateObject private var voice = VoiceConversationController()
    @AppStorage(ActionTools.autoApproveKey) private var autoApprove = false
    @State private var showingVoiceGate = false
    /// Checked when the chat appears and when the app comes back, not on
    /// every redraw: it's a Keychain lookup, and a streamed reply redraws
    /// the view for each token.
    @State private var hasKey = true
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
            stopVoice()
        }
        .onChange(of: voice.pendingUtterance) { _, utterance in
            guard let utterance else { return }
            Task { await runVoiceTurn(utterance.text) }
        }
        // Voice never outlives the app being frontmost and unlocked: it
        // would otherwise keep listening and reading replies aloud behind
        // the lock screen, or sit stuck after a call cut its audio off.
        .onChange(of: scenePhase) { _, phase in
            if phase == .active { refreshKey() } else { stopVoice() }
        }
        .onAppear { refreshKey() }
        .onChange(of: lock.isLocked) { _, locked in
            if locked { stopVoice() }
        }
        .onReceive(NotificationCenter.default.publisher(for: AVAudioSession.interruptionNotification)) { note in
            let type = (note.userInfo?[AVAudioSessionInterruptionTypeKey] as? UInt)
                .flatMap { AVAudioSession.InterruptionType(rawValue: $0) }
            if type == .began { stopVoice() }
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
        guard !hasKey else { return nil }
        return "There's no API key for \(provider.displayName). Add one in Settings, behind the gear on Today."
    }

    private func refreshKey() {
        hasKey = LLMProvider(rawValue: conversation.provider).map { LLMKeychainStore.shared.hasKey(for: $0) } ?? false
    }

    private var composer: some View {
        VStack(alignment: .leading, spacing: 4) {
            if voice.isActive {
                voiceStatus
            }
            // Inline rather than an alert: starting voice from the
            // auto-approve alert can fail at once, and SwiftUI drops an alert
            // presented while another is still closing.
            if let error = voice.errorMessage {
                HStack(alignment: .firstTextBaseline, spacing: 6) {
                    Label(error, systemImage: "mic.slash")
                        .font(.caption)
                        .foregroundStyle(.red)
                    Spacer()
                    Button("Dismiss") { voice.errorMessage = nil }
                        .font(.caption)
                        .buttonStyle(.borderless)
                }
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
                // Not while a typed turn is still running: a spoken turn
                // sent then would be dropped. Not without a key either.
                .disabled(!voice.isActive && (controller.isRunning || missingKeyWarning != nil))
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
        .alert("Turn on automatic approval for all chats?", isPresented: $showingVoiceGate) {
            Button("Turn On for All Chats") {
                autoApprove = true
                startVoice()
            }
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Voice conversations need \"Approve fetches and new sources automatically\", because nobody can tap an approval card hands-free. This lets the strategist read pages and follow sources without asking, in every chat, typed or spoken, until you turn it off in Settings → Strategist actions. Saving decisions to a project always still asks.")
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
            if voice.phase == .speaking {
                Button("Skip") { voice.skipSpeaking() }
                    .font(.caption)
                    .buttonStyle(.borderless)
                    .accessibilityHint("Stops reading this reply and listens again")
            }
        }
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
            return
        }
        switch VoiceTurn.startBlocker(hasKey: missingKeyWarning == nil, autoApprove: autoApprove) {
        case .missingKey:
            return  // the button is disabled; the banner above says why
        case .needsAutoApprove:
            showingVoiceGate = true
        case nil:
            startVoice()
        }
    }

    private func startVoice() {
        var config = VoiceSettings.current
        // Off the record means on-device only: never fall back to Apple's
        // server recognition, and don't start where that's impossible.
        config.requiresOnDeviceRecognition = conversation.offTheRecord
        voice.config = config
        // A failure message still being read would be heard by the mic.
        SpeechService.shared.stop()
        voice.start()
    }

    private func stopVoice() {
        if voice.isActive {
            voice.stop()
        } else if SpeechService.shared.isSpeaking {
            // The failure message, spoken after the loop already stopped.
            SpeechService.shared.stop()
            Self.releaseAudio()
        }
    }

    /// Gives the audio session back, so other apps' audio isn't left ducked
    /// by speech the voice loop didn't manage.
    nonisolated private static func releaseAudio() {
        try? AVAudioSession.sharedInstance().setActive(false, options: .notifyOthersOnDeactivation)
    }

    /// One spoken turn: send it, then speak the reply, listen again, or —
    /// if it failed — say so and stop, rather than keep taking turns that
    /// aren't getting through.
    private func runVoiceTurn(_ text: String) async {
        let reply = await controller.sendSpoken(text, in: conversation, context: context)
        // Stopped meanwhile (you tapped the mic, or the app locked): say nothing.
        guard voice.isActive else { return }
        switch VoiceTurn.outcome(reply: reply, failed: controller.errorMessage != nil,
                                 clean: SpeechService.speakableText) {
        case .speak(let spoken):
            voice.deliverResponse(spoken)
        case .listen:
            voice.deliverResponse(nil)
        case .fail(let message):
            let config = voice.config
            voice.stop()
            SpeechService.shared.speak(message, rate: config.ttsRate, pitch: config.ttsPitch, voiceID: config.voiceID,
                                       onFinish: { Self.releaseAudio() })
        }
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
