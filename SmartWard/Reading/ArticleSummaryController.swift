import Foundation
import Observation
import SwiftData
import FoundationModels
import KnowledgeStore
import Pipeline

/// T1 article summaries: Apple Foundation Models, on-device. The default for
/// every article, and the only tier that ever reads private content.
///
/// The model runs with `permissiveContentTransformations`. Apple's default
/// guardrails scan the article going in and the summary coming out, and turn
/// down plenty of harmless news and posts ("Detected content likely to be
/// unsafe"); the permissive level exists for transforming text you were given,
/// such as summarizing an article. It only applies to plain-text answers (with
/// guided generation it behaves like the default), so the model answers in a
/// simple labeled form that `ArticleSummaryText` reads.
struct FoundationModelsArticleSummarizer: ArticleSummarizing {
    let tier = ExtractionTier.onDevice
    /// Leaves room in the 4,096-token window for the instructions and the answers.
    let maxInputCharacters = 6_000

    func summarize(title: String, text: String) async throws -> ArticleSummaryOutput {
        let model = SystemLanguageModel(useCase: .general, guardrails: .permissiveContentTransformations)
        let session = LanguageModelSession(model: model, instructions: ArticleSummaryPrompt.plainTextInstructions)
        let prompt = ArticleSummaryPrompt.user(title: title, text: String(text.prefix(maxInputCharacters)))
        let reply = try await session.respond(to: prompt).content
        // Even in this mode the model can answer a sensitive article with a
        // refusal in words; that has no headings, so it isn't shown as a summary.
        guard let draft = ArticleSummaryText.parse(reply) else { throw ArticleSummaryError.declined }
        return ArticleSummaryOutput(draft: draft)
    }
}

/// Article summaries follow the same routing as the knowledge graph (D2,
/// D5): on-device first, your provider only where extraction may use it and
/// only while today's budget allows.
///
/// They're written when an article is ingested (the pipeline does it once the
/// article is indexed), so they're ready when it's opened. This controller is
/// the fallback for what the pipeline hasn't reached: items it left out
/// (off-topic, older than a week, linked-repo docs), a very fresh one, a
/// preview whose full text was just loaded, and "Summarize again".
@MainActor
@Observable
final class ArticleSummaryController {
    static let shared = ArticleSummaryController()

    /// The summarizers available right now, for the pipeline and the reader.
    static func makeSummarizer() -> ArticleSummarizer {
        var onDevice: (any ArticleSummarizing)?
        if SystemLanguageModel.default.isAvailable {
            onDevice = FoundationModelsArticleSummarizer()
        }
        var byok: BYOKArticleSummarizer?
        if let settings = ExtractionSettings.byokSettings() {
            byok = BYOKArticleSummarizer(client: ModelCatalogController.shared.fallbackLLM(),
                                         provider: settings.provider, model: settings.model)
        }
        return ArticleSummarizer(onDevice: onDevice, byok: byok, budget: BudgetSettings.current)
    }

    enum State: Equatable {
        case generating
        /// No summarizer may read this article right now: Apple Intelligence
        /// is off, and there's no provider it may use.
        case unavailable
        /// Not enough text yet, e.g. only a headline or a short preview was saved.
        case tooShort
        case failed(String)
    }

    /// What to tell the reader. Apple's safety errors read as "Detected
    /// content likely to be unsafe", which sounds like a verdict on the
    /// article; it's the on-device model declining.
    static func message(for error: Error) -> String {
        if let generation = error as? LanguageModelSession.GenerationError {
            switch generation {
            case .guardrailViolation, .refusal:
                return "Apple Intelligence's safety check declined to summarize this article."
            default:
                break
            }
        }
        return error.localizedDescription
    }

    /// What's happening for each article that isn't simply summarized.
    private(set) var states: [UUID: State] = [:]

    /// Makes sure `article` has a summary for its current text.
    /// - Parameter force: write a new one even if the saved one is current.
    func ensure(_ article: Article, context: ModelContext, force: Bool = false) async {
        let id = article.id
        if !force, ArticleSummarizer.cached(for: article) != nil {
            states[id] = nil
            return
        }
        guard states[id] != .generating else { return }
        states[id] = .generating

        var links: [UUID: ProjectLink] = [:]
        for link in (try? context.fetch(FetchDescriptor<ProjectLink>())) ?? [] {
            if let sourceID = link.sourceID { links[sourceID] = link }
        }
        let summarizer = Self.makeSummarizer()

        do {
            if try await summarizer.summarize(article, links: links, context: context, force: force) != nil {
                try? context.save()
                states[id] = nil
            } else {
                states[id] = .unavailable
            }
        } catch ArticleSummaryError.tooShort {
            states[id] = .tooShort
        } catch {
            // Leaving the article cancels this; that isn't a failure.
            states[id] = Task.isCancelled ? nil : .failed(Self.message(for: error))
        }
    }
}
