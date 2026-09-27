import SwiftUI
import SwiftData
import BYOKLLMKit
import KnowledgeStore

struct NewConversationView: View {
    var onCreate: (Conversation) -> Void

    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @Query(sort: \Project.name) private var projects: [Project]

    @AppStorage("chat.lastProvider") private var providerRaw = LLMProvider.openrouter.rawValue
    @AppStorage("chat.lastModel") private var model = LLMProvider.openrouter.exampleModelID
    @State private var mode: ConversationMode = .brainstorm
    @State private var projectID: UUID?

    private var providersWithKeys: [LLMProvider] {
        LLMProvider.allCases.filter { LLMKeychainStore.shared.hasKey(for: $0) }
    }

    var body: some View {
        NavigationStack {
            Form {
                if providersWithKeys.isEmpty {
                    Section {
                        Label("Add an API key in Settings first.", systemImage: "key")
                    }
                } else {
                    Section("Model") {
                        Picker("Provider", selection: $providerRaw) {
                            ForEach(providersWithKeys) { provider in
                                Text(provider.displayName).tag(provider.rawValue)
                            }
                        }
                        TextField("Model ID", text: $model)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled()
                    }
                }
                Section("Focus") {
                    Picker("Mode", selection: $mode) {
                        ForEach([ConversationMode.brainstorm, .critique, .researchPlan, .weeklyReview], id: \.self) { mode in
                            Text(modeLabel(mode)).tag(mode)
                        }
                    }
                    Picker("Project", selection: $projectID) {
                        Text("None").tag(UUID?.none)
                        ForEach(projects) { project in
                            Text(project.name).tag(Optional(project.id))
                        }
                    }
                }
            }
            .navigationTitle("New chat")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Start", action: create)
                        .disabled(!canStart)
                }
            }
            .onChange(of: providerRaw) { _, newValue in
                if let provider = LLMProvider(rawValue: newValue) {
                    model = provider.exampleModelID
                }
            }
            .onAppear {
                if let first = providersWithKeys.first, !providersWithKeys.map(\.rawValue).contains(providerRaw) {
                    providerRaw = first.rawValue
                }
            }
        }
    }

    private var canStart: Bool {
        providersWithKeys.map(\.rawValue).contains(providerRaw)
            && !model.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    private func create() {
        let conversation = Conversation(title: "", mode: mode)
        conversation.provider = providerRaw
        conversation.model = model.trimmingCharacters(in: .whitespacesAndNewlines)
        context.insert(conversation)
        if let projectID, let project = projects.first(where: { $0.id == projectID }) {
            project.conversations?.append(conversation)
        }
        dismiss()
        onCreate(conversation)
    }
}
