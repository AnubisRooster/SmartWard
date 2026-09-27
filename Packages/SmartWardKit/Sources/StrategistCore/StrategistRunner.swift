import Foundation
import BYOKLLMKit

/// A capability the strategist can invoke mid-conversation.
public protocol StrategistTool {
    var definition: LLMTool { get }
    /// Returns the text sent back to the model as the tool result. Throwing
    /// reports the error to the model (as an error result) rather than
    /// failing the turn.
    @MainActor func run(arguments: JSONValue) async throws -> String
}

public enum StrategistEvent: Equatable {
    case textDelta(String)
    case toolCall(name: String, arguments: JSONValue)
    case toolResult(name: String, result: String, isError: Bool)
    /// One model round finished; carries usage for the ledger.
    case roundFinished(LLMResponse)
}

public enum StrategistError: LocalizedError, Equatable {
    case incompleteResponse

    public var errorDescription: String? {
        switch self {
        case .incompleteResponse: return "The model's reply ended before it finished."
        }
    }
}

/// Runs one user turn: streams the model's reply, executes any tool calls,
/// feeds the results back, and repeats until the model answers without
/// calling a tool. The final round forbids tool calls, so a turn always ends.
@MainActor
public final class StrategistRunner {
    private let llm: any LLMCompleting
    /// Rounds that may call tools before the final, tool-free round.
    public var maxToolRounds: Int

    public init(llm: any LLMCompleting, maxToolRounds: Int = 4) {
        self.llm = llm
        self.maxToolRounds = maxToolRounds
    }

    /// - Returns: the messages this turn produced, in order (assistant turns
    ///   and tool results), ready to append to the conversation.
    public func run(request: LLMRequest,
                    tools: [any StrategistTool],
                    onEvent: (StrategistEvent) -> Void) async throws -> [LLMChatMessage] {
        var request = request
        if !tools.isEmpty {
            request.tools = tools.map { $0.definition }
        }
        var produced: [LLMChatMessage] = []

        for round in 0...maxToolRounds {
            if round == maxToolRounds && !tools.isEmpty {
                request.toolChoice = LLMToolChoice.none
            }

            var completed: LLMResponse?
            for try await event in llm.stream(request) {
                switch event {
                case .textDelta(let text):
                    onEvent(.textDelta(text))
                case .toolCall:
                    break  // run after the round completes, in order
                case .completed(let finished):
                    completed = finished
                }
            }
            guard let response = completed else { throw StrategistError.incompleteResponse }
            onEvent(.roundFinished(response))
            produced.append(response.message)
            request.messages.append(response.message)

            let calls = response.toolCalls
            if calls.isEmpty || round == maxToolRounds {
                return produced
            }
            for call in calls {
                let result = await execute(call, tools: tools, onEvent: onEvent)
                produced.append(result)
                request.messages.append(result)
            }
        }
        return produced
    }

    private func execute(_ call: LLMToolCall,
                         tools: [any StrategistTool],
                         onEvent: (StrategistEvent) -> Void) async -> LLMChatMessage {
        onEvent(.toolCall(name: call.name, arguments: call.arguments))
        guard let tool = tools.first(where: { $0.definition.name == call.name }) else {
            let message = "Unknown tool '\(call.name)'."
            onEvent(.toolResult(name: call.name, result: message, isError: true))
            return .toolResult(callID: call.id, content: message, isError: true)
        }
        do {
            let output = try await tool.run(arguments: call.arguments)
            onEvent(.toolResult(name: call.name, result: output, isError: false))
            return .toolResult(callID: call.id, content: output)
        } catch {
            let message = error.localizedDescription
            onEvent(.toolResult(name: call.name, result: message, isError: true))
            return .toolResult(callID: call.id, content: message, isError: true)
        }
    }
}
