import Foundation

/// The decisions a hands-free voice conversation makes around a chat turn,
/// kept out of the view so tests cover them.
public enum VoiceTurn {
    /// Why voice mode can't start yet.
    public enum StartBlocker: Equatable, Sendable {
        /// The chat's provider has no API key, so every turn would fail.
        case missingKey
        /// "Approve fetches and new sources automatically" is off, so a
        /// fetch or new source would wait on a card nobody can tap.
        case needsAutoApprove
    }

    public static func startBlocker(hasKey: Bool, autoApprove: Bool) -> StartBlocker? {
        if !hasKey { return .missingKey }
        if !autoApprove { return .needsAutoApprove }
        return nil
    }

    /// What to do once a spoken turn has run.
    public enum Outcome: Equatable, Sendable {
        /// Speak this, then listen for the next turn.
        case speak(String)
        /// Nothing to say (a tool-only round): listen again.
        case listen
        /// The turn failed: say this, then stop listening rather than keep
        /// taking turns that aren't getting through.
        case fail(String)
    }

    public static let failureMessage =
        "Sorry, that didn't go through, so I've stopped listening. The details are on screen."

    /// - Parameter clean: what the speech engine does to text before
    ///   speaking it (VoiceLoopKit's `SpeechService.speakableText`), applied
    ///   before the reply is shortened.
    public static func outcome(reply: String?, failed: Bool,
                               clean: (String) -> String = { $0 }) -> Outcome {
        if failed { return .fail(failureMessage) }
        guard let reply else { return .listen }
        let spoken = spokenText(reply, clean: clean)
        return spoken.isEmpty ? .listen : .speak(spoken)
    }

    /// Spoken replies stop around here, at a sentence boundary, and point to
    /// the rest on screen.
    public static let maxSpokenCharacters = 1_200
    static let truncationNote = " The rest is on screen."

    /// `reply` as it should be spoken: library citations like [R1] or
    /// [R1, R2] dropped (the Sources list on screen carries them), `clean`ed
    /// of markdown, links, code and tables, and then, if still long, cut at a
    /// sentence boundary. Cleaning first means the cut counts only what's
    /// actually said, and can't land inside a code block that would then be
    /// read aloud.
    public static func spokenText(_ reply: String, clean: (String) -> String = { $0 }) -> String {
        let uncited = reply
            .replacingOccurrences(of: #"\s*\[R\d+(?:\s*,\s*R\d+)*\]"#, with: "", options: .regularExpression)
        let text = clean(uncited).trimmingCharacters(in: .whitespacesAndNewlines)
        guard text.count > maxSpokenCharacters else { return text }

        let prefix = text.prefix(maxSpokenCharacters)
        let sentenceEnd = prefix.indices.last { index in
            let next = prefix.index(after: index)
            return ".!?".contains(prefix[index]) && next < prefix.endIndex && prefix[next].isWhitespace
        }
        let cut: Substring
        if let sentenceEnd {
            cut = prefix[...sentenceEnd]
        } else if let space = prefix.lastIndex(where: \.isWhitespace) {
            cut = prefix[..<space]
        } else {
            cut = prefix
        }
        return cut.trimmingCharacters(in: .whitespacesAndNewlines) + truncationNote
    }

    /// Added to the system prompt for a voice turn.
    public static let promptNote = """
    Hands-free voice conversation: the user is listening, not reading. Answer in a few short spoken sentences, \
    without tables, code, lists or URLs. Saving decisions or open items to a project isn't available by voice; if \
    something should be saved, say so and suggest saving it later in a typed chat.
    """
}
