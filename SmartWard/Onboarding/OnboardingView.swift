import SwiftUI
import SwiftData
import FoundationModels
import BYOKLLMKit
import KnowledgeStore
import StrategistCore

/// First-launch setup (PLAN flow D): preflight, a short strategist-led
/// interview, then a proposal the user edits and confirms. Nothing is created
/// until they confirm.
struct OnboardingView: View {
    private enum Step: Equatable {
        case welcome
        case interview
        case building
        case review(OnboardingProposal)
    }

    @Environment(\.modelContext) private var context
    @AppStorage("onboarding.completed") private var completed = false
    @AppStorage("chat.lastProvider") private var providerRaw = LLMProvider.openrouter.rawValue
    @AppStorage("chat.lastModel") private var model = LLMProvider.openrouter.exampleModelID

    @State private var step: Step = .welcome
    @State private var conversation: Conversation?
    @State private var linksText = ""
    @State private var showingLinks = false
    @State private var errorMessage: String?
    @State private var keysVersion = 0

    var body: some View {
        NavigationStack {
            switch step {
            case .welcome:
                welcome
            case .interview:
                interview
            case .building:
                ProgressView("Building your setup…")
                    .navigationTitle("Setting up")
            case .review(let proposal):
                OnboardingReviewView(proposal: proposal,
                                     onApply: { confirmed in apply(confirmed) },
                                     onBack: { step = .interview })
            }
        }
        .interactiveDismissDisabled()
        .alert("Something went wrong",
               isPresented: Binding(get: { errorMessage != nil }, set: { if !$0 { errorMessage = nil } })) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(errorMessage ?? "")
        }
    }

    // MARK: Welcome

    private var providersWithKeys: [LLMProvider] {
        _ = keysVersion
        return LLMProvider.allCases.filter { LLMKeychainStore.shared.hasKey(for: $0) }
    }

    private var welcome: some View {
        Form {
            Section {
                Text("SmartWard follows AI and software research for you and connects it to what you're building. A few quick questions will set it up.")
            }
            Section {
                if providersWithKeys.isEmpty {
                    ProviderKeyRow(provider: .openrouter) { keysVersion += 1 }
                } else {
                    Picker("Provider", selection: $providerRaw) {
                        ForEach(providersWithKeys) { provider in
                            Text(provider.displayName).tag(provider.rawValue)
                        }
                    }
                    TextField("Model ID", text: $model)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                }
            } header: {
                Text("Your model")
            } footer: {
                Text(providersWithKeys.isEmpty
                     ? "One OpenRouter key reaches Anthropic, OpenAI, xAI and open models. Other providers can be added in Settings."
                     : "Used for the interview and for building your setup.")
            }
            Section("On-device model") {
                LabeledContent("Apple Intelligence", value: appleIntelligenceStatus)
            }
            Section {
                Button("Start the interview", action: startInterview)
                    .disabled(!canStart)
                Button("Skip for now") { completed = true }
                    .foregroundStyle(.secondary)
            }
        }
        .navigationTitle("Welcome")
        .onAppear(perform: selectAvailableProvider)
        .onChange(of: keysVersion) { _, _ in selectAvailableProvider() }
        .onChange(of: providerRaw) { _, newValue in
            if let provider = LLMProvider(rawValue: newValue) { model = provider.exampleModelID }
        }
    }

    private var canStart: Bool {
        providersWithKeys.map(\.rawValue).contains(providerRaw)
            && !model.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    private var appleIntelligenceStatus: String {
        switch SystemLanguageModel.default.availability {
        case .available:
            return "Available"
        case .unavailable(.appleIntelligenceNotEnabled):
            return "Turned off in Settings"
        case .unavailable(.deviceNotEligible):
            return "Not supported on this device"
        case .unavailable(.modelNotReady):
            return "Downloading"
        case .unavailable:
            return "Unavailable"
        @unknown default:
            return "Unavailable"
        }
    }

    private func selectAvailableProvider() {
        let available = providersWithKeys
        if let first = available.first, !available.map(\.rawValue).contains(providerRaw) {
            providerRaw = first.rawValue
        }
    }

    private func startInterview() {
        let conversation = Conversation(title: "Onboarding", mode: .onboarding)
        conversation.provider = providerRaw
        conversation.model = model.trimmingCharacters(in: .whitespacesAndNewlines)
        context.insert(conversation)
        conversation.messages?.append(Message(role: "assistant", content: StrategistPrompt.onboardingGreeting))
        self.conversation = conversation
        step = .interview
    }

    // MARK: Interview

    private var links: [String] {
        linksText.split(whereSeparator: \.isNewline)
            .map { $0.trimmingCharacters(in: .whitespaces) }
            .filter { !$0.isEmpty }
    }

    private var hasUserInput: Bool {
        let userTurns = (conversation?.messages ?? []).filter { $0.role == "user" }.count
        return userTurns > 0 || !links.isEmpty
    }

    @ViewBuilder
    private var interview: some View {
        if let conversation {
            ConversationView(conversation: conversation)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(links.isEmpty ? "Add links" : "Links (\(links.count))") { showingLinks = true }
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Build my setup") {
                            Task { await build(from: conversation) }
                        }
                        .disabled(!hasUserInput)
                    }
                }
                .sheet(isPresented: $showingLinks) {
                    OnboardingLinksSheet(text: $linksText)
                }
        }
    }

    private func build(from conversation: Conversation) async {
        guard let provider = LLMProvider(rawValue: conversation.provider) else { return }
        step = .building
        let transcript = ConversationHistory.messages(from: conversation.messages ?? [], budgetCharacters: 60_000)
        let request = OnboardingSynthesizer.request(provider: provider, model: conversation.model,
                                                    transcript: transcript, links: links)
        do {
            let response = try await LLMService.shared.complete(request)
            if let usage = response.usage {
                context.insert(UsageRecord(provider: provider.rawValue,
                                           model: response.model ?? conversation.model,
                                           feature: "onboarding",
                                           inputTokens: usage.inputTokens,
                                           outputTokens: usage.outputTokens,
                                           costUSD: usage.costUSD ?? 0))
            }
            let proposal = try OnboardingSynthesizer.decode(response.text)
            step = .review(proposal)
        } catch {
            errorMessage = error.localizedDescription
            step = .interview
        }
    }

    // MARK: Apply

    private func apply(_ proposal: OnboardingProposal) {
        do {
            try proposal.apply(to: context)
            completed = true
            // Kick-off (PLAN §3.3 D7): the first fetch of the confirmed sources.
            let context = context
            Task { await IngestController.shared.refreshAll(context: context) }
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}

private struct OnboardingLinksSheet: View {
    @Binding var text: String
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextEditor(text: $text)
                        .frame(minHeight: 160)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .keyboardType(.URL)
                } header: {
                    Text("One link per line")
                } footer: {
                    Text("Project repos (github.com/owner/name) or pages. To pick repos from your account instead, sign in to GitHub from Settings afterwards.")
                }
            }
            .navigationTitle("Project links")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
}
