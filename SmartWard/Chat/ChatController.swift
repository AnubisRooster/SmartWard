import Foundation
import SwiftUI
import Pipeline
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
    /// An action the strategist wants to take, waiting for Approve or Decline.
    private(set) var pendingAction: ActionRequest?
    var errorMessage: String?

    private var approval: CheckedContinuation<Bool, Never>?

    /// Who's on the other end of a turn.
    enum Turn: Equatable {
        /// Typed in the composer: approval cards can be tapped.
        case typed
        /// A voice conversation: nobody can tap a card, so only
        /// auto-approved actions run.
        case spoken
        /// Siri or Shortcuts: nobody to ask, so every action is declined.
        case unattended

        var isHandsFree: Bool { self != .typed }
    }

    /// `nil` uses your provider with model fallback (NFR-5).
    private let llm: (any LLMCompleting)?

    init(llm: (any LLMCompleting)? = nil) {
        self.llm = llm
    }

    /// Sends the typed draft.
    /// - Returns: the assistant's reply text, or `nil` if the turn produced
    ///   none (an error, or a tool-only round).
    @discardableResult
    func send(in conversation: Conversation, context: ModelContext) async -> String? {
        let text = draft.trimmingCharacters(in: .whitespacesAndNewlines)
        return await run(text, in: conversation, context: context, turn: .typed)
    }

    /// Sends a spoken turn. Leaves the typed draft alone. Hands-free there's
    /// nobody to tap an approval card, so tools that would need one aren't
    /// offered, and any action that isn't auto-approved is declined rather
    /// than left waiting.
    @discardableResult
    func sendSpoken(_ text: String, in conversation: Conversation, context: ModelContext) async -> String? {
        await run(text.trimmingCharacters(in: .whitespacesAndNewlines), in: conversation, context: context,
                  turn: .spoken)
    }

    /// Sends a question from Siri or Shortcuts. Nobody can approve anything,
    /// so tools that would need approval aren't offered, and any action is
    /// declined.
    @discardableResult
    func sendUnattended(_ text: String, in conversation: Conversation, context: ModelContext) async -> String? {
        await run(text.trimmingCharacters(in: .whitespacesAndNewlines), in: conversation, context: context,
                  turn: .unattended)
    }

    private func run(_ text: String, in conversation: Conversation, context: ModelContext,
                     turn: Turn) async -> String? {
        guard !text.isEmpty, !isRunning else { return nil }
        guard let provider = LLMProvider(rawValue: conversation.provider) else {
            errorMessage = "This chat's provider '\(conversation.provider)' isn't available. Start a new chat."
            return nil
        }

        if turn == .typed { draft = "" }
        errorMessage = nil
        streamingText = ""
        activity = []
        isRunning = true
        defer {
            isRunning = false
            streamingText = ""
            // Kept even if the turn below throws: an approval you gave
            // before a failed fetch shouldn't be lost, only to look, next
            // time, like it was never asked for.
            if !activity.isEmpty {
                conversation.messages?.append(Message(role: "tool", content: activity.joined(separator: "\n")))
            }
        }

        conversation.messages?.append(Message(role: "user", content: text))
        conversation.updatedAt = Date()
        if conversation.title.isEmpty {
            conversation.title = String(text.prefix(60))
        }

        let project = conversation.project
        var system = StrategistPrompt.system(mode: conversation.mode,
                                             project: project.map { ProjectSnapshot(project: $0) })

        // GraphRAG: library passages for this turn, fenced as untrusted (PLAN §5.7).
        let ledger = ReferenceLedger()
        let conversationID = conversation.id
        let found = await SearchController.shared.passages(for: text, excludingConversation: conversationID,
                                                           context: context)
        let references = ledger.register(found)
        system += "\n\n" + ReferenceContext.guidance
        var allowed = StrategistPrompt.allowedTools(for: conversation.mode)
        if turn.isHandsFree {
            allowed = ActionTools.handsFreeTools(allowed, autoApprove: turn == .spoken && autoApproveEnabled)
            system += "\n\n" + VoiceTurn.promptNote
        }
        if !allowed.isDisjoint(with: ["fetch_url", "add_source"]) {
            system += "\n\n" + ActionTools.guidance
        }
        if !references.isEmpty {
            system += "\n\n" + ReferenceContext.render(references)
        }
        let history = ConversationHistory.messages(from: conversation.messages ?? [])
        let request = LLMRequest(provider: provider,
                                 model: conversation.model,
                                 messages: [LLMChatMessage.system(system)] + history,
                                 maxTokens: 4096)
        var tools: [any StrategistTool] = [
            SearchCorpusTool(ledger: ledger) { query in
                await SearchController.shared.passages(for: query, excludingConversation: conversationID,
                                                       context: context)
            },
            GraphNeighborsTool(context: context),
            OpenArticleTool(ledger: ledger, context: context),
            FetchURLTool(fetcher: IngestController.shared.fetcher, ledger: ledger,
                        context: context, localOnly: conversation.offTheRecord),
            AddSourceTool(context: context),
        ]
        if let project {
            tools += [ProjectStateTool(project: project), RecordStrategyItemTool(project: project),
                      ProposeBriefUpdateTool(project: project)]
        }
        tools = tools.filter { allowed.contains($0.definition.name) }

        let client: any LLMCompleting
        if let llm {
            client = llm
        } else {
            client = ModelCatalogController.shared.fallbackLLM()
        }
        let runner = StrategistRunner(llm: client)
        do {
            let produced = try await runner.run(request: request, tools: tools,
                                                confirm: { action in
                                                    await self.requestApproval(action, turn: turn)
                                                }) { event in
                self.handle(event, provider: provider, conversation: conversation, context: context, turn: turn)
            }
            let reply = produced
                .filter { $0.role == .assistant }
                .map(\.text)
                .filter { !$0.isEmpty }
                .joined(separator: "\n\n")
            if !reply.isEmpty {
                let message = Message(role: "assistant", content: reply)
                message.referencesJSON = Self.referencesJSON(ledger.passages)
                conversation.messages?.append(message)
            }
            conversation.updatedAt = Date()
            // Add this exchange to the knowledge graph once it has settled.
            Task {
                try? await Task.sleep(nanoseconds: UInt64((PipelineRunner.turnSettleTime + 1) * 1_000_000_000))
                await PipelineController.shared.process(context: context)
            }
            return reply.isEmpty ? nil : reply
        } catch {
            errorMessage = error.localizedDescription
            return nil
        }
    }

    /// Answers the pending action. Leaving the chat declines it.
    func resolve(approved: Bool) {
        guard let approval else { return }
        self.approval = nil
        pendingAction = nil
        approval.resume(returning: approved)
    }

    private func requestApproval(_ action: ActionRequest, turn: Turn) async -> Bool {
        switch decision(for: action, turn: turn) {
        case .approve:
            return true
        case .decline:
            return false
        case .ask:
            resolve(approved: false)
            return await withCheckedContinuation { continuation in
                approval = continuation
                pendingAction = action
            }
        }
    }

    /// Settings → "Approve fetches and new sources automatically." Never
    /// covers record_strategy_item: that changes what the project
    /// remembers, not just what the strategist reads.
    private var autoApproveEnabled: Bool {
        UserDefaults.standard.bool(forKey: ActionTools.autoApproveKey)
    }

    /// How `action` is answered; the activity log reports the same answer.
    private func decision(for action: ActionRequest, turn: Turn) -> ApprovalDecision {
        ActionTools.decision(for: action.tool, autoApprove: autoApproveEnabled,
                             handsFree: turn.isHandsFree, declinesAll: turn == .unattended)
    }

    /// What a reply was given, for its Sources list: text is trimmed to a teaser.
    static func referencesJSON(_ passages: [RetrievedPassage]) -> String? {
        guard !passages.isEmpty else { return nil }
        let stored = passages.map { passage -> RetrievedPassage in
            var copy = passage
            copy.text = String(passage.text.prefix(280))
            return copy
        }
        guard let data = try? JSONEncoder().encode(stored) else { return nil }
        return String(data: data, encoding: .utf8)
    }

    private func handle(_ event: StrategistEvent, provider: LLMProvider,
                        conversation: Conversation, context: ModelContext, turn: Turn) {
        switch event {
        case .textDelta(let text):
            streamingText += text
        case .toolCall(let name, _):
            activity.append("Using \(name)…")
        case .awaitingConfirmation(let action):
            switch decision(for: action, turn: turn) {
            case .approve:
                activity.append("Auto-approved: \(action.title) (\(action.detail))")
            case .decline where turn == .spoken:
                activity.append("Skipped in a voice conversation: \(action.title) (\(action.detail))")
            case .decline:
                activity.append("Declined, with nobody to ask: \(action.title) (\(action.detail))")
            case .ask:
                activity.append("Asking you: \(action.title)")
            }
        case .confirmationResolved(let action, let approved):
            // Only answers you gave; the others logged themselves above.
            if decision(for: action, turn: turn) == .ask {
                activity.append("\(approved ? "Approved" : "Declined"): \(action.title) (\(action.detail))")
            }
        case .toolResult(let name, let result, let isError):
            activity.append(isError ? "\(name) failed: \(result)" : "\(name): \(result.prefix(120))")
        case .roundFinished(let response):
            // Text from earlier rounds stays visible while tools run.
            if !streamingText.isEmpty && !response.toolCalls.isEmpty {
                streamingText += "\n\n"
            }
            if let usage = response.usage {
                UsageLedger.record(provider: provider.rawValue, model: response.model ?? conversation.model,
                                   feature: "chat", inputTokens: usage.inputTokens, outputTokens: usage.outputTokens,
                                   reportedCostUSD: usage.costUSD, context: context)
            }
        }
    }
}

/// Settings → lets the strategist read pages and follow sources without a
/// card every time, in every chat. Off by default: this is what stands
/// between a poisoned page and it fetching or following more on its own
/// (PLAN §5.7). record_strategy_item is never covered here — it always asks,
/// since it changes what a project remembers, not just what gets read.
struct ActionApprovalSettingsSection: View {
    @AppStorage(ActionTools.autoApproveKey) private var autoApprove = false

    var body: some View {
        Section {
            Toggle("Approve fetches and new sources automatically", isOn: $autoApprove)
        } header: {
            Text("Strategist actions")
        } footer: {
            Text(autoApprove
                 ? "On: fetch_url and add_source run the moment the strategist calls them, in every chat, with no card to review first. Saving a decision or open item to a project still always asks."
                 : "Off: reading a web page or following a new source always shows a card to approve first, so text on a page can't get it to fetch or follow more on its own.")
        }
    }
}
