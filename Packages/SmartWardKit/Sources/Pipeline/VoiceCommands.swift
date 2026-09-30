import Foundation

// Spoken commands: what was said (text from the recognizer) → a typed
// command, given what's on screen. Pure, so tests cover the grammar; the
// app listens, runs the command and speaks back.

public enum VoiceTab: String, CaseIterable, Equatable, Sendable {
    case today, reading, graph, chat, projects

    public var title: String {
        switch self {
        case .today: return "Today"
        case .reading: return "Reading"
        case .graph: return "Graph"
        case .chat: return "Chat"
        case .projects: return "Projects"
        }
    }
}

public enum VoiceReadingFilter: Equatable, Sendable { case unread, starred, all }
public enum VoiceReadingOrder: Equatable, Sendable { case newest, mostRelevant }
public enum VoiceSpeedChange: Equatable, Sendable { case faster, slower, normal }

public enum VoiceCommand: Equatable, Sendable {
    case openTab(VoiceTab)
    case back
    case showFilter(VoiceReadingFilter)
    case sortBy(VoiceReadingOrder)
    case refresh
    /// The article at this 1-based position in the list on screen.
    case openItem(Int)
    case openLastItem
    /// An article named by its words, which matched nothing on screen.
    case openMatching(String)
    case openProject(String)
    case readAloud(summaryOnly: Bool)
    case pauseReading, resumeReading, stopReading, nextSection, previousSection
    case star(Bool)
    /// A spoken briefing of the unread articles, gist first.
    case startBriefing
    /// Today's digest, a theme at a time.
    case readDigest
    /// Skip to the next / go back to the previous article of a briefing.
    case nextArticle, previousArticle
    /// Say the article being briefed again from its start.
    case repeatItem
    /// Swap the gist for the whole article.
    case readFullItem
    /// Mark the article read and move on.
    case dismiss
    case markUnread
    case loadFullArticle
    case setSpeed(VoiceSpeedChange)
    case help
    case stopListening

    /// A short line for the caption, and to say back.
    public var confirmation: String {
        switch self {
        case .openTab(let tab): return "Opening \(tab.title)"
        case .back: return "Going back"
        case .showFilter(let filter):
            switch filter {
            case .unread: return "Showing unread"
            case .starred: return "Showing starred"
            case .all: return "Showing all"
            }
        case .sortBy(let order): return order == .newest ? "Newest first" : "Most relevant first"
        case .refresh: return "Refreshing"
        case .openItem(let number): return "Opening number \(number)"
        case .openLastItem: return "Opening the last one"
        case .openMatching(let words): return "Looking for \(words)"
        case .openProject(let name): return "Opening \(name)"
        case .readAloud(let summaryOnly): return summaryOnly ? "Reading the summary" : "Reading the article"
        case .pauseReading: return "Paused"
        case .resumeReading: return "Continuing"
        case .stopReading: return "Stopped reading"
        case .nextSection: return "Next"
        case .previousSection: return "Previous"
        case .star(let on): return on ? "Starred" : "Unstarred"
        case .startBriefing: return "Starting your briefing"
        case .readDigest: return "Reading today's digest"
        case .nextArticle: return "Next article"
        case .previousArticle: return "Previous article"
        case .repeatItem: return "Again"
        case .readFullItem: return "Reading the full article"
        case .dismiss: return "Dismissed"
        case .markUnread: return "Marked unread"
        case .loadFullArticle: return "Loading the full article"
        case .setSpeed(let change):
            switch change {
            case .faster: return "Faster"
            case .slower: return "Slower"
            case .normal: return "Normal speed"
            }
        case .help: return "Here's what you can say"
        case .stopListening: return "Voice off"
        }
    }
}

/// What's on screen and happening, which decides what a phrase means.
public struct VoiceContext: Equatable, Sendable {
    public var tab: VoiceTab
    /// An article is open in the reader.
    public var isReaderOpen: Bool
    /// An article is being read aloud (or is paused mid-reading).
    public var isReading: Bool
    /// The reading is a briefing (several articles, or the digest), so "next"
    /// means the next article and "repeat" the same one again.
    public var isBriefing: Bool
    /// The wake word was just heard, so the next phrase needs no prefix.
    public var isArmed: Bool
    /// The section being read right now.
    public var spokenNow: String
    /// Titles of the articles listed on screen, in order.
    public var items: [String]
    public var projects: [String]

    public init(tab: VoiceTab = .today, isReaderOpen: Bool = false, isReading: Bool = false,
                isBriefing: Bool = false, isArmed: Bool = false, spokenNow: String = "", items: [String] = [], projects: [String] = []) {
        self.tab = tab
        self.isReaderOpen = isReaderOpen
        self.isReading = isReading
        self.isBriefing = isBriefing
        self.isArmed = isArmed
        self.spokenNow = spokenNow
        self.items = items
        self.projects = projects
    }
}

public enum VoiceParse: Equatable, Sendable {
    /// Not meant for the app: no wake word (and not a control word while reading).
    case ignored
    /// Only the wake word: the next phrase is a command.
    case wakeOnly
    case command(VoiceCommand)
    /// Addressed to the app, but not something it does; the words after the wake word.
    case unrecognized(String)
}

// MARK: - Text

enum VoiceText {
    /// Lowercase, apostrophes dropped, everything but letters and digits a space.
    static func normalize(_ text: String) -> String {
        var out = ""
        for character in text.lowercased() {
            if character == "'" || character == "\u{2019}" || character == "\u{2018}" { continue }
            out.append(character.isLetter || character.isNumber ? character : " ")
        }
        return out.split(separator: " ").joined(separator: " ")
    }

    static func words(_ text: String) -> [String] {
        text.split(separator: " ").map(String.init)
    }

    /// Whether `phrase` appears in `text` as whole words. Both are normalized.
    static func containsPhrase(_ text: String, _ phrase: String) -> Bool {
        !phrase.isEmpty && " \(text) ".contains(" \(phrase) ")
    }
}

// MARK: - Matching what you named to what's there

public enum VoiceItemMatcher {
    static let ignoredWords: Set<String> = [
        "the", "a", "an", "about", "on", "of", "and", "article", "story", "item", "post",
        "called", "titled", "named", "one", "that", "this", "with", "for", "to", "in",
    ]

    /// The position of the candidate that best matches `query`, when at least
    /// 60% of its meaningful words are in a candidate (a word also matches
    /// the start of a longer one: "agent" finds "agents"). The earliest wins a tie.
    public static func best(_ query: String, in candidates: [String]) -> Int? {
        let wanted = VoiceText.words(VoiceText.normalize(query)).filter { !ignoredWords.contains($0) }
        guard !wanted.isEmpty else { return nil }
        var bestIndex: Int?
        var bestScore = 0.0
        for (index, candidate) in candidates.enumerated() {
            let have = VoiceText.words(VoiceText.normalize(candidate))
            let hits = wanted.filter { word in
                have.contains(word) || (word.count >= 3 && have.contains { $0.hasPrefix(word) })
            }.count
            let score = Double(hits) / Double(wanted.count)
            if score > bestScore + 1e-9 {
                bestScore = score
                bestIndex = index
            }
        }
        return bestScore >= 0.6 ? bestIndex : nil
    }
}

/// The microphone hears the app's own voice too. A phrase that is just a
/// stretch of what was being said is that echo, not you.
public enum EchoGuard {
    /// Phrases shorter than three words are judged by the parser instead
    /// (`VoiceContext.spokenNow`): a single "stop" says nothing about where it came from.
    public static func isEcho(_ heard: String, of spoken: [String]) -> Bool {
        let words = VoiceText.words(VoiceText.normalize(heard))
        guard words.count >= 3 else { return false }
        let phrase = words.joined(separator: " ")
        return spoken.contains { VoiceText.containsPhrase(VoiceText.normalize($0), phrase) }
    }
}

// MARK: - The grammar

public enum VoiceCommandParser {
    static let wakePhrases = ["smart ward", "smart word", "smart wart", "smartward", "smartwood"]
    static let leadIns = ["hey", "ok", "okay", "hi"]

    static let politeLeads = [
        "can you please", "could you please", "would you please", "can you", "could you", "would you",
        "will you", "please", "i want you to", "i want to", "i would like to", "id like to", "i wanna",
        "lets", "just", "go ahead and", "then",
    ]
    static let politeTrails = ["please", "for me", "now", "thanks", "thank you"]

    static let verbs = [
        "show me the", "show me", "show the", "show", "open up the", "open up", "open the", "open",
        "go to the", "go to", "switch to the", "switch to", "take me to the", "take me to",
        "navigate to the", "navigate to", "see the", "see", "display the", "display", "view the", "view",
        "list the", "list", "bring up the", "bring up", "pull up the", "pull up",
    ].sorted { $0.count > $1.count }

    // Phrases, as normalized text.
    static let help: Set<String> = [
        "help", "what can i say", "what can you do", "what are the commands", "list commands",
        "list the commands", "show commands", "what are my options", "commands",
    ]
    static let stopListening: Set<String> = [
        "stop listening", "turn off voice", "turn voice off", "voice off", "stop voice", "go to sleep",
        "mute", "mute yourself", "turn off voice navigation", "stop voice navigation",
    ]
    static let pause: Set<String> = [
        "pause", "pause reading", "hold on", "hang on", "wait", "quiet", "be quiet", "silence", "shush", "stop",
    ]
    static let stopReading: Set<String> = [
        "stop reading", "cancel", "cancel reading", "end reading", "thats enough", "enough", "done", "im done",
    ]
    static let resume: Set<String> = [
        "resume", "resume reading", "continue", "continue reading", "keep going", "keep reading", "go on",
        "carry on", "go ahead", "play",
    ]
    static let next: Set<String> = [
        "next", "next section", "next paragraph", "next one", "skip", "skip this", "skip ahead", "skip section",
        "skip paragraph", "move on", "forward",
    ]
    static let previous: Set<String> = [
        "previous", "previous section", "previous paragraph", "last section", "last paragraph", "rewind",
        "repeat", "repeat that", "say that again", "again",
    ]
    /// Back a screen, or, while reading, back a section.
    static let backOrPrevious: Set<String> = ["back", "go back", "back up"]
    static let backOnly: Set<String> = ["go up", "return", "close", "close this", "close article"]

    // Hands-free reading.
    static let briefing: Set<String> = [
        "brief me", "give me a briefing", "give me my briefing", "start a briefing", "start my briefing",
        "start the briefing", "read my news", "read me my news", "read me the news", "read the news",
        "read my unread", "read my unread articles", "read me my unread articles", "catch me up", "whats new",
        "brief me on my reading",
    ]
    static let digest: Set<String> = [
        "read the digest", "read todays digest", "read me the digest", "read me todays digest", "read my digest",
        "read the daily digest", "give me the digest", "give me todays digest", "whats in the digest",
    ]
    static let nextArticle: Set<String> = [
        "next article", "next story", "next item", "skip article", "skip this article", "skip story", "skip this story",
    ]
    static let previousArticle: Set<String> = [
        "previous article", "previous story", "previous item", "last article", "last story", "go back an article",
    ]
    /// In a briefing "next" and "skip" move to the next article, not the next paragraph.
    static let nextInBriefing: Set<String> = ["next", "next one", "skip", "skip this", "skip ahead", "move on", "forward"]
    static let previousInBriefing: Set<String> = ["previous", "previous one", "back", "go back", "back up"]
    static let repeatWords: Set<String> = ["repeat", "repeat that", "say that again", "again", "repeat this", "say it again"]
    /// The whole article; in a briefing, in place of the gist.
    static let readMore: Set<String> = [
        "read this one", "tell me more", "more detail", "read more", "go deeper", "read the full article",
        "read the full text", "read the whole story", "read the full story",
    ]
    static let dismiss: Set<String> = [
        "dismiss", "dismiss this", "dismiss it", "dismiss this article", "dismiss the article", "mark as read",
        "mark read", "mark it read", "mark this read", "mark this as read", "mark it as read", "not interested",
    ]
    static let markUnread: Set<String> = [
        "mark as unread", "mark unread", "mark it unread", "mark this unread", "mark this as unread",
        "mark it as unread", "keep unread", "keep it unread", "keep this unread",
    ]
    static let loadFull: Set<String> = [
        "load the full article", "load full article", "load the full text", "load full text", "get the full article",
        "get the full text", "fetch the full article", "fetch the full text", "download the full article",
        "download the full text",
    ]
    static let faster: Set<String> = ["faster", "speak faster", "read faster", "speed up", "go faster", "speed it up", "talk faster"]
    static let slower: Set<String> = ["slower", "speak slower", "read slower", "slow down", "go slower", "slow it down", "talk slower"]
    static let normalSpeed: Set<String> = [
        "normal speed", "regular speed", "default speed", "reset speed", "normal pace", "speak normally",
    ]

    /// Said with no wake word while something's being read.
    static let bareControls: Set<String> = [
        "pause", "stop", "hold on", "hang on", "wait", "quiet", "be quiet", "silence", "resume", "continue",
        "keep going", "keep reading", "go on", "carry on", "next", "next section", "next paragraph", "skip",
        "previous", "previous section", "go back", "back", "stop reading", "repeat", "repeat that",
        "next article", "next story", "previous article", "previous story", "read this one", "tell me more",
        "star it", "star this", "dismiss", "dismiss it", "mark as read", "mark read", "faster", "slower",
        "speed up", "slow down", "normal speed",
    ]

    static let star: Set<String> = [
        "star this", "star it", "star this article", "star the article", "favorite this", "favourite this",
        "mark as favorite", "bookmark this",
    ]
    static let unstar: Set<String> = [
        "unstar this", "unstar it", "unstar this article", "remove the star", "remove star", "unfavorite this",
    ]
    static let readWhole: Set<String> = [
        "read", "read this", "read it", "read this article", "read the article", "read it aloud", "read aloud",
        "read this aloud", "read this article aloud", "read the article aloud", "read this to me", "read it to me",
        "read to me", "read me the article", "read the article to me", "read this article to me", "start reading",
        "read the whole article", "read the whole thing", "read everything",
    ]
    static let readSummary: Set<String> = [
        "read the summary", "read summary", "read me the summary", "read the summary aloud",
        "read the summary to me", "summarize this", "summarize it", "summarize this article",
        "give me the summary", "whats the summary",
    ]
    static let refresh: Set<String> = [
        "refresh", "refresh reading", "refresh my reading", "refresh my sources", "refresh sources", "update",
        "update my reading", "check for new articles", "check for updates", "get new articles",
        "fetch new articles", "get the latest", "reload",
    ]
    static let unreadNames: Set<String> = ["unread", "unread articles", "unread items", "my unread", "my unread articles"]
    static let starredNames: Set<String> = [
        "starred", "starred articles", "starred items", "my starred", "my starred articles", "favorites",
        "favourites", "my favorites", "my favourites",
    ]
    static let allNames: Set<String> = ["all", "all articles", "all items", "everything", "all of them"]
    static let newestOrders: Set<String> = [
        "sort by newest", "sort by date", "newest first", "sort by newest first", "order by newest",
        "show newest first", "sort newest", "sort by latest",
    ]
    static let relevantOrders: Set<String> = [
        "sort by relevance", "sort by relevant", "most relevant first", "sort by most relevant",
        "order by relevance", "show most relevant first", "sort by score", "sort by most relevant first",
    ]

    static let tabNames: [(tab: VoiceTab, names: Set<String>)] = [
        (.today, ["today", "todays", "todays digest", "the digest", "digest", "daily digest", "my digest"]),
        (.reading, ["reading", "reading list", "articles", "my reading", "my articles", "news", "the news"]),
        (.graph, ["graph", "the graph", "knowledge graph", "my graph", "themes", "theme graph"]),
        (.chat, ["chat", "chats", "my chats", "conversations", "strategist", "the strategist"]),
        (.projects, ["projects", "my projects", "project list", "the projects"]),
    ]

    static let ordinals: [String: Int] = [
        "first": 1, "second": 2, "third": 3, "fourth": 4, "fifth": 5, "sixth": 6, "seventh": 7, "eighth": 8,
        "ninth": 9, "tenth": 10, "1st": 1, "2nd": 2, "3rd": 3, "4th": 4, "5th": 5, "6th": 6, "7th": 7, "8th": 8,
        "9th": 9, "10th": 10,
    ]
    static let cardinals: [String: Int] = [
        "one": 1, "two": 2, "three": 3, "four": 4, "five": 5, "six": 6, "seven": 7, "eight": 8, "nine": 9, "ten": 10,
    ]

    // MARK: Parse

    public static func parse(_ heard: String, context: VoiceContext) -> VoiceParse {
        let text = VoiceText.normalize(heard)
        guard !text.isEmpty else { return .ignored }
        if let afterWake = stripWake(text) {
            return afterWake.isEmpty ? .wakeOnly : interpret(afterWake, context)
        }
        if context.isArmed { return interpret(text, context) }
        return bare(text, context)
    }

    /// What follows the wake word (with the lead-in before it dropped), or
    /// `nil` when the phrase doesn't start with it.
    static func stripWake(_ text: String) -> String? {
        var rest = text
        for lead in leadIns where rest.hasPrefix(lead + " ") {
            rest = String(rest.dropFirst(lead.count + 1))
            break
        }
        for wake in wakePhrases {
            if rest == wake { return "" }
            if rest.hasPrefix(wake + " ") { return String(rest.dropFirst(wake.count + 1)) }
        }
        return nil
    }

    private static func interpret(_ raw: String, _ context: VoiceContext) -> VoiceParse {
        let body = cleanBody(raw)
        // Just "please" after the wake word is still just the wake word.
        if body.isEmpty || politeLeads.contains(body) || politeTrails.contains(body) { return .wakeOnly }
        if let found = command(for: body, context) { return .command(found) }
        return .unrecognized(body)
    }

    /// Control words with no wake word, only while something's being read,
    /// and never when the voice is saying that very word (it's the echo).
    private static func bare(_ text: String, _ context: VoiceContext) -> VoiceParse {
        guard context.isReading, bareControls.contains(text),
              !VoiceText.containsPhrase(VoiceText.normalize(context.spokenNow), text),
              let found = command(for: text, context) else { return .ignored }
        return .command(found)
    }

    static func cleanBody(_ text: String) -> String {
        var body = text
        var changed = true
        while changed {
            changed = false
            for lead in politeLeads where body.hasPrefix(lead + " ") {
                body = String(body.dropFirst(lead.count + 1))
                changed = true
                break
            }
            for trail in politeTrails where body.hasSuffix(" " + trail) {
                body = String(body.dropLast(trail.count + 1))
                changed = true
                break
            }
        }
        return body
    }

    static func dropVerb(_ text: String) -> (rest: String, hadVerb: Bool) {
        for verb in verbs where text.hasPrefix(verb + " ") {
            return (String(text.dropFirst(verb.count + 1)), true)
        }
        return (text, false)
    }

    // MARK: Phrases → commands

    private static func command(for body: String, _ context: VoiceContext) -> VoiceCommand? {
        if help.contains(body) || body.hasPrefix("what can i say") { return .help }
        if stopListening.contains(body) { return .stopListening }

        if pause.contains(body) { return .pauseReading }
        if stopReading.contains(body) { return .stopReading }
        if resume.contains(body) { return .resumeReading }
        if nextArticle.contains(body) { return .nextArticle }
        if previousArticle.contains(body) { return .previousArticle }
        if context.isBriefing {
            if nextInBriefing.contains(body) { return .nextArticle }
            if previousInBriefing.contains(body) { return .previousArticle }
            if repeatWords.contains(body) { return .repeatItem }
        }
        if next.contains(body) { return .nextSection }
        if previous.contains(body) { return .previousSection }
        if backOrPrevious.contains(body) { return context.isReading ? .previousSection : .back }
        if backOnly.contains(body) { return .back }

        if briefing.contains(body) { return .startBriefing }
        if digest.contains(body) { return .readDigest }
        if readMore.contains(body) { return context.isBriefing ? .readFullItem : .readAloud(summaryOnly: false) }
        if dismiss.contains(body) { return .dismiss }
        if markUnread.contains(body) { return .markUnread }
        if loadFull.contains(body) { return .loadFullArticle }
        if faster.contains(body) { return .setSpeed(.faster) }
        if slower.contains(body) { return .setSpeed(.slower) }
        if normalSpeed.contains(body) { return .setSpeed(.normal) }

        if star.contains(body) { return .star(true) }
        if unstar.contains(body) { return .star(false) }
        if readSummary.contains(body) { return .readAloud(summaryOnly: true) }
        if readWhole.contains(body) { return context.isBriefing ? .readFullItem : .readAloud(summaryOnly: false) }
        if refresh.contains(body) { return .refresh }
        if newestOrders.contains(body) { return .sortBy(.newest) }
        if relevantOrders.contains(body) { return .sortBy(.mostRelevant) }

        let (rest, hadVerb) = dropVerb(body)
        if unreadNames.contains(rest) { return .showFilter(.unread) }
        if starredNames.contains(rest) { return .showFilter(.starred) }
        if allNames.contains(rest), hadVerb || context.tab == .reading { return .showFilter(.all) }

        if let named = tabNamed(rest) { return .openTab(named) }
        if let opened = projectCommand(rest, context) { return opened }

        guard hadVerb else { return nil }
        if let position = itemPosition(rest) { return position }
        let query = matchQuery(rest)
        guard !query.isEmpty else { return nil }
        if let index = VoiceItemMatcher.best(query, in: context.items) { return .openItem(index + 1) }
        return .openMatching(query)
    }

    private static func tabNamed(_ text: String) -> VoiceTab? {
        var name = text
        for suffix in [" tab", " screen", " page"] where name.hasSuffix(suffix) {
            name = String(name.dropLast(suffix.count))
            break
        }
        return tabNames.first { $0.names.contains(name) }?.tab
    }

    /// "project inference stack", "project called home lab".
    private static func projectCommand(_ text: String, _ context: VoiceContext) -> VoiceCommand? {
        var words = VoiceText.words(text)
        guard words.first == "project", words.count > 1 else { return nil }
        words.removeFirst()
        while let first = words.first, ["called", "named", "titled"].contains(first), words.count > 1 {
            words.removeFirst()
        }
        let query = words.joined(separator: " ")
        if let index = VoiceItemMatcher.best(query, in: context.projects) {
            return .openProject(context.projects[index])
        }
        return .openProject(query)
    }

    /// "the second one", "number 3", "article four", "the last one".
    private static func itemPosition(_ text: String) -> VoiceCommand? {
        var words = VoiceText.words(text)
        if words.first == "the" { words.removeFirst() }
        let nouns: Set<String> = ["one", "article", "item", "story", "result", "post"]
        while let last = words.last, nouns.contains(last), words.count > 1 { words.removeLast() }
        if let first = words.first, words.count == 2, nouns.union(["number", "no"]).contains(first) {
            words.removeFirst()
        }
        guard words.count == 1, let word = words.first else { return nil }
        if word == "last" { return .openLastItem }
        if let number = ordinals[word] ?? cardinals[word] ?? Int(word), number >= 1 { return .openItem(number) }
        return nil
    }

    /// What's left of "the article about agents" once the filler is gone.
    private static func matchQuery(_ text: String) -> String {
        let fillers: Set<String> = [
            "the", "article", "articles", "story", "item", "post", "one", "about", "on", "called", "titled",
            "named", "for", "regarding", "that", "is", "with",
        ]
        var words = VoiceText.words(text)
        while let first = words.first, fillers.contains(first) { words.removeFirst() }
        return words.joined(separator: " ")
    }
}

// MARK: - Help

public enum VoiceCommandHelp {
    /// Example phrases for what's on screen now, most relevant first.
    public static func lines(for context: VoiceContext) -> [String] {
        var lines: [String] = []
        if context.isBriefing {
            lines.append("Next, previous, repeat, tell me more, star it, dismiss, faster, slower (no need to say SmartWard)")
        }
        if context.isReading {
            lines.append("Pause, keep going, next, previous, stop reading (no need to say SmartWard)")
        }
        if context.isReaderOpen {
            lines.append("SmartWard, read this article")
            lines.append("SmartWard, read the summary")
            lines.append("SmartWard, star this")
        }
        if context.tab == .reading {
            lines.append("SmartWard, open the second one")
            lines.append("SmartWard, open the article about agents")
            lines.append("SmartWard, show starred")
            lines.append("SmartWard, refresh")
        }
        if context.tab == .projects {
            lines.append("SmartWard, open project inference stack")
        }
        lines.append("SmartWard, open Reading (or Today, Graph, Chat, Projects)")
        lines.append("SmartWard, brief me")
        lines.append("SmartWard, read today's digest")
        lines.append("SmartWard, go back")
        lines.append("SmartWard, what can I say?")
        lines.append("SmartWard, stop listening")
        return lines
    }

    /// The first few lines as one spoken answer.
    public static func spoken(for context: VoiceContext, limit: Int = 4) -> String {
        lines(for: context).prefix(limit)
            .map { $0.replacingOccurrences(of: "SmartWard, ", with: "Say SmartWard, ") }
            .joined(separator: ". ") + "."
    }
}
