import Foundation
import SwiftData

/// Projects as Markdown (NFR-3): goal, constraints, links, the current brief,
/// strategy items by kind (open first), and the brief's history.
public enum MarkdownExport {

    @MainActor
    public static func projects(context: ModelContext, includePrivate: Bool, now: Date = Date()) throws -> String {
        let projects = try context.fetch(FetchDescriptor<Project>(sortBy: [SortDescriptor(\.createdAt)]))
        var parts = ["# SmartWard projects", "Exported \(day(now)).", ""]
        if projects.isEmpty { parts.append("No projects yet.") }
        for project in projects {
            parts.append(render(project, includePrivate: includePrivate))
        }
        return parts.joined(separator: "\n").trimmingCharacters(in: .whitespacesAndNewlines) + "\n"
    }

    @MainActor
    static func render(_ project: Project, includePrivate: Bool) -> String {
        var lines = ["## \(project.name)\(project.isActive ? "" : " (archived)")", ""]
        if !project.goal.isEmpty { lines += ["**Goal:** \(project.goal)", ""] }
        if !project.constraints.isEmpty { lines += ["**Constraints:** \(project.constraints)", ""] }

        let links = (project.links ?? []).filter { includePrivate || !$0.isPrivate }.sorted { $0.url < $1.url }
        if !links.isEmpty {
            lines.append("**Links:**")
            for link in links {
                lines.append(link.repoFullName.map { name in "- \(name) (\(link.url))" } ?? "- \(link.url)")
            }
            lines.append("")
        }

        lines += ["### Brief", ""]
        let brief = project.brief?.markdown ?? ""
        // Demote the brief's own headings so they nest under this project.
        lines.append(brief.isEmpty ? "_No brief yet._" : demoted(brief, by: 3))
        lines.append("")

        let items = (project.items ?? []).sorted { $0.createdAt < $1.createdAt }
        for kind in StrategyItemKind.allCases {
            let ofKind = items.filter { $0.kind == kind }
            guard !ofKind.isEmpty else { continue }
            lines += ["### \(heading(for: kind))", ""]
            for item in ofKind.sorted(by: { ($0.status == .open ? 0 : 1, $0.createdAt) < ($1.status == .open ? 0 : 1, $1.createdAt) }) {
                let done = item.status != .open
                let status = done ? " _(\(item.status.rawValue))_" : ""
                lines.append("- [\(done ? "x" : " ")] \(item.text)\(status) — \(day(item.createdAt))")
            }
            lines.append("")
        }

        let history = (project.brief?.revisions ?? [])
            .filter { $0.status == .accepted }
            .sorted { $0.createdAt > $1.createdAt }
        if !history.isEmpty {
            lines += ["### Brief history", ""]
            for revision in history {
                let who = revision.origin == "user" ? "Edited by you" : "Accepted from the \(revision.origin)"
                let why = revision.rationale.isEmpty ? "" : ": \(revision.rationale)"
                lines.append("- \(day(revision.resolvedAt ?? revision.createdAt)) — \(who)\(why)")
            }
            lines.append("")
        }
        return lines.joined(separator: "\n")
    }

    static func heading(for kind: StrategyItemKind) -> String {
        switch kind {
        case .decision: return "Decisions"
        case .openQuestion: return "Open questions"
        case .actionItem: return "Action items"
        case .assumption: return "Assumptions"
        case .risk: return "Risks"
        }
    }

    /// Adds `levels` to every ATX heading outside code fences, capped at h6.
    static func demoted(_ markdown: String, by levels: Int) -> String {
        var inFence = false
        return markdown.components(separatedBy: "\n").map { line in
            if line.hasPrefix("```") { inFence.toggle() }
            guard !inFence, line.hasPrefix("#") else { return line }
            let hashes = line.prefix { $0 == "#" }.count
            guard line.dropFirst(hashes).first == " " else { return line }
            return String(repeating: "#", count: min(6, hashes + levels)) + line.dropFirst(hashes)
        }.joined(separator: "\n")
    }

    static func day(_ date: Date) -> String {
        date.formatted(.iso8601.year().month().day())
    }
}
