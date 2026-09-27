import Foundation
import Observation
import SwiftData
import BYOKLLMKit
import KnowledgeStore
import StrategistCore

/// Drives one conversation: persists the user's turn, runs the strategist
/// (streaming + tools), persists the reply, and records usage.
@MainActor
@Observable
final class ChatController {
    var draft = ""
    private(set) var streamingText = ""
    private(set) var activity: [String] = []
    private(set) var isRunning = false
    var errorMessage: String?

    private let runner: StrategistRunner

    init(llm: any LLMCompleting = LLMService.shared) {
        runner = StrategistRunner(llm: llm)
    }

    func send(in conversation: Conversation, context: ModelContext) async {
        let text = draft.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !text.isEmpty, !isRunning else { return }
        guard let provider = LLMProvider(rawValue: conversation.provider) else {
            errorMessage = "This chat's provider '\(conversation.provider)' isn't available. Start a new chat."
            return
        }

        draft = ""
        errorMessage = nil
        streamingText = ""
        activity = []
        isRunning = true
        defer {
            isRunning = false
            streamingText = ""
        }

        conversation.messages?.append(Message(role: "user", content: text))
        conversation.updatedAt = Date()
        if conversation.title.isEmpty {
            conversation.title = String(text.prefix(60))
        }

        let project = conversation.project
        let system = StrategistPrompt.system(mode: conversation.mode,
                                             project: project.map { ProjectSnapshot(project: $0) })
        let history = ConversationHistory.messages(from: conversation.messages ?? [])
        let request = LLMRequest(provider: provider,
                                 model: conversation.model,
                                 messages: [LLMChatMessage.system(system)] + history,
                                 maxTokens: 4096)
        var tools: [any StrategistTool] = []
        if let project {
            tools = [ProjectStateTool(project: project), RecordStrategyItemTool(project: project)]
        }

        do {
            let produced = try await runner.run(request: request, tools: tools) { event in
                self.handle(event, provider: provider, conversation: conversation, context: context)
            }
            let reply = produced
                .filter { $0.role == .assistant }
                .map(\.text)
                .filter { !$0.isEmpty }
                .joined(separator: "\n\n")
            if !reply.isEmpty {
                conversation.messages?.append(Message(role: "assistant", content: reply))
            }
            if !activity.isEmpty {
                conversation.messages?.append(Message(role: "tool", content: activity.joined(separator: "\n")))
            }
            conversation.updatedAt = Date()
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    private func handle(_ event: StrategistEvent, provider: LLMProvider,
                        conversation: Conversation, context: ModelContext) {
        switch event {
        case .textDelta(let text):
            streamingText += text
        case .toolCall(let name, _):
            activity.append("Using \(name)…")
        case .toolResult(let name, let result, let isError):
            activity.append(isError ? "\(name) failed: \(result)" : "\(name): \(result.prefix(120))")
        case .roundFinished(let response):
            // Text from earlier rounds stays visible while tools run.
            if !streamingText.isEmpty && !response.toolCalls.isEmpty {
                streamingText += "\n\n"
            }
            if let usage = response.usage {
                context.insert(UsageRecord(provider: provider.rawValue,
                                           model: response.model ?? conversation.model,
                                           feature: "chat",
                                           inputTokens: usage.inputTokens,
                                           outputTokens: usage.outputTokens,
                                           costUSD: usage.costUSD ?? 0))
            }
        }
    }
}
