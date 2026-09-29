import Foundation
import Observation
import SwiftData
import FoundationModels
import KnowledgeStore
import Pipeline

/// T1 article summaries: Apple Foundation Models with guided generation,
/// on-device. The default for every article, and the only tier that ever
/// reads private content.
struct FoundationModelsArticleSummarizer: ArticleSummarizing {
    let tier = ExtractionTier.onDevice
    /// Leaves room in the 4,096-token window for the instructions and the answers.
    let maxInputCharacters = 6_000

    @Generable
    struct Generated {
        @Guide(description: "The subject, and what kind of piece it is (paper, release notes, opinion, tutorial, news)",
               .maximumCount(2))
        var about: [String]
        @Guide(description: "The main claims or findings, stated plainly", .maximumCount(2))
        var says: [String]
        @Guide(description: "The data, experiments, examples or reasoning offered; say so if there are none",
               .maximumCount(2))
        var evidence: [String]
        @Guide(description: "Who or what it affects, and why that is significant", .maximumCount(2))
        var matters: [String]
        @Guide(description: "The facts worth keeping: numbers, names, decisions, next steps", .maximumCount(2))
        var remember: [String]
    }

    func summarize(title: String, text: String) async throws -> ArticleSummaryOutput {
        let session = LanguageModelSession(instructions: ArticleSummaryPrompt.instructions)
        let prompt = ArticleSummaryPrompt.user(title: title, text: String(text.prefix(maxInputCharacters)))
        let generated = try await session.respond(to: prompt, generating: Generated.self).content
        return ArticleSummaryOutput(draft: ArticleSummary.Draft(about: generated.about, says: generated.says,
                                                                evidence: generated.evidence,
                                                                matters: generated.matters,
                                                                remember: generated.remember))
    }
}

/// Writes and tracks article summaries for the reader. It follows the same
/// routing as the knowledge graph (D2, D5): on-device first, your provider
/// only where extraction may use it and only while today's budget allows.
@MainActor
@Observable
final class ArticleSummaryController {
    static let shared = ArticleSummaryController()

    enum State: Equatable {
        case generating
        /// No summarizer may read this article right now: Apple Intelligence
        /// is off, and there's no provider it may use.
        case unavailable
        /// Not enough text yet, e.g. only a headline or a short preview was saved.
        case tooShort
        case failed(String)
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
        var onDevice: (any ArticleSummarizing)?
        if SystemLanguageModel.default.isAvailable {
            onDevice = FoundationModelsArticleSummarizer()
        }
        var byok: BYOKArticleSummarizer?
        if let settings = ExtractionSettings.byokSettings() {
            byok = BYOKArticleSummarizer(client: ModelCatalogController.shared.fallbackLLM(),
                                         provider: settings.provider, model: settings.model)
        }
        let summarizer = ArticleSummarizer(onDevice: onDevice, byok: byok, budget: BudgetSettings.current)

        do {
            if try await summarizer.summarize(article, links: links, context: context) != nil {
                try? context.save()
                states[id] = nil
            } else {
                states[id] = .unavailable
            }
        } catch ArticleSummaryError.tooShort {
            states[id] = .tooShort
        } catch {
            // Leaving the article cancels this; that isn't a failure.
            states[id] = Task.isCancelled ? nil : .failed(error.localizedDescription)
        }
    }
}
