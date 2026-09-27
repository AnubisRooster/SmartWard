import XCTest
import BYOKLLMKit
@testable import StrategistCore

/// Plays back one scripted event list per `stream` call and records requests.
final class ScriptedLLM: LLMCompleting, @unchecked Sendable {
    private var scripts: [[LLMStreamEvent]]
    private(set) var requests: [LLMRequest] = []

    init(_ scripts: [[LLMStreamEvent]]) {
        self.scripts = scripts
    }

    func complete(_ request: LLMRequest) async throws -> LLMResponse {
        throw StrategistError.incompleteResponse
    }

    func stream(_ request: LLMRequest) -> AsyncThrowingStream<LLMStreamEvent, Error> {
        requests.append(request)
        let events = scripts.isEmpty ? [] : scripts.removeFirst()
        return AsyncThrowingStream { continuation in
            for event in events { continuation.yield(event) }
            continuation.finish()
        }
    }
}

func reply(_ text: String, calls: [LLMToolCall] = []) -> LLMResponse {
    LLMResponse(message: .assistant(text, toolCalls: calls),
                stopReason: calls.isEmpty ? .endTurn : .toolUse,
                usage: LLMUsage(inputTokens: 10, outputTokens: 5),
                model: "m")
}

/// Echoes its arguments; records how often it ran.
final class EchoTool: StrategistTool {
    private(set) var calls: [JSONValue] = []
    var definition: LLMTool { LLMTool(name: "echo", description: "Echo.", inputSchema: ["type": "object"]) }

    @MainActor
    func run(arguments: JSONValue) async throws -> String {
        calls.append(arguments)
        return "echo:\(arguments.jsonString)"
    }
}

struct FailingTool: StrategistTool {
    var definition: LLMTool { LLMTool(name: "fail", description: "Fails.", inputSchema: ["type": "object"]) }

    @MainActor
    func run(arguments: JSONValue) async throws -> String {
        throw ProjectToolError.invalidArguments("nope")
    }
}

final class StrategistRunnerTests: XCTestCase {
    private let base = LLMRequest(provider: .openrouter, model: "m", messages: [.system("sys"), .user("hi")])

    @MainActor
    func testPlainReplyStreamsTextAndReturnsOneMessage() async throws {
        let llm = ScriptedLLM([[.textDelta("Hel"), .textDelta("lo"), .completed(reply("Hello"))]])
        var events: [StrategistEvent] = []
        let produced = try await StrategistRunner(llm: llm).run(request: base, tools: []) { events.append($0) }

        XCTAssertEqual(produced, [.assistant("Hello")])
        XCTAssertEqual(events, [.textDelta("Hel"), .textDelta("lo"), .roundFinished(reply("Hello"))])
        XCTAssertEqual(llm.requests.first?.tools, [], "no tools sent when none are registered")
    }

    @MainActor
    func testToolRoundTrip() async throws {
        let call = LLMToolCall(id: "c1", name: "echo", arguments: ["q": "lora"])
        let llm = ScriptedLLM([
            [.toolCall(call), .completed(reply("", calls: [call]))],
            [.textDelta("Done."), .completed(reply("Done."))],
        ])
        let tool = EchoTool()
        var events: [StrategistEvent] = []
        let produced = try await StrategistRunner(llm: llm).run(request: base, tools: [tool]) { events.append($0) }

        let result = LLMChatMessage.toolResult(callID: "c1", content: #"echo:{"q":"lora"}"#)
        XCTAssertEqual(produced, [.assistant("", toolCalls: [call]), result, .assistant("Done.")])
        XCTAssertEqual(tool.calls, [["q": "lora"]])
        XCTAssertEqual(llm.requests.count, 2)
        XCTAssertEqual(llm.requests[0].tools.map(\.name), ["echo"])
        XCTAssertEqual(llm.requests[1].messages.suffix(2), [.assistant("", toolCalls: [call]), result])
        XCTAssertTrue(events.contains(.toolCall(name: "echo", arguments: ["q": "lora"])))
        XCTAssertTrue(events.contains(.toolResult(name: "echo", result: #"echo:{"q":"lora"}"#, isError: false)))
    }

    @MainActor
    func testUnknownAndFailingToolsReportErrorsToTheModel() async throws {
        let unknown = LLMToolCall(id: "c1", name: "missing", arguments: [:])
        let failing = LLMToolCall(id: "c2", name: "fail", arguments: [:])
        let llm = ScriptedLLM([
            [.completed(reply("", calls: [unknown, failing]))],
            [.completed(reply("Sorry."))],
        ])
        let produced = try await StrategistRunner(llm: llm).run(request: base, tools: [FailingTool()]) { _ in }

        XCTAssertEqual(produced.count, 4)
        XCTAssertEqual(produced[1].toolResults.first?.isError, true)
        XCTAssertEqual(produced[1].toolResults.first?.content, "Unknown tool 'missing'.")
        XCTAssertEqual(produced[2].toolResults.first?.isError, true)
        XCTAssertEqual(produced[2].toolResults.first?.content, "Invalid arguments: nope")
    }

    @MainActor
    func testFinalRoundForbidsToolsSoTheTurnEnds() async throws {
        let call = LLMToolCall(id: "c", name: "echo", arguments: [:])
        let llm = ScriptedLLM([
            [.completed(reply("", calls: [call]))],
            [.completed(reply("", calls: [call]))],
            [.completed(reply("Final answer."))],
        ])
        let runner = StrategistRunner(llm: llm, maxToolRounds: 2)
        let produced = try await runner.run(request: base, tools: [EchoTool()]) { _ in }

        XCTAssertEqual(llm.requests.count, 3)
        XCTAssertNil(llm.requests[0].toolChoice)
        XCTAssertNil(llm.requests[1].toolChoice)
        XCTAssertEqual(llm.requests[2].toolChoice, LLMToolChoice.none)
        XCTAssertEqual(produced.last, .assistant("Final answer."))
    }

    @MainActor
    func testStreamEndingWithoutCompletionThrows() async {
        let llm = ScriptedLLM([[.textDelta("partial")]])
        do {
            _ = try await StrategistRunner(llm: llm).run(request: base, tools: []) { _ in }
            XCTFail("expected incompleteResponse")
        } catch {
            XCTAssertEqual(error as? StrategistError, .incompleteResponse)
        }
    }
}
