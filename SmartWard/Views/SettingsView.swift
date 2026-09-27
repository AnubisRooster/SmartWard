import SwiftUI
import BYOKLLMKit

struct SettingsView: View {
    @AppStorage("onboarding.completed") private var onboardingCompleted = false

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    ForEach(LLMProvider.allCases) { provider in
                        ProviderKeyRow(provider: provider)
                    }
                } header: {
                    Text("API keys")
                } footer: {
                    Text("Keys are stored only in this device's Keychain. An OpenRouter key alone reaches Anthropic, OpenAI, xAI and open models.")
                }
                Section {
                    Button("Run setup again") { onboardingCompleted = false }
                } header: {
                    Text("Setup")
                } footer: {
                    Text("Re-runs the onboarding interview. Existing projects are kept; new links, sources and topics are merged in.")
                }
                Section("About") {
                    LabeledContent("Version",
                                   value: Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "–")
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct ProviderKeyRow: View {
    let provider: LLMProvider
    /// Called after a key is saved or removed.
    var onChange: () -> Void = {}
    @State private var key = ""
    @State private var hasKey = false

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(provider.displayName)
                Spacer()
                if hasKey {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundStyle(.green)
                        .accessibilityLabel("Key saved")
                }
            }
            SecureField(hasKey ? "Replace key" : "Paste key from \(provider.keyHint)", text: $key)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .onSubmit(save)
            HStack {
                Button("Save", action: save)
                    .disabled(key.isEmpty)
                if hasKey {
                    Button("Remove", role: .destructive, action: remove)
                }
            }
            .buttonStyle(.borderless)
        }
        .onAppear { hasKey = LLMKeychainStore.shared.hasKey(for: provider) }
    }

    private func save() {
        guard !key.isEmpty else { return }
        LLMKeychainStore.shared.set(key, for: provider)
        key = ""
        hasKey = true
        onChange()
    }

    private func remove() {
        LLMKeychainStore.shared.delete(for: provider)
        hasKey = false
        onChange()
    }
}
