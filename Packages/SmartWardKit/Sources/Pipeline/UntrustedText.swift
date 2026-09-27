import Foundation

/// Escaping for untrusted text placed inside prompt fences (PLAN §5.7):
/// `<reference>` for chat context, `<document>` for extraction and the
/// digest. Content, titles and theme labels all come from articles, so none
/// of them may open or close a fence, whatever the case or spacing.
public enum UntrustedText {

    /// `text` for the body of a `<tag>` block: any `<tag`, `</tag` or
    /// `< / TAG` becomes `‹…`, so it can't start or end a block.
    public static func body(_ text: String, tag: String) -> String {
        let pattern = "<(\\s*/?\\s*)(" + NSRegularExpression.escapedPattern(for: tag) + ")"
        guard let regex = try? NSRegularExpression(pattern: pattern, options: [.caseInsensitive]) else { return text }
        let range = NSRange(text.startIndex..., in: text)
        return regex.stringByReplacingMatches(in: text, range: range, withTemplate: "‹$1$2")
    }

    /// `text` for a double-quoted attribute: one line, no quotes, no angle
    /// brackets.
    public static func attribute(_ text: String) -> String {
        text.replacingOccurrences(of: "\"", with: "'")
            .replacingOccurrences(of: "<", with: "‹")
            .replacingOccurrences(of: ">", with: "›")
            .components(separatedBy: .newlines)
            .joined(separator: " ")
    }
}
