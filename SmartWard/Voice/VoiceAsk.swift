import Foundation
import SwiftData
import BYOKLLMKit
import KnowledgeStore
import StrategistCore
import VoiceLoopKit

/// "SmartWard, ask the strategist …": one turn with your provider, saved as a
/// chat like any other, and its answer shortened for the ear. It costs tokens
/// (counted in the usage ledger and the daily budget like any chat), and
/// nobody's there to approve anything, so tools that need approval aren't
/// offered, exactly as with the Siri action.
@MainActor
enum VoiceAsk {
    enum Answer: Equatable {
        /// Ready to say.
        case spoken(String)
        /// Why it didn't work, ready to say.
        case failed(String)
    }

    static func ask(_ question: String, context: ModelContext) async -> Answer {
        let defaults = UserDefaults.standard
        let providerRaw = defaults.string(forKey: "chat.lastProvider") ?? LLMProvider.openrouter.rawValue
        guard let provider = LLMProvider(rawValue: providerRaw), LLMKeychainStore.shared.hasKey(for: provider) else {
            return .failed("Add an API key in SmartWard's settings first.")
        }

        let conversation = Conversation(title: "", mode: .brainstorm)
        conversation.provider = provider.rawValue
        conversation.model = defaults.string(forKey: "chat.lastModel") ?? provider.exampleModelID
        context.insert(conversation)

        let chat = ChatController()
        let reply = await chat.sendUnattended(question, in: conversation, context: context) ?? ""
        try? context.save()

        if let error = chat.errorMessage { return .failed(error) }
        let spoken = VoiceTurn.spokenText(reply, clean: SpeechService.speakableText,
                                          ending: " The rest is in your Chat tab.")
        return spoken.isEmpty ? .failed("No answer came back.") : .spoken(spoken)
    }
}
