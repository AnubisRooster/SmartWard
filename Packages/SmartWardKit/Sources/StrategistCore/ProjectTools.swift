import Foundation
import BYOKLLMKit
import KnowledgeStore

public enum ProjectToolError: LocalizedError, Equatable {
    case invalidArguments(String)

    public var errorDescription: String? {
        switch self {
        case .invalidArguments(let detail): return "Invalid arguments: \(detail)"
        }
    }
}

/// Read-only: the project's goal, constraints, links and open items.
public struct ProjectStateTool: StrategistTool {
    public let project: Project

    public init(project: Project) {
        self.project = project
    }

    public var definition: LLMTool {
        LLMTool(name: "list_project_state",
                description: "Returns the current project's goal, constraints, linked repos, and open decisions, questions, action items, assumptions and risks.",
                inputSchema: ["type": "object", "properties": [:]])
    }

    @MainActor
    public func run(arguments: JSONValue) async throws -> String {
        let snapshot = ProjectSnapshot(project: project)
        let context = StrategistPrompt.projectContext(snapshot)
        return snapshot.openItems.isEmpty ? context + "\nNo open items." : context
    }
}

/// Records a durable strategy item (decision, open question, ...) on the
/// project. It persists and feeds the brief, so you approve each one
/// (PLAN §5.7): text in an article can't plant a "decision".
public struct RecordStrategyItemTool: StrategistTool {
    public let project: Project

    public init(project: Project) {
        self.project = project
    }

    public var definition: LLMTool {
        let kinds: [JSONValue] = StrategyItemKind.allCases.map { .string($0.rawValue) }
        let kindSchema: JSONValue = ["type": "string", "enum": .array(kinds)]
        let textSchema: JSONValue = ["type": "string", "description": "One self-contained sentence."]
        let properties: JSONValue = ["kind": kindSchema, "text": textSchema]
        return LLMTool(name: "record_strategy_item",
                       description: "Saves a decision, open question, action item, assumption or risk to the project so it persists across conversations. The user approves each one.",
                       inputSchema: ["type": "object", "properties": properties, "required": ["kind", "text"]])
    }

    private struct Arguments: Decodable {
        let kind: String
        let text: String
    }

    /// Longer than this isn't one sentence.
    public static let maxLength = 500

    func parse(_ arguments: JSONValue) throws -> (kind: StrategyItemKind, text: String) {
        let parsed: Arguments
        do {
            parsed = try arguments.decode(as: Arguments.self)
        } catch {
            throw ProjectToolError.invalidArguments("expected {kind, text}")
        }
        guard let kind = StrategyItemKind(rawValue: parsed.kind) else {
            throw ProjectToolError.invalidArguments("unknown kind '\(parsed.kind)'")
        }
        let text = parsed.text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !text.isEmpty else {
            throw ProjectToolError.invalidArguments("text is empty")
        }
        guard text.count <= Self.maxLength else {
            throw ProjectToolError.invalidArguments("text is longer than \(Self.maxLength) characters")
        }
        return (kind, text)
    }

    @MainActor
    public func confirmation(for arguments: JSONValue) throws -> ActionRequest? {
        let item = try parse(arguments)
        return ActionRequest(tool: "record_strategy_item",
                             title: "Save \(StrategistPrompt.article(for: item.kind)) \(StrategistPrompt.label(for: item.kind)) to \(project.name)",
                             detail: item.text)
    }

    @MainActor
    public func run(arguments: JSONValue) async throws -> String {
        let item = try parse(arguments)
        project.items?.append(StrategyItem(kind: item.kind, text: item.text))
        return "Recorded \(StrategistPrompt.label(for: item.kind)): \(item.text)"
    }
}

/// Proposes a revised project brief. Nothing changes until the user accepts
/// the diff in the project (PLAN §5.7), so this needs no confirmation.
public struct ProposeBriefUpdateTool: StrategistTool {
    public let project: Project

    public init(project: Project) {
        self.project = project
    }

    public var definition: LLMTool {
        let markdown: JSONValue = ["type": "string", "description": "The complete revised brief in Markdown, not just the changes."]
        let rationale: JSONValue = ["type": "string", "description": "One sentence on what changed and why."]
        let properties: JSONValue = ["markdown": markdown, "rationale": rationale]
        return LLMTool(name: "propose_brief_update",
                       description: "Proposes a revised version of the project's brief. The user reviews the diff and accepts or rejects it; use it when the conversation settles something the brief should reflect.",
                       inputSchema: ["type": "object", "properties": properties, "required": ["markdown", "rationale"]])
    }

    private struct Arguments: Decodable {
        let markdown: String
        let rationale: String?
    }

    @MainActor
    public func run(arguments: JSONValue) async throws -> String {
        guard let parsed = try? arguments.decode(as: Arguments.self) else {
            throw ProjectToolError.invalidArguments("expected {markdown, rationale}")
        }
        let revision = try BriefEditing.propose(parsed.markdown, rationale: parsed.rationale ?? "",
                                                origin: "strategist", for: project)
        let counts = BriefDiff.counts(BriefDiff.lines(from: revision.baseMarkdown, to: revision.proposedMarkdown))
        return "Proposed a brief update (+\(counts.added) −\(counts.removed) lines). The user will accept or reject it in the project; don't treat it as applied."
    }
}
