import SwiftUI
import BYOKLLMKit

struct SettingsView: View {
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
                Section("About") {
                    LabeledContent("Version",
                                   value: Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "–")
                }
            }
            .navigationTitle("Settings")
        }
    }
}

private struct ProviderKeyRow: View {
    let provider: LLMProvider
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
    }

    private func remove() {
        LLMKeychainStore.shared.delete(for: provider)
        hasKey = false
    }
}
