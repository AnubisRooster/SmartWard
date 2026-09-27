import SwiftUI
import SwiftData
import KnowledgeStore

struct ProjectsView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \Project.createdAt, order: .reverse) private var projects: [Project]
    @State private var isAdding = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(projects) { project in
                    NavigationLink(value: project) {
                        VStack(alignment: .leading, spacing: 2) {
                            Text(project.name).font(.headline)
                            if !project.goal.isEmpty {
                                Text(project.goal).font(.subheadline).foregroundStyle(.secondary).lineLimit(2)
                            }
                        }
                    }
                }
                .onDelete(perform: delete)
            }
            .overlay {
                if projects.isEmpty {
                    ContentUnavailableView("No projects yet",
                                           systemImage: "folder",
                                           description: Text("Add what you're building so your strategist can connect new research to it."))
                }
            }
            .navigationTitle("Projects")
            .navigationDestination(for: Project.self) { project in
                ProjectDetailView(project: project)
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Add project", systemImage: "plus") { isAdding = true }
                }
            }
            .sheet(isPresented: $isAdding) {
                NewProjectView()
            }
        }
    }

    private func delete(at offsets: IndexSet) {
        for index in offsets {
            context.delete(projects[index])
        }
    }
}

struct NewProjectView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @State private var name = ""
    @State private var goal = ""
    @State private var constraints = ""

    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                TextField("Goal", text: $goal, axis: .vertical)
                TextField("Constraints", text: $constraints, axis: .vertical)
            }
            .navigationTitle("New project")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let project = Project(name: name.trimmingCharacters(in: .whitespacesAndNewlines),
                                              goal: goal, constraints: constraints)
                        context.insert(project)
                        dismiss()
                    }
                    .disabled(name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
            }
        }
    }
}

struct ProjectDetailView: View {
    @Bindable var project: Project
    @Environment(\.modelContext) private var context
    @State private var newLink = ""
    @State private var editingLink: ProjectLink?

    private var links: [ProjectLink] {
        (project.links ?? []).sorted { $0.url < $1.url }
    }

    var body: some View {
        Form {
            Section("About") {
                TextField("Name", text: $project.name)
                TextField("Goal", text: $project.goal, axis: .vertical)
                TextField("Constraints", text: $project.constraints, axis: .vertical)
            }
            BriefSection(project: project)
            StrategyItemsSection(project: project)
            Section {
                ForEach(links) { link in
                    Button {
                        editingLink = link
                    } label: {
                        Label(link.repoFullName ?? link.url,
                              systemImage: link.kind == .githubRepo ? "chevron.left.forwardslash.chevron.right" : "link")
                    }
                    .foregroundStyle(.primary)
                }
                .onDelete { offsets in
                    let current = links
                    for index in offsets {
                        context.delete(current[index])
                    }
                }
                HStack {
                    TextField("Paste a repo or project URL", text: $newLink)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .keyboardType(.URL)
                        .onSubmit(addLink)
                    Button("Add", action: addLink)
                        .disabled(newLink.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
            } header: {
                Text("Links")
            } footer: {
                Text("GitHub repo links are recognized automatically and can be synced below. Tap a link to edit it.")
            }
            GitHubProjectSection(project: project)
        }
        .navigationTitle(project.name)
        .sheet(item: $editingLink) { link in
            EditLinkView(link: link)
        }
    }

    private func addLink() {
        let trimmed = newLink.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        project.links?.append(ProjectLink.fromPastedURL(trimmed))
        newLink = ""
    }
}

/// Editing a link re-parses its URL the same way pasting a new one does: it
/// can turn a plain URL into a recognized GitHub repo (or the reverse), and
/// changing which repo it points to clears that link's sync bookkeeping
/// (`ProjectLink.applyPastedURL`) so the next sync doesn't reuse the
/// previous repo's `Source`.
struct EditLinkView: View {
    @Bindable var link: ProjectLink
    @Environment(\.dismiss) private var dismiss
    @State private var text: String

    init(link: ProjectLink) {
        self.link = link
        _text = State(initialValue: link.url)
    }

    private var trimmed: String { text.trimmingCharacters(in: .whitespacesAndNewlines) }

    var body: some View {
        NavigationStack {
            Form {
                TextField("URL", text: $text)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .keyboardType(.URL)
                if link.kind == .githubRepo, let synced = link.lastSyncedAt {
                    LabeledContent("Last synced") {
                        Text(synced, style: .relative).foregroundStyle(.secondary)
                    }
                }
            }
            .navigationTitle("Edit link")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        link.applyPastedURL(trimmed)
                        dismiss()
                    }
                    .disabled(trimmed.isEmpty)
                }
            }
        }
    }
}
