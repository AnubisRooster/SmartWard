import Foundation
import BYOKLLMKit

/// A capability the strategist can invoke mid-conversation.
public protocol StrategistTool {
    var definition: LLMTool { get }
    /// Whether calls can pause on an approval card, that is, whether
    /// `confirmation(for:)` can return an `ActionRequest`. There is
    /// deliberately no default: a new tool has to say, so a turn where nobody
    /// can tap a card (voice, Siri) never offers one it would only decline.
    var asksForApproval: Bool { get }
    /// For tools with side effects or that reach the network: what the user
    /// is asked to approve before `run` (PLAN §5.7: side effects need you).
    /// `nil` runs without asking. Throwing rejects the arguments before the
    /// user is asked anything.
    @MainActor func confirmation(for arguments: JSONValue) throws -> ActionRequest?
    /// Returns the text sent back to the model as the tool result. Throwing
    /// reports the error to the model (as an error result) rather than
    /// failing the turn.
    @MainActor func run(arguments: JSONValue) async throws -> String
}

public extension StrategistTool {
    @MainActor func confirmation(for arguments: JSONValue) throws -> ActionRequest? { nil }
}

/// An action waiting for the user's approval, shown as a confirmation chip.
public struct ActionRequest: Equatable, Sendable {
    public let tool: String
    /// What will happen, e.g. "Read a web page".
    public let title: String
    /// Exactly what it will act on, e.g. the full URL.
    public let detail: String

    public init(tool: String, title: String, detail: String) {
        self.tool = tool
        self.title = title
        self.detail = detail
    }
}

public enum StrategistEvent: Equatable {
    case textDelta(String)
    case toolCall(name: String, arguments: JSONValue)
    case awaitingConfirmation(ActionRequest)
    case confirmationResolved(ActionRequest, approved: Bool)
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
    /// - Parameter confirm: asks the user to approve an action; nothing
    ///   that needs approval runs without it. The default declines.
    public func run(request: LLMRequest,
                    tools: [any StrategistTool],
                    confirm: (ActionRequest) async -> Bool = { _ in false },
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
                let result = await execute(call, tools: tools, confirm: confirm, onEvent: onEvent)
                produced.append(result)
                request.messages.append(result)
            }
        }
        return produced
    }

    private func execute(_ call: LLMToolCall,
                         tools: [any StrategistTool],
                         confirm: (ActionRequest) async -> Bool,
                         onEvent: (StrategistEvent) -> Void) async -> LLMChatMessage {
        onEvent(.toolCall(name: call.name, arguments: call.arguments))
        guard let tool = tools.first(where: { $0.definition.name == call.name }) else {
            let message = "Unknown tool '\(call.name)'."
            onEvent(.toolResult(name: call.name, result: message, isError: true))
            return .toolResult(callID: call.id, content: message, isError: true)
        }
        do {
            if let action = try tool.confirmation(for: call.arguments) {
                onEvent(.awaitingConfirmation(action))
                let approved = await confirm(action)
                onEvent(.confirmationResolved(action, approved: approved))
                guard approved else {
                    let message = "The user declined: \(action.title) (\(action.detail)). Don't retry it; carry on without it."
                    onEvent(.toolResult(name: call.name, result: message, isError: true))
                    return .toolResult(callID: call.id, content: message, isError: true)
                }
            }
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
