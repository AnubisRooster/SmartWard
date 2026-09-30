import Foundation

/// Turns free wording ("could you pull up the stuff about vLLM", "what's
/// unread?") into one of the phrases the grammar knows, using a language
/// model on the device. The model never chooses a command itself: it picks
/// a phrase from `catalog`, and the phrase goes through `VoiceCommandParser`
/// like anything you said, so what it can do is exactly what the grammar can,
/// and a change to a project still waits for your spoken yes.
public protocol VoiceRephrasing: Sendable {
    /// The model's reply, or `nil` when it can't answer right now.
    func rephrase(_ heard: String, context: VoiceContext) async -> String?
}

public enum VoiceRephrase {
    /// What the model may answer with. `phrase` shows the shape (with <words>
    /// where you name something); `sample` is a real instance the tests parse.
    public static let catalog: [(phrase: String, sample: String)] = [
        ("open Reading, Today, Graph, Chat or Projects", "open Reading"),
        ("go back", "go back"),
        ("show unread, show starred or show all", "show starred"),
        ("sort by newest or sort by relevance", "sort by relevance"),
        ("refresh", "refresh"),
        ("open the second one (or first, third, the last one)", "open the second one"),
        ("open the article about <words>", "open the article about agents"),
        ("open project <name>", "open project inference stack"),
        ("read this article or read the summary", "read the summary"),
        ("star this or unstar this", "unstar this"),
        ("brief me", "brief me"),
        ("read today's digest", "read today's digest"),
        ("next article or previous article", "previous article"),
        ("repeat or tell me more", "tell me more"),
        ("dismiss or mark unread", "mark unread"),
        ("load the full article", "load the full article"),
        ("faster or slower or normal speed", "slower"),
        ("pause or keep going or stop reading", "keep going"),
        ("search for <words>", "search for speculative decoding"),
        ("how many unread articles do I have", "how many unread articles do I have"),
        ("did the refresh finish", "did the refresh finish"),
        ("which sources are failing", "which sources are failing"),
        ("how much have I spent today", "how much have I spent today"),
        ("what are my top themes", "what are my top themes"),
        ("tell me about <words>", "tell me about vLLM"),
        ("read the brief", "read the brief"),
        ("what are my open items", "what are my open items"),
        ("brief me on this project", "brief me on this project"),
        ("read the suggested update", "read the suggested update"),
        ("mark item <number> done", "mark item 2 done"),
        ("accept the suggested update or reject the suggested update", "reject the suggested update"),
        ("what can I say", "what can I say"),
    ]

    /// The most items or project names told to the model, so the prompt stays small.
    static let maxListed = 10

    /// The instructions for a session: the catalog, and what's on screen so
    /// "the one about kubernetes" can be turned into words that match.
    public static func instructions(for context: VoiceContext) -> String {
        var lines = [
            "You translate what someone said to a voice assistant for a reading app into exactly one command.",
            "Answer with only the command, in lowercase, with no quotes and no other words.",
            "Choose from these commands, filling in <words>, <name> or <number> from what was said:",
        ]
        lines += catalog.map { "- " + $0.phrase }
        lines.append("If none of them fits, or you are not sure, answer: none")
        lines.append("Never invent a command that is not listed. Never answer a question yourself.")
        lines.append("The app is showing the \(context.tab.title) tab.")
        if !context.items.isEmpty {
            lines.append("Articles on screen, in order: " + context.items.prefix(maxListed).enumerated()
                .map { "\($0.offset + 1). \($0.element)" }.joined(separator: "; "))
        }
        if !context.projects.isEmpty {
            lines.append("Projects: " + context.projects.prefix(maxListed).joined(separator: "; "))
        }
        return lines.joined(separator: "\n")
    }

    public static func prompt(for heard: String) -> String {
        "They said: \(heard.trimmingCharacters(in: .whitespacesAndNewlines))"
    }

    /// The phrase in a model's reply: its first line without quotes,
    /// markdown, a "command:" label, a wake word or a closing stop; `nil` for
    /// "none", nothing, or something too long to be a command.
    public static func cleanedReply(_ reply: String) -> String? {
        guard var line = reply.split(whereSeparator: \.isNewline).map(String.init)
            .first(where: { !$0.trimmingCharacters(in: .whitespaces).isEmpty }) else { return nil }
        let noise = CharacterSet(charactersIn: "\"'`*_ \t.!,").union(.whitespaces)
        line = line.trimmingCharacters(in: noise)
        for label in ["command:", "answer:"] where line.lowercased().hasPrefix(label) {
            line = String(line.dropFirst(label.count)).trimmingCharacters(in: noise)
        }
        var words = VoiceText.normalize(line)
        for wake in VoiceCommandParser.wakePhrases where words.hasPrefix(wake + " ") {
            words = String(words.dropFirst(wake.count + 1))
            break
        }
        guard !words.isEmpty, words != "none", words.count <= 120 else { return nil }
        return words
    }

    /// The command a reply stands for, worked out by the grammar. Never a
    /// question for your provider (that costs tokens, so it takes the word
    /// "ask"), and never a yes or no (only you say those).
    public static func command(fromReply reply: String, context: VoiceContext) -> VoiceCommand? {
        guard let phrase = cleanedReply(reply) else { return nil }
        var asked = context
        asked.isArmed = false
        guard case .command(let command) = VoiceCommandParser.parse("smartward " + phrase, context: asked) else { return nil }
        switch command {
        case .ask, .confirm, .decline: return nil
        default: return command
        }
    }
}
