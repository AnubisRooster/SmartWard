import Foundation
import FoundationModels
import Pipeline

/// Apple Intelligence's on-device model, asked which of the grammar's phrases
/// a free-form request means (`VoiceRephrase`). What you said never leaves the
/// device, and it can only choose a phrase the parser knows.
struct FoundationModelsVoiceRephraser: VoiceRephrasing {
    static var isAvailable: Bool { SystemLanguageModel.default.isAvailable }

    func rephrase(_ heard: String, context: VoiceContext) async -> String? {
        guard Self.isAvailable else { return nil }
        let session = LanguageModelSession(instructions: VoiceRephrase.instructions(for: context))
        // A command is a few words, and the same words should give the same answer.
        var options = GenerationOptions()
        options.temperature = 0
        options.maximumResponseTokens = 40
        return try? await session.respond(to: VoiceRephrase.prompt(for: heard), options: options).content
    }
}
