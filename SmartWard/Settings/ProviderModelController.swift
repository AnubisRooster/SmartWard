import Foundation
import Observation
import BYOKLLMKit
import ModelCatalogKit
import StrategistCore

/// Per-provider model lists, cached on disk (`CatalogCache`, one file per
/// provider) so onboarding and Settings can show "as of <date>" without
/// re-fetching every time. OpenRouter's own richer catalog stays owned by
/// `ModelCatalogController`; this covers every other provider's bare list.
@MainActor
@Observable
final class ProviderModelController {
    static let shared = ProviderModelController()

    private var catalogs: [LLMProvider: [CatalogEntry]] = [:]
    private var lastRefreshedByProvider: [LLMProvider: Date] = [:]
    private var refreshing: Set<LLMProvider> = []
    var errorMessage: [LLMProvider: String] = [:]

    private func cache(for provider: LLMProvider) -> CatalogCache {
        CatalogCache(cacheKey: "models_\(provider.rawValue)")
    }

    /// All models known for `provider` — OpenRouter's live catalog, or this
    /// controller's own per-provider cache.
    func models(for provider: LLMProvider) -> [CatalogEntry] {
        provider == .openrouter ? ModelCatalogController.shared.catalog : (catalogs[provider] ?? [])
    }

    func lastRefreshed(for provider: LLMProvider) -> Date? {
        provider == .openrouter ? ModelCatalogController.shared.lastRefreshed : lastRefreshedByProvider[provider]
    }

    func isRefreshing(_ provider: LLMProvider) -> Bool {
        provider == .openrouter ? ModelCatalogController.shared.isRefreshing : refreshing.contains(provider)
    }

    /// Loads the on-disk cache (if this session hasn't already) and, when a
    /// key exists, refreshes from the live API.
    func load(provider: LLMProvider) async {
        if provider == .openrouter {
            await ModelCatalogController.shared.load()
            return
        }
        if catalogs[provider] == nil, let cached = await cache(for: provider).load() {
            catalogs[provider] = cached.entries
            lastRefreshedByProvider[provider] = cached.lastRefreshed
        }
        guard let key = LLMKeychainStore.shared.get(for: provider), !refreshing.contains(provider) else { return }
        await refresh(provider: provider, apiKey: key)
    }

    /// Refetches `provider`'s models with its saved key — Settings' manual
    /// "Refresh", and pull-to-date for a provider already verified.
    func refresh(provider: LLMProvider) async {
        if provider == .openrouter {
            // Keeps `isRefreshing`/`lastRefreshed` reads for OpenRouter
            // pointed at the one flag `ModelCatalogController` itself sets.
            await ModelCatalogController.shared.load(force: true)
            return
        }
        guard let key = LLMKeychainStore.shared.get(for: provider) else { return }
        await refresh(provider: provider, apiKey: key)
    }

    /// Fetches and verifies `apiKey` against `provider`'s own API — a pure
    /// check against the candidate string, with no Keychain dependency, so
    /// it works before a fresh key has been saved. For OpenRouter,
    /// `ModelCatalogController` owns the actual catalog/pricing state; since
    /// its own refresh reads the key back out of the Keychain, the caller
    /// (`ProviderKeyRow`) triggers that refresh itself, after saving —
    /// triggering it from here, before the key exists in the Keychain, would
    /// silently do nothing. Every other provider is cached and applied here
    /// directly, since this fetch is already their whole refresh.
    @discardableResult
    func verify(provider: LLMProvider, apiKey: String) async throws -> [CatalogEntry] {
        let entries = try await ProviderModelFetcher.fetch(provider: provider, apiKey: apiKey)
        if provider != .openrouter {
            apply(entries, for: provider)
            try? await cache(for: provider).save(entries: entries)
        }
        return entries
    }

    private func refresh(provider: LLMProvider, apiKey: String) async {
        guard !refreshing.contains(provider) else { return }
        refreshing.insert(provider)
        defer { refreshing.remove(provider) }
        do {
            _ = try await verify(provider: provider, apiKey: apiKey)
            errorMessage[provider] = nil
        } catch {
            errorMessage[provider] = error.localizedDescription
        }
    }

    private func apply(_ entries: [CatalogEntry], for provider: LLMProvider) {
        guard provider != .openrouter else { return }
        catalogs[provider] = entries
        lastRefreshedByProvider[provider] = Date()
    }
}
