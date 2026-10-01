import Foundation
import SwiftData
import FoundationModels
import BYOKLLMKit
import KnowledgeStore
import Pipeline

/// Works out what a spoken request means when the phrase grammar doesn't know
/// the words (`VoiceIntent`): your provider first (the model you last chatted
/// with, through the same fallback and usage ledger as chat), Apple
/// Intelligence on the device when the provider can't answer (no key, no
/// network, an error, or too slow).
///
/// What leaves the phone for your provider: the words you said, the tab,
/// the titles in the article list on screen and your project names. Speech is
/// still turned into words on the device, and nothing is sent while the
/// grammar understands you.
@MainActor
enum VoiceIntentResolver {
    /// After this long, your provider is given up on for the on-device model.
    static let cloudTimeout: TimeInterval = 6

    /// `nil` when neither model could answer at all; `.notUnderstood` when one
    /// answered that it isn't a request it can carry out.
    static func resolve(_ heard: String, context: VoiceContext, nowReading: String?,
                        library: ModelContext?) async -> VoiceIntent.Outcome? {
        if let outcome = await fromProvider(heard, context: context, nowReading: nowReading, library: library) {
            return outcome
        }
        return await onDevice(heard, context: context, nowReading: nowReading)
    }

    static var providerAvailable: Bool { providerSettings != nil }
    static var onDeviceAvailable: Bool { SystemLanguageModel.default.isAvailable }

    /// Your provider and model: the ones you last chatted with.
    private static var providerSettings: (provider: LLMProvider, model: String)? {
        let defaults = UserDefaults.standard
        let raw = defaults.string(forKey: "chat.lastProvider") ?? LLMProvider.openrouter.rawValue
        guard let provider = LLMProvider(rawValue: raw), LLMKeychainStore.shared.hasKey(for: provider) else { return nil }
        let model = defaults.string(forKey: "chat.lastModel")?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        return (provider, model.isEmpty ? provider.exampleModelID : model)
    }

    private static func fromProvider(_ heard: String, context: VoiceContext, nowReading: String?,
                                     library: ModelContext?) async -> VoiceIntent.Outcome? {
        guard let settings = providerSettings else { return nil }
        let request = VoiceIntent.request(heard: heard, context: context, nowReading: nowReading,
                                          provider: settings.provider, model: settings.model)
        let client = ModelCatalogController.shared.fallbackLLM()
        guard let response = await withTimeout(cloudTimeout, { try await client.complete(request) }) else { return nil }
        if let usage = response.usage, let library {
            UsageLedger.record(provider: settings.provider.rawValue, model: response.model ?? settings.model,
                               feature: "voice", inputTokens: usage.inputTokens, outputTokens: usage.outputTokens,
                               reportedCostUSD: usage.costUSD, context: library)
        }
        return VoiceIntent.decode(response.text, heard: heard, context: context)
    }

    private static func onDevice(_ heard: String, context: VoiceContext, nowReading: String?) async -> VoiceIntent.Outcome? {
        guard onDeviceAvailable else { return nil }
        let session = LanguageModelSession(instructions: VoiceIntent.instructions)
        var options = GenerationOptions()
        options.temperature = 0
        options.maximumResponseTokens = 300
        let prompt = VoiceIntent.prompt(heard: heard, context: context, nowReading: nowReading)
        guard let reply = try? await session.respond(to: prompt, options: options).content else { return nil }
        return VoiceIntent.decode(reply, heard: heard, context: context)
    }

    /// The result of `work`, or `nil` if it throws or takes longer than `seconds`.
    private static func withTimeout<T: Sendable>(_ seconds: TimeInterval,
                                                 _ work: @escaping @Sendable () async throws -> T) async -> T? {
        await withTaskGroup(of: T?.self) { group in
            group.addTask { try? await work() }
            group.addTask {
                try? await Task.sleep(nanoseconds: UInt64(seconds * 1_000_000_000))
                return nil
            }
            let first = await group.next() ?? nil
            group.cancelAll()
            return first
        }
    }
}
