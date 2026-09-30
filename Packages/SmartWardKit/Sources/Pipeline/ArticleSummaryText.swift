import Foundation

/// Reads a summary the on-device model wrote as plain text.
///
/// Apple's guardrails only relax for text answers (`permissiveContentTransformations`
/// applies to `String` output, not to guided generation), and summarizing an
/// article is what that mode is for. So the on-device model answers in a
/// simple form, and this turns it back into bullets per question:
///
///     ABOUT:
///     - Speculative decoding in vLLM.
///     SAYS:
///     - ...
///
/// The reply is untrusted and noisy, so this is tolerant of Markdown around
/// a heading (`**ABOUT:**`, `## About`, `1. About`), of a first bullet on
/// the heading's line, and of a preamble before the first heading, but strict
/// about what a heading is: the whole line must be one of the five names (or
/// a name followed by a colon). A bullet that merely starts with the word
/// ("About 40% of requests…") is a bullet. A reply with no heading at all,
/// such as a refusal ("I can't help with that"), yields `nil` and is never
/// shown as a summary.
public enum ArticleSummaryText {
    public static func parse(_ reply: String) -> ArticleSummary.Draft? {
        var draft = ArticleSummary.Draft()
        var current: ArticleSummary.Question?
        var foundHeading = false

        for rawLine in reply.split(whereSeparator: \.isNewline) {
            let line = rawLine.trimmingCharacters(in: .whitespaces)
            guard !line.isEmpty else { continue }
            if let (question, inline) = heading(in: line) {
                current = question
                foundHeading = true
                if !inline.isEmpty { append(inline, to: question, in: &draft) }
            } else if let current {
                append(line, to: current, in: &draft)
            }
        }
        return foundHeading ? draft : nil
    }

    private static func append(_ bullet: String, to question: ArticleSummary.Question, in draft: inout ArticleSummary.Draft) {
        switch question {
        case .about: draft.about.append(bullet)
        case .says: draft.says.append(bullet)
        case .evidence: draft.evidence.append(bullet)
        case .matters: draft.matters.append(bullet)
        case .remember: draft.remember.append(bullet)
        }
    }

    private static let names: [(question: ArticleSummary.Question, names: [String])] = [
        (.about, ["what is this about", "about"]),
        (.says, ["what is it saying", "says"]),
        (.evidence, ["what evidence or reasoning supports it", "evidence or reasoning", "evidence"]),
        (.matters, ["why does it matter", "matters"]),
        (.remember, ["what should i remember", "remember"]),
    ]

    /// Optional Markdown and numbering, a name, optional `?` and emphasis,
    /// then either the end of the line or a colon and whatever follows it.
    private static let headingPattern: NSRegularExpression = {
        let all = names.flatMap { $0.names }.sorted { $0.count > $1.count }.joined(separator: "|")
        let pattern = "^[#*_\\s]*(?:\\d{1,2}[.)]\\s*)?(" + all + ")\\s*\\??\\s*[*_]*\\s*(?::\\s*[*_]*\\s*(.*))?$"
        return try! NSRegularExpression(pattern: pattern, options: [.caseInsensitive])
    }()

    private static func heading(in line: String) -> (ArticleSummary.Question, inline: String)? {
        let range = NSRange(line.startIndex..., in: line)
        guard let match = headingPattern.firstMatch(in: line, range: range),
              let nameRange = Range(match.range(at: 1), in: line) else { return nil }
        let name = line[nameRange].lowercased()
        guard let question = names.first(where: { $0.names.contains(name) })?.question else { return nil }
        var inline = ""
        if match.range(at: 2).location != NSNotFound, let rest = Range(match.range(at: 2), in: line) {
            // Trailing emphasis left over from "**ABOUT:** text **".
            inline = line[rest].trimmingCharacters(in: CharacterSet(charactersIn: "*_ "))
        }
        return (question, inline)
    }
}
