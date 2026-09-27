import Foundation

/// A dependency declared in a project manifest: the input to the dependency
/// radar (PLAN FR-23).
public struct Dependency: Equatable, Hashable, Sendable {
    public let name: String
    /// swift | npm | python | rust | go
    public let ecosystem: String
    /// `"owner/name"` when the dependency is itself a GitHub repo, so its
    /// releases can be followed.
    public let githubRepo: String?

    public init(name: String, ecosystem: String, githubRepo: String? = nil) {
        self.name = name
        self.ecosystem = ecosystem
        self.githubRepo = githubRepo
    }
}

/// Lightweight, dependency-free parsing of common manifests. It errs on the
/// side of missing an odd declaration rather than inventing a dependency.
public enum ManifestParser {
    public static let manifestPaths = ["Package.swift", "package.json", "pyproject.toml",
                                       "requirements.txt", "Cargo.toml", "go.mod"]

    public static func dependencies(path: String, text: String) -> [Dependency] {
        let file = (path as NSString).lastPathComponent
        let found: [Dependency]
        switch file {
        case "Package.swift":    found = swiftPackages(text)
        case "package.json":     found = npmPackages(text)
        case "pyproject.toml":   found = pyproject(text)
        case "requirements.txt": found = requirements(text)
        case "Cargo.toml":       found = cargo(text)
        case "go.mod":           found = goModules(text)
        default:                 found = []
        }
        var seen = Set<String>()
        return found.filter { seen.insert("\($0.ecosystem):\($0.name.lowercased())").inserted }
    }

    /// `"owner/name"` for a GitHub URL (https or git@), without `.git`.
    static func githubRepo(fromURL url: String) -> String? {
        var text = url.trimmingCharacters(in: .whitespacesAndNewlines)
        if text.hasPrefix("git@github.com:") {
            text = "https://github.com/" + text.dropFirst("git@github.com:".count)
        }
        guard let components = URLComponents(string: text),
              let host = components.host?.lowercased(), host == "github.com" || host == "www.github.com" else { return nil }
        let parts = components.path.split(separator: "/").map(String.init)
        guard parts.count >= 2 else { return nil }
        var name = parts[1]
        if name.lowercased().hasSuffix(".git") { name.removeLast(4) }
        return name.isEmpty ? nil : "\(parts[0])/\(name)"
    }

    // MARK: Swift

    static func swiftPackages(_ text: String) -> [Dependency] {
        matches(of: #"\.package\s*\([^)]*?url:\s*"([^"]+)""#, in: text).compactMap { (url: String) -> Dependency? in
            let repo = githubRepo(fromURL: url)
            let name = repo.map { String($0.split(separator: "/").last ?? "") }
                ?? URL(string: url)?.deletingPathExtension().lastPathComponent
            guard let name, !name.isEmpty else { return nil }
            return Dependency(name: name, ecosystem: "swift", githubRepo: repo)
        }
    }

    // MARK: npm

    static func npmPackages(_ text: String) -> [Dependency] {
        struct Manifest: Decodable {
            let dependencies: [String: String]?
            let peerDependencies: [String: String]?
        }
        guard let manifest = try? JSONDecoder().decode(Manifest.self, from: Data(text.utf8)) else { return [] }
        let all = (manifest.dependencies ?? [:]).merging(manifest.peerDependencies ?? [:]) { first, _ in first }
        return all.keys.sorted().map { (name: String) -> Dependency in
            let spec = all[name] ?? ""
            let repo = spec.hasPrefix("github:") ? String(spec.dropFirst("github:".count)).components(separatedBy: "#").first
                                                 : githubRepo(fromURL: spec)
            return Dependency(name: name, ecosystem: "npm", githubRepo: repo)
        }
    }

    // MARK: Python

    static func pythonName(_ requirement: String) -> String? {
        let trimmed = requirement.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty, !trimmed.hasPrefix("#"), !trimmed.hasPrefix("-"),
              !trimmed.contains("://") else { return nil }
        let stops = CharacterSet(charactersIn: "<>=!~;[( @")
        let name = trimmed.prefix { character in !character.unicodeScalars.contains { stops.contains($0) } }
        let result = String(name).trimmingCharacters(in: .whitespaces)
        return result.isEmpty ? nil : result
    }

    static func requirements(_ text: String) -> [Dependency] {
        text.components(separatedBy: .newlines).compactMap { line in
            pythonName(line).map { Dependency(name: $0, ecosystem: "python") }
        }
    }

    static func pyproject(_ text: String) -> [Dependency] {
        var names: [String] = []
        // PEP 621: dependencies = ["httpx>=0.27", ...] (possibly multi-line).
        for list in matches(of: #"(?m)^\s*dependencies\s*=\s*\[([^\]]*)\]"#, in: text) {
            names += matches(of: #""([^"]+)"|'([^']+)'"#, in: list).compactMap(pythonName)
        }
        // Poetry: keys under [tool.poetry.dependencies], excluding python itself.
        for (key, _) in tableEntries(named: "tool.poetry.dependencies", in: text) where key.lowercased() != "python" {
            names.append(key)
        }
        return names.map { Dependency(name: $0, ecosystem: "python") }
    }

    // MARK: Rust

    static func cargo(_ text: String) -> [Dependency] {
        tableEntries(named: "dependencies", in: text).map { (entry: (String, String)) -> Dependency in
            let (key, value) = entry
            let git = matches(of: #"git\s*=\s*"([^"]+)""#, in: value).first
            return Dependency(name: key, ecosystem: "rust", githubRepo: git.flatMap(githubRepo(fromURL:)))
        }
    }

    // MARK: Go

    static func goModules(_ text: String) -> [Dependency] {
        var paths: [String] = []
        var inBlock = false
        for rawLine in text.components(separatedBy: .newlines) {
            let line = rawLine.trimmingCharacters(in: .whitespaces)
            if line.hasPrefix("require (") { inBlock = true; continue }
            if inBlock && line.hasPrefix(")") { inBlock = false; continue }
            if inBlock {
                if let path = line.split(separator: " ").first, !line.hasPrefix("//") { paths.append(String(path)) }
            } else if line.hasPrefix("require ") {
                let parts = line.split(separator: " ")
                if parts.count >= 2 { paths.append(String(parts[1])) }
            }
        }
        return paths.filter { !$0.isEmpty }.map { (path: String) -> Dependency in
            let parts = path.split(separator: "/")
            let repo = (parts.first == "github.com" && parts.count >= 3) ? "\(parts[1])/\(parts[2])" : nil
            return Dependency(name: path, ecosystem: "go", githubRepo: repo)
        }
    }

    // MARK: Helpers

    /// First capture group of every match (or the second, for alternations).
    static func matches(of pattern: String, in text: String) -> [String] {
        guard let regex = try? NSRegularExpression(pattern: pattern, options: [.dotMatchesLineSeparators]) else { return [] }
        let range = NSRange(text.startIndex..., in: text)
        return regex.matches(in: text, range: range).compactMap { (match: NSTextCheckingResult) -> String? in
            for group in 1..<max(match.numberOfRanges, 1) {
                if let groupRange = Range(match.range(at: group), in: text) {
                    return String(text[groupRange])
                }
            }
            return nil
        }
    }

    /// `key = value` lines inside a TOML `[table]`, up to the next table header.
    static func tableEntries(named table: String, in text: String) -> [(String, String)] {
        var entries: [(String, String)] = []
        var inTable = false
        for rawLine in text.components(separatedBy: .newlines) {
            let line = rawLine.trimmingCharacters(in: .whitespaces)
            if line.hasPrefix("[") {
                inTable = line == "[\(table)]"
                continue
            }
            guard inTable, !line.isEmpty, !line.hasPrefix("#"),
                  let equals = line.firstIndex(of: "=") else { continue }
            let key = line[..<equals].trimmingCharacters(in: .whitespaces).trimmingCharacters(in: CharacterSet(charactersIn: "\"'"))
            let value = line[line.index(after: equals)...].trimmingCharacters(in: .whitespaces)
            if !key.isEmpty { entries.append((key, value)) }
        }
        return entries
    }
}
