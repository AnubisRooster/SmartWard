import XCTest
import BYOKLLMKit
import ModelCatalogKit
@testable import StrategistCore

/// Fails or succeeds per model, and records which models were tried.
final class FlakyLLM: LLMCompleting, @unchecked Sendable {
    enum Behavior {
        case ok
        case fail(LLMCompletionError)
        /// Streams some text, then fails.
        case failMidStream(LLMCompletionError)
    }

    private let behaviors: [String: Behavior]
    private(set) var tried: [String] = []

    init(_ behaviors: [String: Behavior]) {
        self.behaviors = behaviors
    }

    private func response(_ model: String) -> LLMResponse {
        LLMResponse(message: .assistant("from \(model)"), stopReason: .endTurn, usage: nil, model: model)
    }

    func complete(_ request: LLMRequest) async throws -> LLMResponse {
        tried.append(request.model)
        switch behaviors[request.model] ?? .ok {
        case .ok: return response(request.model)
        case .fail(let error), .failMidStream(let error): throw error
        }
    }

    func stream(_ request: LLMRequest) -> AsyncThrowingStream<LLMStreamEvent, Error> {
        tried.append(request.model)
        let behavior = behaviors[request.model] ?? .ok
        let done = response(request.model)
        return AsyncThrowingStream { continuation in
            switch behavior {
            case .ok:
                continuation.yield(.textDelta(done.text))
                continuation.yield(.completed(done))
                continuation.finish()
            case .fail(let error):
                continuation.finish(throwing: error)
            case .failMidStream(let error):
                continuation.yield(.textDelta("partial"))
                continuation.finish(throwing: error)
            }
        }
    }
}

final class FallbackLLMTests: XCTestCase {
    private let request = LLMRequest(provider: .openrouter, model: "a", messages: [.user("hi")])
    private let busy = LLMCompletionError.http(status: 429, body: "rate limited")

    func testRotatesOnRateLimitsAndServerErrorsOnly() async throws {
        let flaky = FlakyLLM(["a": .fail(busy), "b": .fail(.http(status: 503, body: "")), "c": .ok])
        let llm = FallbackLLM(base: flaky) { _ in ["b", "a", "c", "d"] }
        let response = try await llm.complete(request)
        XCTAssertEqual(response.model, "c")
        XCTAssertEqual(flaky.tried, ["a", "b", "c"], "no repeats")

        let badRequest = FlakyLLM(["a": .fail(.http(status: 400, body: "bad"))])
        do {
            _ = try await FallbackLLM(base: badRequest) { _ in ["b"] }.complete(request)
            XCTFail("a bad request isn't retried elsewhere")
        } catch {
            XCTAssertEqual(error as? LLMCompletionError, .http(status: 400, body: "bad"))
        }
        XCTAssertEqual(badRequest.tried, ["a"])

        let allBusy = FlakyLLM(["a": .fail(busy), "b": .fail(busy), "c": .fail(busy)])
        var limited = FallbackLLM(base: allBusy) { _ in ["b", "c"] }
        limited.maxAttempts = 2
        do {
            _ = try await limited.complete(request)
            XCTFail("the last error is reported")
        } catch {
            XCTAssertEqual(error as? LLMCompletionError, busy)
        }
        XCTAssertEqual(allBusy.tried, ["a", "b"])
    }

    func testStreamsRotateOnlyBeforeAnyOutput() async throws {
        let flaky = FlakyLLM(["a": .fail(busy), "b": .ok])
        var events: [LLMStreamEvent] = []
        for try await event in FallbackLLM(base: flaky, alternatives: { _ in ["b"] }).stream(request) {
            events.append(event)
        }
        XCTAssertEqual(events.first, .textDelta("from b"))
        XCTAssertEqual(flaky.tried, ["a", "b"])

        let midway = FlakyLLM(["a": .failMidStream(busy)])
        var partial: [LLMStreamEvent] = []
        do {
            for try await event in FallbackLLM(base: midway, alternatives: { _ in ["b"] }).stream(request) {
                partial.append(event)
            }
            XCTFail("an interrupted reply isn't restarted on another model")
        } catch {
            XCTAssertEqual(error as? LLMCompletionError, busy)
        }
        XCTAssertEqual(partial, [.textDelta("partial")])
        XCTAssertEqual(midway.tried, ["a"])
    }
}

final class ModelFallbackTests: XCTestCase {
    private func entry(_ id: String, _ input: Double, _ output: Double, tools: Bool = true,
                       structured: Bool = true, context: Int = 128_000) -> CatalogEntry {
        var parameters = tools ? ["tools"] : []
        if structured { parameters.append("structured_outputs") }
        return CatalogEntry(id: id, name: nil, pricing: Pricing(prompt: input, completion: output),
                            contextLength: context, architecture: nil, supportedParameters: parameters)
    }

    private var catalog: [CatalogEntry] {
        [
            entry("anthropic/claude-sonnet-4.5", 3e-6, 15e-6),
            entry("anthropic/claude-opus-4", 15e-6, 75e-6),
            entry("anthropic/claude-haiku-4.5", 1e-6, 5e-6),
            entry("anthropic/claude-3-haiku", 0.25e-6, 1.25e-6),
            entry("openai/gpt-4o-mini", 0.15e-6, 0.6e-6),
            entry("meta/llama-3-8b:free", 0, 0),
            entry("mistral/tiny", 0.1e-6, 0.1e-6, tools: false, structured: false),
            entry("small/short-context", 0.1e-6, 0.1e-6, context: 4_000),
            entry("openrouter/auto", -1, -1),
        ]
    }

    func testYourModelsFirstThenCheaperCatalogModelsFromTheSameMaker() {
        let fallback = ModelFallback(userFallbacks: [.openrouter: [" x-ai/grok-4 ", "anthropic/claude-sonnet-4.5", ""]],
                                     catalog: catalog)
        var request = LLMRequest(provider: .openrouter, model: "anthropic/claude-sonnet-4.5", messages: [.user("hi")],
                                 tools: [LLMTool(name: "t", description: "", inputSchema: ["type": "object"])])
        XCTAssertEqual(fallback.alternatives(for: request),
                       ["x-ai/grok-4", "anthropic/claude-haiku-4.5", "anthropic/claude-3-haiku"],
                       "no repeats of the primary, nothing pricier, no free tiers, same maker closest in price first")

        request.tools = []
        var wider = fallback
        wider.automaticLimit = 4
        XCTAssertEqual(wider.catalogAlternatives(primary: request.model, needsTools: false, needsStructuredOutput: false),
                       ["anthropic/claude-haiku-4.5", "anthropic/claude-3-haiku", "mistral/tiny", "openai/gpt-4o-mini"],
                       "then other makers, cheapest first (SelectionPolicy)")
        XCTAssertEqual(wider.catalogAlternatives(primary: request.model, needsTools: false, needsStructuredOutput: true),
                       ["anthropic/claude-haiku-4.5", "anthropic/claude-3-haiku", "openai/gpt-4o-mini"],
                       "structured output needs a model that supports it")
    }

    func testOtherProvidersUseOnlyYourListAndItCanBeTurnedOff() {
        let fallback = ModelFallback(userFallbacks: [.anthropic: ["claude-haiku-4-5"]], catalog: catalog)
        let request = LLMRequest(provider: .anthropic, model: "claude-sonnet-4-5", messages: [.user("hi")])
        XCTAssertEqual(fallback.alternatives(for: request), ["claude-haiku-4-5"])

        var off = fallback
        off.isEnabled = false
        XCTAssertEqual(off.alternatives(for: request), [])
    }
}
