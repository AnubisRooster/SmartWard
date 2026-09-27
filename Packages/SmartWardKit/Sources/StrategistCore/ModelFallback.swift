import Foundation
import BYOKLLMKit
import ModelCatalogKit

/// Which other models to try when the chosen one is rate-limited or down
/// (NFR-5): your own fallback list for the provider first, then, on
/// OpenRouter, models from the catalog that can do the job and cost no more.
public struct ModelFallback: Sendable {
    public var isEnabled: Bool
    /// Your fallback models per provider, in order.
    public var userFallbacks: [LLMProvider: [String]]
    /// The OpenRouter catalog (ModelCatalogKit).
    public var catalog: [CatalogEntry]
    /// How many catalog models to add after yours.
    public var automaticLimit: Int

    public init(isEnabled: Bool = true, userFallbacks: [LLMProvider: [String]] = [:],
                catalog: [CatalogEntry] = [], automaticLimit: Int = 2) {
        self.isEnabled = isEnabled
        self.userFallbacks = userFallbacks
        self.catalog = catalog
        self.automaticLimit = automaticLimit
    }

    /// Models to try after `request.model`, in order, without repeats.
    public func alternatives(for request: LLMRequest) -> [String] {
        guard isEnabled else { return [] }
        var candidates = (userFallbacks[request.provider] ?? [])
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
        if request.provider == .openrouter {
            candidates += catalogAlternatives(primary: request.model,
                                              needsTools: !request.tools.isEmpty,
                                              needsStructuredOutput: request.responseFormat != nil)
        }
        var seen: Set<String> = [request.model]
        return candidates.filter { !$0.isEmpty && seen.insert($0).inserted }
    }

    /// Catalog models that support what the request needs, have a usable
    /// context window, aren't rate-limited free tiers, and cost no more than
    /// the primary. The same maker's models come first, closest in price to
    /// the primary; then others in `SelectionPolicy` order.
    func catalogAlternatives(primary: String, needsTools: Bool, needsStructuredOutput: Bool) -> [String] {
        func price(_ entry: CatalogEntry) -> Double { entry.pricing.prompt + entry.pricing.completion }
        let ceiling = catalog.first { $0.id == primary }.map(price)
        let eligible = catalog.filter { entry in
            let parameters = Set(entry.supportedParameters ?? [])
            guard entry.id != primary, !entry.id.hasSuffix(":free"),
                  entry.pricing.prompt >= 0, entry.pricing.completion >= 0,
                  (entry.contextLength ?? 0) >= 16_000 else { return false }
            if needsTools && !parameters.contains("tools") { return false }
            if needsStructuredOutput && parameters.isDisjoint(with: ["structured_outputs", "response_format"]) { return false }
            if let ceiling, price(entry) > ceiling { return false }
            return true
        }
        let ranked = SelectionPolicy(role: .chat, catalog: eligible).rank()
        let primaryMaker = Self.maker(of: primary)
        let sameMaker = ranked
            .filter { primaryMaker != nil && Self.maker(of: $0.id) == primaryMaker }
            .sorted { price($0) > price($1) }
        let others = ranked.filter { primaryMaker == nil || Self.maker(of: $0.id) != primaryMaker }
        return (sameMaker + others).prefix(automaticLimit).map(\.id)
    }

    /// "anthropic" for "anthropic/claude-sonnet-4.5".
    static func maker(of model: String) -> String? {
        guard let slash = model.firstIndex(of: "/") else { return nil }
        return String(model[..<slash])
    }
}

/// Retries a request on other models when the provider says the chosen one
/// is rate-limited, overloaded or failing (429, 408, 5xx). Other errors, and
/// a stream that already produced output, are passed through unchanged.
public struct FallbackLLM: LLMCompleting {
    public typealias Alternatives = @Sendable (LLMRequest) -> [String]

    private let base: any LLMCompleting
    private let alternatives: Alternatives
    /// Including the first try.
    public var maxAttempts: Int

    public init(base: any LLMCompleting, maxAttempts: Int = 3, alternatives: @escaping Alternatives) {
        self.base = base
        self.maxAttempts = maxAttempts
        self.alternatives = alternatives
    }

    /// The chosen model, then the alternatives, up to `maxAttempts`.
    func models(for request: LLMRequest) -> [String] {
        var seen = Set<String>()
        let all = ([request.model] + alternatives(request)).filter { seen.insert($0).inserted }
        return Array(all.prefix(max(1, maxAttempts)))
    }

    static func shouldRotate(after error: Error) -> Bool {
        (error as? LLMCompletionError)?.isRetryable ?? false
    }

    public func complete(_ request: LLMRequest) async throws -> LLMResponse {
        let models = models(for: request)
        for (index, model) in models.enumerated() {
            var attempt = request
            attempt.model = model
            do {
                return try await base.complete(attempt)
            } catch {
                guard Self.shouldRotate(after: error), index < models.count - 1 else { throw error }
            }
        }
        throw LLMCompletionError.malformedResponse("No model to try.")
    }

    public func stream(_ request: LLMRequest) -> AsyncThrowingStream<LLMStreamEvent, Error> {
        let models = models(for: request)
        let base = self.base
        return AsyncThrowingStream { continuation in
            let task = Task {
                for (index, model) in models.enumerated() {
                    var attempt = request
                    attempt.model = model
                    var started = false
                    do {
                        for try await event in base.stream(attempt) {
                            started = true
                            continuation.yield(event)
                        }
                        continuation.finish()
                        return
                    } catch {
                        if !started, Self.shouldRotate(after: error), index < models.count - 1, !Task.isCancelled {
                            continue
                        }
                        continuation.finish(throwing: error)
                        return
                    }
                }
                continuation.finish()
            }
            continuation.onTermination = { _ in task.cancel() }
        }
    }
}
