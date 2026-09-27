import Foundation

/// One item an adapter found, already reduced to plain text. `FeedIngest`
/// turns these into `Article`s.
public struct RawItem: Equatable, Sendable {
    public var url: String
    public var title: String
    /// Teaser: a feed description or a paper abstract.
    public var summary: String
    /// Full text when the source carried it (e.g. RSS `content:encoded`), else empty.
    public var content: String
    public var author: String?
    public var publishedAt: Date?

    public init(url: String, title: String, summary: String = "", content: String = "",
                author: String? = nil, publishedAt: Date? = nil) {
        self.url = url
        self.title = title
        self.summary = summary
        self.content = content
        self.author = author
        self.publishedAt = publishedAt
    }
}

/// Parses the date formats feeds and APIs use: RFC 3339 / ISO 8601 (Atom,
/// arXiv, Hugging Face) and RFC 822 with its common variants (RSS).
public enum FeedDate {
    private static let isoFractional: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return formatter
    }()

    private static let iso: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime]
        return formatter
    }()

    private static let fallbackFormats = [
        "EEE, dd MMM yyyy HH:mm:ss zzz",
        "EEE, d MMM yyyy HH:mm:ss Z",
        "EEE, dd MMM yyyy HH:mm zzz",
        "dd MMM yyyy HH:mm:ss zzz",
        "EEE, dd MMM yyyy",
        "yyyy-MM-dd'T'HH:mm:ssZ",
        "yyyy-MM-dd'T'HH:mm:ss",
        "yyyy-MM-dd",
    ]

    private static let fallbackFormatters: [DateFormatter] = fallbackFormats.map { format in
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(identifier: "UTC")
        formatter.dateFormat = format
        return formatter
    }

    public static func parse(_ string: String?) -> Date? {
        guard let trimmed = string?.trimmingCharacters(in: .whitespacesAndNewlines), !trimmed.isEmpty else {
            return nil
        }
        if let date = isoFractional.date(from: trimmed) ?? iso.date(from: trimmed) {
            return date
        }
        for formatter in fallbackFormatters {
            if let date = formatter.date(from: trimmed) { return date }
        }
        return nil
    }
}

/// Canonical form of an article URL, used to dedupe the same story arriving
/// from several sources (PLAN §3.3 A2).
public enum CanonicalURL {
    static let trackingParameters: Set<String> = [
        "fbclid", "gclid", "dclid", "msclkid", "mc_cid", "mc_eid", "igshid",
        "_hsenc", "_hsmi", "mkt_tok", "ref_src",
    ]

    static let arxivHosts: Set<String> = ["arxiv.org", "www.arxiv.org", "export.arxiv.org"]

    /// `nil` for anything that isn't an absolute http(s) URL.
    /// - Lowercases the scheme and host, drops the fragment, default ports and
    ///   tracking parameters (`utm_*`, `fbclid`, ...).
    /// - arXiv abstract and PDF links collapse to `https://arxiv.org/abs/<id>`
    ///   without the version, so a new version isn't a new article.
    public static func canonicalize(_ string: String, relativeTo base: URL? = nil) -> String? {
        let trimmed = string.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return nil }
        let resolved: URL?
        if let base {
            resolved = URL(string: trimmed, relativeTo: base)?.absoluteURL
        } else {
            resolved = URL(string: trimmed)
        }
        guard let url = resolved,
              var components = URLComponents(url: url, resolvingAgainstBaseURL: true),
              let scheme = components.scheme?.lowercased(), scheme == "http" || scheme == "https",
              let host = components.host?.lowercased(), !host.isEmpty else {
            return nil
        }

        if arxivHosts.contains(host), let id = arxivID(fromPath: components.path) {
            return "https://arxiv.org/abs/\(id)"
        }

        components.scheme = scheme
        components.host = host
        components.fragment = nil
        if (scheme == "http" && components.port == 80) || (scheme == "https" && components.port == 443) {
            components.port = nil
        }
        if components.path.isEmpty { components.path = "/" }
        let kept = (components.queryItems ?? []).filter { item in
            let name = item.name.lowercased()
            return !name.hasPrefix("utm_") && !trackingParameters.contains(name)
        }
        components.queryItems = kept.isEmpty ? nil : kept
        return components.string
    }

    /// "2409.01234" from "/abs/2409.01234v2" or "/pdf/2409.01234v1.pdf".
    static func arxivID(fromPath path: String) -> String? {
        let prefixes = ["/abs/", "/pdf/"]
        guard let prefix = prefixes.first(where: { path.hasPrefix($0) }) else { return nil }
        var id = String(path.dropFirst(prefix.count))
        if id.hasSuffix(".pdf") { id = String(id.dropLast(4)) }
        if let range = id.range(of: #"v[0-9]+$"#, options: .regularExpression) {
            id.removeSubrange(range)
        }
        return id.isEmpty ? nil : id
    }
}
