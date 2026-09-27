import Foundation
import Observation
import SwiftData
import IngestKit
import KnowledgeStore

enum GitHubConfig {
    /// Client ID of a GitHub OAuth App with Device Flow enabled
    /// (github.com/settings/developers → OAuth Apps → Enable Device Flow).
    /// A client ID isn't a secret; no client secret is needed. While empty,
    /// one-tap sign-in is hidden and the token option still works.
    static let oauthClientID = ""
}

/// The signed-in GitHub account. The token lives only in the Keychain
/// (`GitHubTokenStore`); this caches who it belongs to.
@MainActor
@Observable
final class GitHubAccount {
    static let shared = GitHubAccount()

    private(set) var login: String?
    private(set) var isChecking = false
    var lastError: String?

    private let store = GitHubTokenStore.shared

    var hasToken: Bool { store.token() != nil }

    var client: GitHubClient { GitHubClient(token: store.token()) }

    /// Re-reads the stored token and resolves its login.
    func refresh() async {
        guard hasToken else {
            login = nil
            return
        }
        isChecking = true
        defer { isChecking = false }
        do {
            login = try await client.currentUser().login
            lastError = nil
        } catch {
            lastError = error.localizedDescription
        }
    }

    /// Validates `token` against GitHub before keeping it.
    func signIn(token: String) async -> Bool {
        let trimmed = token.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return false }
        isChecking = true
        defer { isChecking = false }
        do {
            let user = try await GitHubClient(token: trimmed).currentUser()
            store.setToken(trimmed)
            login = user.login
            lastError = nil
            return true
        } catch {
            lastError = error.localizedDescription
            return false
        }
    }

    func signOut() {
        store.setToken(nil)
        login = nil
        lastError = nil
    }
}

/// Syncs every GitHub link of a project and summarizes what changed.
@MainActor
func syncGitHubLinks(of project: Project, context: ModelContext) async -> String {
    let links = (project.links ?? []).filter { $0.kind == .githubRepo && $0.repoFullName != nil }
    guard !links.isEmpty else { return "No GitHub repos linked." }

    let client = GitHubAccount.shared.client
    var added = 0, updated = 0, removed = 0, unchanged = 0
    var failures: [String] = []
    for link in links {
        guard let fullName = link.repoFullName else { continue }
        do {
            guard let snapshot = try await RepoSync.fetch(fullName, etag: link.etag, client: client) else {
                link.lastSyncedAt = Date()
                unchanged += 1
                continue
            }
            let result = try RepoSync.apply(snapshot, to: link, context: context)
            added += result.articlesAdded
            updated += result.articlesUpdated
            removed += result.articlesRemoved
        } catch {
            failures.append("\(fullName): \(error.localizedDescription)")
        }
    }

    var parts: [String] = []
    if added + updated + removed > 0 {
        parts.append("\(added) new, \(updated) updated, \(removed) removed docs")
    }
    if unchanged > 0 { parts.append("\(unchanged) unchanged") }
    parts += failures
    return parts.isEmpty ? "Up to date." : parts.joined(separator: "\n")
}
