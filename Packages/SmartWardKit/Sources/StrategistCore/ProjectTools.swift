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

/// Records a durable strategy item (decision, open question, ...) on the project.
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
                       description: "Saves a decision, open question, action item, assumption or risk to the project so it persists across conversations.",
                       inputSchema: ["type": "object", "properties": properties, "required": ["kind", "text"]])
    }

    private struct Arguments: Decodable {
        let kind: String
        let text: String
    }

    @MainActor
    public func run(arguments: JSONValue) async throws -> String {
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
        project.items?.append(StrategyItem(kind: kind, text: text))
        return "Recorded \(StrategistPrompt.label(for: kind)): \(text)"
    }
}
