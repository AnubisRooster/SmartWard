import Foundation

public extension ProjectLink {
    private static let reservedGitHubPaths: Set<String> = [
        "orgs", "settings", "topics", "features", "marketplace", "sponsors",
        "apps", "login", "explore", "notifications", "search", "collections",
    ]

    /// `"owner/name"` if `url` points at a GitHub repository (or anything
    /// inside one, like a file or PR), else `nil`. Accepts URLs without a
    /// scheme and trailing `.git`.
    static func githubRepoFullName(from url: String) -> String? {
        var text = url.trimmingCharacters(in: .whitespacesAndNewlines)
        if !text.contains("://") { text = "https://" + text }
        guard let components = URLComponents(string: text),
              let host = components.host?.lowercased(),
              host == "github.com" || host == "www.github.com" else { return nil }

        let parts = components.path.split(separator: "/").map(String.init)
        guard parts.count >= 2, !reservedGitHubPaths.contains(parts[0].lowercased()) else { return nil }
        var name = parts[1]
        if name.lowercased().hasSuffix(".git") { name.removeLast(4) }
        guard !name.isEmpty else { return nil }
        return "\(parts[0])/\(name)"
    }

    /// A link for a pasted URL: a GitHub repo link when it points at a repo,
    /// else a plain URL link.
    static func fromPastedURL(_ url: String) -> ProjectLink {
        let trimmed = url.trimmingCharacters(in: .whitespacesAndNewlines)
        if let fullName = githubRepoFullName(from: trimmed) {
            return ProjectLink(kind: .githubRepo, url: "https://github.com/\(fullName)", repoFullName: fullName)
        }
        return ProjectLink(kind: .url, url: trimmed)
    }
}
