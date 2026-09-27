import Foundation
import SwiftSoup

/// Readable content pulled out of a web page.
public struct ExtractedArticle: Equatable, Sendable {
    public var title: String
    public var byline: String?
    /// Paragraphs separated by blank lines.
    public var text: String
    public var publishedAt: Date?
    public var canonicalURL: String?

    public init(title: String, byline: String? = nil, text: String,
                publishedAt: Date? = nil, canonicalURL: String? = nil) {
        self.title = title
        self.byline = byline
        self.text = text
        self.publishedAt = publishedAt
        self.canonicalURL = canonicalURL
    }
}

/// HTML → clean text (PLAN §5.1), with readability-style heuristics.
///
/// It also removes what a reader can't see before any model does (§5.7):
/// scripts, HTML comments, hidden elements and zero-width or bidi control
/// characters. Those are common places to hide prompt injections.
public enum ArticleExtractor {
    static let invisibleSelector = [
        "script", "style", "noscript", "template", "iframe", "object", "embed", "svg", "canvas",
        "form", "button", "input", "select", "textarea",
        "[hidden]", "[aria-hidden=true]", ".sr-only", ".visually-hidden",
    ].joined(separator: ", ")

    /// Page chrome that isn't the article.
    static let chromeSelector = "nav, aside, footer, header, [role=navigation], [role=banner], [role=contentinfo]"

    static let blockSelector = "h1, h2, h3, h4, h5, h6, p, pre, blockquote, li, figcaption, td"

    // MARK: Pages

    public static func extract(html: String, url: URL? = nil) throws -> ExtractedArticle {
        let document = try SwiftSoup.parse(stripComments(html), url?.absoluteString ?? "")
        let title = try metadata(document, "meta[property=og:title]") ?? cleanInline(try document.title())
        let byline = try metadata(document, "meta[name=author]")
        let published = FeedDate.parse(try metadata(document, "meta[property=article:published_time]"))
        let canonical = try document.select("link[rel=canonical]").first()
            .flatMap { try? $0.absUrl("href") }
            .flatMap { $0.isEmpty ? nil : $0 }

        guard let body = document.body() else {
            return ExtractedArticle(title: title, byline: byline, text: "", publishedAt: published, canonicalURL: canonical)
        }
        try removeInvisible(in: body)
        try body.select(chromeSelector).remove()

        let root = try bestRoot(in: body)
        var text = try blocksText(root)
        if text.count < 200 {
            text = sanitize(try root.text())
        }
        return ExtractedArticle(title: title, byline: byline, text: text, publishedAt: published, canonicalURL: canonical)
    }

    /// Plain text from an HTML fragment such as a feed description. Block
    /// structure becomes blank-line-separated paragraphs.
    public static func plainText(fromHTML html: String) -> String {
        guard html.contains("<") || html.contains("&") else { return sanitize(html) }
        guard let document = try? SwiftSoup.parseBodyFragment(stripComments(html)),
              let body = document.body() else {
            return sanitize(html)
        }
        do {
            try removeInvisible(in: body)
            let blocks = try blocksText(body)
            return blocks.isEmpty ? sanitize(try body.text()) : blocks
        } catch {
            return sanitize(html)
        }
    }

    /// Feed URLs a page advertises with `<link rel="alternate">`.
    public static func feedLinks(inHTML html: String, baseURL: URL) -> [String] {
        guard let document = try? SwiftSoup.parse(html, baseURL.absoluteString),
              let links = try? document.select(
                "link[rel=alternate][type=application/rss+xml], link[rel=alternate][type=application/atom+xml]") else {
            return []
        }
        var seen = Set<String>()
        var result: [String] = []
        for link in links.array() {
            guard let href = try? link.absUrl("href"), !href.isEmpty, seen.insert(href).inserted else { continue }
            result.append(href)
        }
        return result
    }

    // MARK: Text hygiene

    /// Characters that render as nothing but still reach a model.
    static func isInvisibleScalar(_ scalar: Unicode.Scalar) -> Bool {
        switch scalar.value {
        case 0x00AD, 0x180E, 0x200B...0x200F, 0x202A...0x202E, 0x2060...0x2064, 0x2066...0x2069, 0xFEFF:
            return true
        default:
            return false
        }
    }

    /// Drops invisible characters and collapses whitespace within lines;
    /// keeps paragraph breaks.
    public static func sanitize(_ text: String) -> String {
        var scalars = String.UnicodeScalarView()
        scalars.append(contentsOf: text.unicodeScalars.filter { !isInvisibleScalar($0) })
        let visible = String(scalars)
        let paragraphs = visible
            .replacingOccurrences(of: "\r\n", with: "\n")
            .components(separatedBy: "\n\n")
            .map(cleanInline)
            .filter { !$0.isEmpty }
        return paragraphs.joined(separator: "\n\n")
    }

    static func cleanInline(_ text: String) -> String {
        text.split(whereSeparator: { $0.isWhitespace }).joined(separator: " ")
    }

    static func stripComments(_ html: String) -> String {
        html.replacingOccurrences(of: "<!--[\\s\\S]*?-->", with: "", options: .regularExpression)
    }

    // MARK: Structure

    static func removeInvisible(in root: Element) throws {
        try root.select(invisibleSelector).remove()
        for element in try root.select("[style]").array() {
            let style = try element.attr("style").lowercased().replacingOccurrences(of: " ", with: "")
            if style.contains("display:none") || style.contains("visibility:hidden")
                || style.contains("font-size:0") || style.contains("opacity:0;") || style.hasSuffix("opacity:0") {
                try element.remove()
            }
        }
    }

    static func metadata(_ document: Document, _ selector: String) throws -> String? {
        guard let element = try document.select(selector).first() else { return nil }
        let value = cleanInline(try element.attr("content"))
        return value.isEmpty ? nil : value
    }

    /// The element holding most of the paragraph text: each paragraph scores
    /// its parent fully and its grandparent half (the classic readability
    /// heuristic). Falls back to `body`.
    static func bestRoot(in body: Element) throws -> Element {
        var scores: [ObjectIdentifier: (element: Element, score: Double)] = [:]
        for paragraph in try body.select("p, pre").array() {
            let length = Double(try paragraph.text().count)
            guard length >= 25 else { continue }
            if let parent = paragraph.parent() as? Element {
                let key = ObjectIdentifier(parent)
                scores[key] = (parent, (scores[key]?.score ?? 0) + length)
                if let grandparent = parent.parent() as? Element {
                    let grandKey = ObjectIdentifier(grandparent)
                    scores[grandKey] = (grandparent, (scores[grandKey]?.score ?? 0) + length / 2)
                }
            }
        }
        guard let best = scores.values.max(by: { $0.score < $1.score }) else { return body }
        return best.element
    }

    /// Visible text of block elements, one paragraph each. Skips link-heavy
    /// blocks (menus, tag lists) and containers whose paragraphs are already
    /// counted on their own.
    static func blocksText(_ root: Element) throws -> String {
        var paragraphs: [String] = []
        for block in try root.select(blockSelector).array() {
            let tag = block.tagName().lowercased()
            if tag == "li" || tag == "blockquote" || tag == "td" {
                if try block.select("p").size() > 0 { continue }
            }
            let text = cleanInline(try block.text())
            guard !text.isEmpty else { continue }
            let linkText = try block.select("a").array().reduce(0) { $0 + ((try? $1.text().count) ?? 0) }
            if text.count < 200, Double(linkText) / Double(text.count) > 0.6 { continue }
            paragraphs.append(text)
        }
        return sanitize(paragraphs.joined(separator: "\n\n"))
    }
}
