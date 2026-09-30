import SwiftUI
import Observation
import SwiftData
import BYOKLLMKit
import KnowledgeStore
import StrategistCore

/// Runs the brief reviser with the chat's provider and model, and records usage.
@MainActor
@Observable
final class BriefController {
    private(set) var isSuggesting = false
    var message: String?

    func suggest(for project: Project, context: ModelContext) async {
        let defaults = UserDefaults.standard
        let providerRaw = defaults.string(forKey: "chat.lastProvider") ?? LLMProvider.openrouter.rawValue
        guard let provider = LLMProvider(rawValue: providerRaw), LLMKeychainStore.shared.hasKey(for: provider) else {
            message = "Add an API key in Settings to get brief suggestions."
            return
        }
        let model = defaults.string(forKey: "chat.lastModel") ?? provider.exampleModelID
        isSuggesting = true
        message = nil
        defer { isSuggesting = false }
        do {
            let suggestion = try await BriefReviser(llm: ModelCatalogController.shared.fallbackLLM())
                .suggest(for: project, provider: provider, model: model)
            if let usage = suggestion.response.usage {
                UsageLedger.record(provider: provider.rawValue, model: suggestion.response.model ?? model,
                                   feature: "brief", inputTokens: usage.inputTokens, outputTokens: usage.outputTokens,
                                   reportedCostUSD: usage.costUSD, context: context)
            }
            if suggestion.revision == nil {
                message = "The brief is already up to date."
            }
        } catch {
            message = error.localizedDescription
        }
    }
}

/// The screens a project's brief pushes on the Projects stack. Values rather
/// than destination-style links, so the stack's path
/// (`AppNavigation.projectsPath`) holds them and going back can see them.
enum ProjectRoute: Hashable {
    case briefReview(BriefRevision)
    case briefHistory(Project)
    case briefVersion(Project, BriefRevision)
}

struct ProjectRouteView: View {
    let route: ProjectRoute

    var body: some View {
        switch route {
        case .briefReview(let revision):
            BriefReviewView(revision: revision)
        case .briefHistory(let project):
            BriefHistoryView(project: project)
        case .briefVersion(let project, let revision):
            BriefVersionView(project: project, revision: revision)
        }
    }
}

/// The project's living brief: the current text, a suggestion waiting for
/// review, and ways to edit, ask for a revision, or look back.
struct BriefSection: View {
    @Bindable var project: Project

    @Environment(\.modelContext) private var context
    @State private var controller = BriefController()
    @State private var isEditing = false

    var body: some View {
        let pending = BriefEditing.pending(for: project)
        let markdown = project.brief?.markdown ?? ""
        let fresh = BriefEditing.newItems(for: project).count
        Section {
            if let pending {
                NavigationLink(value: ProjectRoute.briefReview(pending)) {
                    let counts = BriefDiff.counts(BriefDiff.lines(from: pending.baseMarkdown, to: pending.proposedMarkdown))
                    Label {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Suggested update").font(.subheadline.weight(.semibold))
                            Text("+\(counts.added) −\(counts.removed) lines · from \(BriefOrigin.label(pending.origin))")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    } icon: {
                        Image(systemName: "sparkles").foregroundStyle(.orange)
                    }
                }
            }
            if markdown.isEmpty {
                Text("No brief yet. Write one, or ask for a first draft from the project's goal, links and decisions.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            } else {
                Text(LocalizedStringKey(markdown))
                    .font(.subheadline)
                    .textSelection(.enabled)
            }
            Button("Edit brief", systemImage: "pencil") { isEditing = true }
            Button {
                Task { await controller.suggest(for: project, context: context) }
            } label: {
                HStack {
                    Label(markdown.isEmpty ? "Draft a brief" : "Suggest an update", systemImage: "wand.and.stars")
                    Spacer()
                    if controller.isSuggesting { ProgressView() }
                }
            }
            .disabled(controller.isSuggesting)
            if !BriefEditing.history(for: project).isEmpty {
                NavigationLink("History", value: ProjectRoute.briefHistory(project))
            }
        } header: {
            Text("Brief")
        } footer: {
            VStack(alignment: .leading, spacing: 4) {
                if let message = controller.message { Text(message) }
                if fresh > 0 {
                    Text("\(fresh) new \(fresh == 1 ? "item" : "items") since the brief was last revised.")
                }
                Text("Suggestions use your provider. Nothing changes until you accept it.")
            }
        }
        .sheet(isPresented: $isEditing) {
            BriefEditorView(project: project)
        }
    }
}

enum BriefOrigin {
    static func label(_ origin: String) -> String {
        switch origin {
        case "user": return "you"
        case "reviser": return "brief review"
        default: return "the strategist"
        }
    }
}

/// A suggested change as a diff, with its reason, to accept or reject.
struct BriefReviewView: View {
    let revision: BriefRevision

    @Environment(\.dismiss) private var dismiss
    @State private var errorMessage: String?

    var body: some View {
        List {
            if !revision.rationale.isEmpty {
                Section("Why") { Text(revision.rationale) }
            }
            Section {
                BriefDiffView(lines: BriefDiff.lines(from: revision.baseMarkdown, to: revision.proposedMarkdown))
            } header: {
                Text("Changes")
            } footer: {
                Text("Suggested by \(BriefOrigin.label(revision.origin)) \(revision.createdAt.formatted(.relative(presentation: .named))).")
            }
        }
        .navigationTitle("Suggested update")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if revision.status == .pending {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Reject", role: .destructive) { resolve(accept: false) }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Accept") { resolve(accept: true) }
                }
            }
        }
        .alert("Couldn't apply it", isPresented: Binding(get: { errorMessage != nil },
                                                         set: { if !$0 { errorMessage = nil } })) {
            Button("OK") { dismiss() }
        } message: {
            Text(errorMessage ?? "")
        }
    }

    private func resolve(accept: Bool) {
        do {
            if accept {
                try BriefEditing.accept(revision)
            } else {
                try BriefEditing.reject(revision)
            }
            dismiss()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}

/// Removed lines in red, added lines in green, unchanged lines dimmed.
struct BriefDiffView: View {
    let lines: [BriefDiff.Line]

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            ForEach(Array(lines.enumerated()), id: \.offset) { _, line in
                row(line)
            }
        }
        .font(.caption.monospaced())
        .accessibilityElement(children: .contain)
    }

    @ViewBuilder
    private func row(_ line: BriefDiff.Line) -> some View {
        switch line {
        case .same(let text):
            Text("  " + text).foregroundStyle(.secondary)
        case .added(let text):
            Text("+ " + text)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.green.opacity(0.15))
                .accessibilityLabel("Added: \(text)")
        case .removed(let text):
            Text("− " + text)
                .strikethrough()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.red.opacity(0.15))
                .accessibilityLabel("Removed: \(text)")
        }
    }
}

struct BriefEditorView: View {
    let project: Project

    @Environment(\.dismiss) private var dismiss
    @State private var text = ""
    @State private var errorMessage: String?

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextEditor(text: $text)
                        .font(.body.monospaced())
                        .frame(minHeight: 320)
                } footer: {
                    if let errorMessage {
                        Text(errorMessage).foregroundStyle(.red)
                    } else {
                        Text("Markdown. Your edits are kept in the brief's history.")
                    }
                }
            }
            .navigationTitle("Edit brief")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        do {
                            try BriefEditing.edit(project, markdown: text)
                            dismiss()
                        } catch {
                            errorMessage = error.localizedDescription
                        }
                    }
                }
            }
            .onAppear { text = project.brief?.markdown ?? "" }
        }
    }
}

/// Accepted changes, newest first. Any earlier version can be restored.
struct BriefHistoryView: View {
    let project: Project

    var body: some View {
        List(BriefEditing.history(for: project)) { revision in
            NavigationLink(value: ProjectRoute.briefVersion(project, revision)) {
                VStack(alignment: .leading, spacing: 2) {
                    Text(revision.rationale.isEmpty ? "Edited by \(BriefOrigin.label(revision.origin))" : revision.rationale)
                        .lineLimit(2)
                    Text("\(BriefOrigin.label(revision.origin).capitalized) · \((revision.resolvedAt ?? revision.createdAt).formatted(date: .abbreviated, time: .shortened))")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .navigationTitle("Brief history")
    }
}

private struct BriefVersionView: View {
    let project: Project
    let revision: BriefRevision

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        List {
            Section("What changed") {
                BriefDiffView(lines: BriefDiff.lines(from: revision.baseMarkdown, to: revision.proposedMarkdown))
            }
            Section {
                Button("Restore the version before this change", systemImage: "arrow.uturn.backward") {
                    try? BriefEditing.edit(project, markdown: revision.baseMarkdown)
                    dismiss()
                }
                .disabled(revision.baseMarkdown == project.brief?.markdown)
            } footer: {
                Text("Restoring is itself an edit, so it can be undone from the history too.")
            }
        }
        .navigationTitle("Change")
        .navigationBarTitleDisplayMode(.inline)
    }
}

/// Decisions, open questions, action items, assumptions and risks the
/// strategist recorded. Swipe to close one; closed items drop out of chat
/// context but stay in the brief's source material.
struct StrategyItemsSection: View {
    let project: Project

    var body: some View {
        let items = (project.items ?? []).sorted { $0.createdAt > $1.createdAt }
        let open = items.filter { $0.status == .open }
        Section {
            if open.isEmpty {
                Text("Nothing open. Decisions, questions and action items from your chats appear here.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            ForEach(open) { item in
                Label {
                    Text(item.text)
                } icon: {
                    Image(systemName: Self.systemImage(for: item.kind))
                }
                .accessibilityLabel("\(Self.name(for: item.kind)): \(item.text)")
                .swipeActions {
                    Button("Done") { item.status = .done }.tint(.green)
                    Button("Superseded") { item.status = .superseded }.tint(.gray)
                }
            }
        } header: {
            Text("Open items")
        } footer: {
            let closed = items.count - open.count
            if closed > 0 { Text("\(closed) closed.") }
        }
    }

    static func name(for kind: StrategyItemKind) -> String {
        switch kind {
        case .decision: return "Decision"
        case .openQuestion: return "Open question"
        case .actionItem: return "Action item"
        case .assumption: return "Assumption"
        case .risk: return "Risk"
        }
    }

    static func systemImage(for kind: StrategyItemKind) -> String {
        switch kind {
        case .decision: return "checkmark.seal"
        case .openQuestion: return "questionmark.circle"
        case .actionItem: return "checklist"
        case .assumption: return "lightbulb"
        case .risk: return "exclamationmark.triangle"
        }
    }
}
