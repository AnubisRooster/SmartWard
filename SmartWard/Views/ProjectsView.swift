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
                    Label(link.repoFullName ?? link.url,
                          systemImage: link.kind == .githubRepo ? "chevron.left.forwardslash.chevron.right" : "link")
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
                Text("GitHub repo links are recognized automatically and can be synced below.")
            }
            GitHubProjectSection(project: project)
        }
        .navigationTitle(project.name)
    }

    private func addLink() {
        let trimmed = newLink.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        project.links?.append(ProjectLink.fromPastedURL(trimmed))
        newLink = ""
    }
}
