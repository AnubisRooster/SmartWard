import SwiftUI
import SwiftData
import IngestKit
import KnowledgeStore

/// Project detail → GitHub: add repos from the signed-in account, sync their
/// docs, and show the dependencies the radar pinned.
struct GitHubProjectSection: View {
    @Bindable var project: Project
    @Environment(\.modelContext) private var context
    @State private var account = GitHubAccount.shared
    @State private var showingPicker = false
    @State private var isSyncing = false
    @State private var status: String?

    private var repoLinks: [ProjectLink] {
        (project.links ?? []).filter { $0.kind == .githubRepo }
    }

    private var dependencies: [String] {
        (project.pinnedNodes ?? []).filter { $0.type == "tool" }.map(\.canonicalLabel).sorted()
    }

    var body: some View {
        Section {
            if account.hasToken {
                Button("Add repos from GitHub", systemImage: "plus") { showingPicker = true }
            }
            if !repoLinks.isEmpty {
                Button(isSyncing ? "Syncing…" : "Sync now", systemImage: "arrow.triangle.2.circlepath") {
                    Task {
                        isSyncing = true
                        status = await syncGitHubLinks(of: project, context: context)
                        isSyncing = false
                    }
                }
                .disabled(isSyncing)
                ForEach(repoLinks) { link in
                    HStack {
                        Label(link.repoFullName ?? link.url,
                              systemImage: link.isPrivate ? "lock" : "chevron.left.forwardslash.chevron.right")
                        Spacer()
                        if let synced = link.lastSyncedAt {
                            Text(synced, style: .relative)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            if let status {
                Text(status).font(.footnote).foregroundStyle(.secondary)
            }
            if !dependencies.isEmpty {
                Text("Dependencies: " + dependencies.joined(separator: ", "))
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        } header: {
            Text("GitHub")
        } footer: {
            Text(account.hasToken
                 ? "Syncs READMEs, CLAUDE.md/AGENTS.md, architecture reports and dependency manifests. Private repos stay on-device."
                 : "Public repo links sync without signing in. Sign in from Settings to pick repos and sync private ones.")
        }
        .sheet(isPresented: $showingPicker) {
            GitHubRepoPicker(project: project)
        }
    }
}

struct GitHubRepoPicker: View {
    let project: Project

    @Environment(\.dismiss) private var dismiss
    @State private var repos: [GitHubRepo] = []
    @State private var selected: Set<String> = []
    @State private var errorMessage: String?
    @State private var isLoading = true

    private var alreadyLinked: Set<String> {
        Set((project.links ?? []).compactMap { $0.repoFullName?.lowercased() })
    }

    var body: some View {
        NavigationStack {
            List(repos) { repo in
                let linked = alreadyLinked.contains(repo.fullName.lowercased())
                Button {
                    if selected.contains(repo.fullName) {
                        selected.remove(repo.fullName)
                    } else {
                        selected.insert(repo.fullName)
                    }
                } label: {
                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            Label(repo.fullName, systemImage: repo.isPrivate ? "lock" : "book.closed")
                            if let description = repo.description, !description.isEmpty {
                                Text(description).font(.caption).foregroundStyle(.secondary).lineLimit(2)
                            }
                        }
                        Spacer()
                        if linked {
                            Text("Linked").font(.caption).foregroundStyle(.secondary)
                        } else if selected.contains(repo.fullName) {
                            Image(systemName: "checkmark").foregroundStyle(.tint)
                        }
                    }
                }
                .disabled(linked)
                .foregroundStyle(.primary)
            }
            .overlay {
                if isLoading {
                    ProgressView()
                } else if let errorMessage {
                    ContentUnavailableView("Couldn't load repos", systemImage: "exclamationmark.triangle",
                                           description: Text(errorMessage))
                }
            }
            .navigationTitle("Add repos")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") { add() }
                        .disabled(selected.isEmpty)
                }
            }
            .task { await load() }
        }
    }

    private func load() async {
        do {
            repos = try await GitHubAccount.shared.client.repositories()
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }

    private func add() {
        for repo in repos where selected.contains(repo.fullName) {
            let link = ProjectLink(kind: .githubRepo, url: repo.htmlURL,
                                   repoFullName: repo.fullName, isPrivate: repo.isPrivate)
            project.links?.append(link)
        }
        dismiss()
    }
}
