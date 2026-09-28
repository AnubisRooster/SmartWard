import SwiftUI
import BYOKLLMKit
import ModelCatalogKit
import StrategistCore

/// Settings → Available models: every model each keyed provider currently
/// offers, as of when it was last checked (`ProviderModelController` for
/// most providers, `ModelCatalogController` for OpenRouter's own catalog).
struct AvailableModelsView: View {
    @State private var models = ProviderModelController.shared
    @State private var openRouterCatalog = ModelCatalogController.shared

    private var providersWithKeys: [LLMProvider] {
        LLMProvider.allCases.filter { LLMKeychainStore.shared.hasKey(for: $0) }
    }

    var body: some View {
        Form {
            if providersWithKeys.isEmpty {
                Section {
                    Text("Add a provider key in Settings to see its available models.")
                        .foregroundStyle(.secondary)
                }
            }
            ForEach(providersWithKeys) { provider in
                providerSection(provider)
            }
        }
        .navigationTitle("Available models")
        .task {
            for provider in providersWithKeys { await models.load(provider: provider) }
        }
    }

    @ViewBuilder
    private func providerSection(_ provider: LLMProvider) -> some View {
        let entries = models.models(for: provider)
        let refreshing = models.isRefreshing(provider)
        Section {
            if entries.isEmpty {
                Text(refreshing ? "Loading…" : "No models loaded yet.")
                    .foregroundStyle(.secondary)
            } else {
                ForEach(entries, id: \.id) { entry in
                    VStack(alignment: .leading, spacing: 2) {
                        Text(entry.name ?? entry.id)
                        if entry.name != nil {
                            Text(entry.id).font(.caption).foregroundStyle(.secondary).monospaced()
                        }
                    }
                }
            }
        } header: {
            HStack {
                Text(provider.displayName)
                Spacer()
                if refreshing {
                    ProgressView()
                } else {
                    Button("Refresh") { Task { await models.refresh(provider: provider) } }
                }
            }
        } footer: {
            footer(for: provider)
        }
    }

    @ViewBuilder
    private func footer(for provider: LLMProvider) -> some View {
        let error = provider == .openrouter ? openRouterCatalog.errorMessage : models.errorMessage[provider]
        if let error {
            Text(error).foregroundStyle(.red)
        } else if let date = models.lastRefreshed(for: provider) {
            Text("As of \(date.formatted(date: .abbreviated, time: .shortened))")
        }
    }
}
