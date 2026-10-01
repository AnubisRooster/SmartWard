import Foundation
import SwiftUI
import SwiftData
import AVFoundation
import UIKit
import Observation
import KnowledgeStore
import Pipeline
import StrategistCore
import VoiceLoopKit

extension AppTab {
    init(_ tab: VoiceTab) {
        switch tab {
        case .today: self = .today
        case .reading: self = .reading
        case .graph: self = .graph
        case .chat: self = .chat
        case .projects: self = .projects
        }
    }

    var voiceTab: VoiceTab {
        switch self {
        case .today: return .today
        case .reading: return .reading
        case .graph: return .graph
        case .chat: return .chat
        case .projects: return .projects
        }
    }
}

/// Controls the app by voice: "SmartWard, open Reading", "SmartWard, open the
/// second one", "SmartWard, read this article", "SmartWard, brief me", and, while
/// something is being read, "pause", "keep going", "next" with no wake word.
///
/// It listens (`SpeechCommandRecognizer`, on-device only) while it's switched
/// on in Settings and the app is in front and unlocked, works out what a phrase
/// means for what's on screen (`VoiceCommandParser`, in SmartWardKit), does it
/// through `AppNavigation` and `ArticleReadoutController`, and says what it did.
@MainActor
@Observable
final class VoiceCommandController {
    static let shared = VoiceCommandController()

    static let enabledKey = "voice.navigation.enabled"
    static let speakKey = "voice.navigation.speak"
    /// Whether wording the grammar doesn't know is worked out by a language
    /// model (your provider, then Apple Intelligence), `VoiceIntentResolver`.
    static let naturalKey = "voice.navigation.natural"
    /// Hands-free: while the app is open, no wake word is needed.
    static let handsFreeKey = "voice.navigation.handsFree"

    static var isHandsFree: Bool {
        let defaults = UserDefaults.standard
        return defaults.object(forKey: handsFreeKey) == nil ? true : defaults.bool(forKey: handsFreeKey)
    }

    enum Phase: Equatable {
        case off, starting, listening
        /// It can't listen, and why.
        case unavailable(String)
    }

    private(set) var phase = Phase.off
    /// The words being heard right now.
    private(set) var heard = ""
    /// What it last did or said.
    private(set) var caption = ""
    /// The wake word was just heard: the next phrase needs no prefix.
    private(set) var isArmed = false

    /// What a command did: the caption, and whether to say it aloud.
    private struct Outcome {
        var text: String
        var spoken: String?
        /// The answer to a question: said even over a reading (which pauses),
        /// and whatever the spoken-confirmations setting says.
        var isAnswer = false

        static func said(_ text: String) -> Outcome { Outcome(text: text, spoken: text) }
        static func silent(_ text: String) -> Outcome { Outcome(text: text, spoken: nil) }
        static func answer(_ text: String) -> Outcome { Outcome(text: text, spoken: text, isAnswer: true) }
    }

    @ObservationIgnored private var recognizer: any CommandRecognizing = SpeechCommandRecognizer()
    /// The engine `recognizer` is (a change in Settings swaps it at the next start).
    @ObservationIgnored private var engine = VoiceEngine.standard
    @ObservationIgnored private var wanted = false
    @ObservationIgnored private var startTask: Task<Void, Never>?
    @ObservationIgnored private var armedUntil = Date.distantPast
    @ObservationIgnored private var armedGeneration = 0
    @ObservationIgnored private var captionGeneration = 0
    /// A change waiting for its yes (`VoiceConfirmationGate`).
    @ObservationIgnored private var gate = VoiceConfirmationGate()
    /// Bumped for each phrase sent to a model, so a slow answer to an old one is dropped.
    @ObservationIgnored private var understandGeneration = 0
    /// A question is with the strategist; one at a time.
    @ObservationIgnored private var isAsking = false
    @ObservationIgnored private var interruptionObserver: NSObjectProtocol?

    /// How long after the wake word the next phrase needs no prefix.
    private static let armedWindow: TimeInterval = 6

    private init() {
        wire(recognizer)
        interruptionObserver = NotificationCenter.default.addObserver(
            forName: AVAudioSession.interruptionNotification, object: nil, queue: .main
        ) { [weak self] note in
            let type = (note.userInfo?[AVAudioSessionInterruptionTypeKey] as? UInt)
                .flatMap { AVAudioSession.InterruptionType(rawValue: $0) }
            Task { @MainActor in self?.interruption(type) }
        }
    }

    // MARK: Listening

    private func wire(_ recognizer: any CommandRecognizing) {
        recognizer.onPartial = { [weak self] text in self?.heard = text }
        recognizer.onPhrase = { [weak self] phrase in self?.handle(phrase) }
        recognizer.onFailure = { [weak self] failure in
            self?.phase = .unavailable(failure.localizedDescription)
            self?.heard = ""
        }
    }

    /// Listens with `engine`, replacing the recognizer if it's a different one.
    private func useRecognizer(for engine: VoiceEngine) {
        guard engine != self.engine else { return }
        recognizer.stop()
        recognizer = engine == .newer ? AnalyzerCommandRecognizer() : SpeechCommandRecognizer()
        self.engine = engine
        wire(recognizer)
    }

    /// The speech engine was changed in Settings: listen with the new one.
    func engineChanged() {
        guard wanted else { return }
        stopEverything()
        startIfNeeded()
    }

    /// Says whether it should be listening now: switched on, and the app in
    /// front, unlocked and not sharing the microphone with a voice chat.
    func reconcile(shouldListen: Bool) {
        wanted = shouldListen
        if shouldListen {
            startIfNeeded()
        } else {
            stopEverything()
        }
    }

    private func startIfNeeded() {
        guard phase == .off else { return }
        phase = .starting
        startTask = Task { @MainActor [weak self] in
            guard let self else { return }
            let preferred = VoiceEngine.current
            do {
                useRecognizer(for: preferred)
                do {
                    try await recognizer.start()
                } catch where preferred == .newer {
                    // The newer engine can't run here: the standard one, and say so.
                    recognizer.stop()
                    useRecognizer(for: .standard)
                    try await recognizer.start()
                    present(.silent("The newer speech engine isn't available here, so I'm using the standard one."))
                }
                if wanted {
                    phase = .listening
                } else {
                    recognizer.stop()
                    phase = .off
                }
            } catch {
                recognizer.stop()
                phase = wanted ? .unavailable(error.localizedDescription) : .off
            }
        }
    }

    private func stopEverything() {
        startTask?.cancel()
        startTask = nil
        recognizer.stop()
        phase = .off
        heard = ""
        isArmed = false
    }

    /// A call or another app took the microphone; carry on when it's given back.
    private func interruption(_ type: AVAudioSession.InterruptionType?) {
        switch type {
        case .began:
            guard phase == .listening || phase == .starting else { return }
            startTask?.cancel()
            recognizer.stop()
            phase = .off
            heard = ""
        case .ended:
            if wanted { startIfNeeded() }
        default:
            break
        }
    }

    // MARK: A phrase

    private func handle(_ phrase: String) {
        heard = ""
        // Never take the app's own voice, or the tail of it, for a command.
        if VoiceSpeaker.shared.isBusy { return }
        let readout = ArticleReadoutController.shared
        if EchoGuard.isEcho(phrase, of: [readout.currentText, VoiceSpeaker.shared.lastSpoken]) { return }

        let context = makeContext()
        switch VoiceCommandParser.parse(phrase, context: context) {
        case .ignored:
            return
        case .wakeOnly:
            arm()
            present(.silent("Listening…"))
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
        case .command(let command):
            disarm()
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
            switch command {
            case .confirm, .decline:
                present(resolveConfirmation(yes: command == .confirm))
            default:
                // Anything but a yes or no drops what was waiting.
                gate.cancel()
                run(command, context: context)
            }
        case .unrecognized(let words):
            disarm()
            understand(words, context: context)
        }
    }

    private func notUnderstood() {
        UINotificationFeedbackGenerator().notificationOccurred(.warning)
        present(.answer("Sorry, I didn't get that."))
    }

    /// Words the grammar doesn't know: a language model works out which of the
    /// app's actions they mean, and they run through the same steps (and the
    /// same confirmations) as if they'd been said in the grammar's words.
    private func understand(_ words: String, context: VoiceContext) {
        guard Self.understandsNaturalPhrasing else { return notUnderstood() }
        understandGeneration += 1
        let mine = understandGeneration
        present(.silent("Thinking…"))
        let readout = ArticleReadoutController.shared
        let nowReading = (readout.currentArticle ?? (readout.isActive ? AppNavigation.shared.readerArticle : nil))?.title
        Task { @MainActor [weak self] in
            let outcome = await VoiceIntentResolver.resolve(words, context: context, nowReading: nowReading,
                                                             library: self?.library)
            // Something newer was said meanwhile.
            guard let self, mine == self.understandGeneration else { return }
            guard case .actions(let commands)? = outcome, !commands.isEmpty else { return self.notUnderstood() }
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
            self.gate.cancel()
            self.runPlan(commands)
        }
    }

    /// Several actions in order ("go to Reading, show starred"). A change that
    /// needs your yes stops the plan there and waits for it.
    private func runPlan(_ commands: [VoiceCommand]) {
        var last: Outcome?
        for command in commands {
            last = outcome(for: command, context: makeContext())
            if command.needsConfirmation { break }
        }
        if let last { present(last) }
    }

    private static var understandsNaturalPhrasing: Bool {
        let defaults = UserDefaults.standard
        let wanted = defaults.object(forKey: naturalKey) == nil ? true : defaults.bool(forKey: naturalKey)
        return wanted && (VoiceIntentResolver.providerAvailable || VoiceIntentResolver.onDeviceAvailable)
    }

    private func arm() {
        armedUntil = Date().addingTimeInterval(Self.armedWindow)
        isArmed = true
        armedGeneration += 1
        let mine = armedGeneration
        Task { @MainActor [weak self] in
            try? await Task.sleep(nanoseconds: UInt64(Self.armedWindow * 1_000_000_000))
            guard let self, mine == self.armedGeneration else { return }
            self.isArmed = false
        }
    }

    private func disarm() {
        armedUntil = .distantPast
        armedGeneration += 1
        isArmed = false
    }

    private func makeContext() -> VoiceContext {
        let navigation = AppNavigation.shared
        let readout = ArticleReadoutController.shared
        return VoiceContext(tab: navigation.tab.voiceTab,
                            isReaderOpen: navigation.readerArticle != nil,
                            isReading: readout.isActive,
                            isBriefing: readout.isBriefing,
                            isProjectOpen: openProject != nil,
                            isConfirming: gate.isWaiting(now: Date()),
                            isHandsFree: Self.isHandsFree,
                            isArmed: Date() < armedUntil,
                            spokenNow: readout.currentText,
                            items: listed().map(\.title),
                            projects: projectNames())
    }

    // MARK: Doing it

    /// The project whose card is showing.
    private var openProject: Project? {
        let navigation = AppNavigation.shared
        guard navigation.tab == .projects, !navigation.projectsPath.isEmpty else { return nil }
        return navigation.projectOpen
    }

    private var library: ModelContext? {
        guard case .success(let container) = AppStore.container else { return nil }
        return container.mainContext
    }

    /// The articles "the first one" counts in: the list on screen (Reading, or
    /// search results), or, before the Reading tab has been shown, your unread
    /// articles in the Reading list's order.
    private func listed() -> [Article] {
        let navigation = AppNavigation.shared
        if !navigation.listedArticles.isEmpty { return navigation.listedArticles }
        guard let library else { return [] }
        let unread = (try? library.fetch(FetchDescriptor<Article>(predicate: #Predicate { $0.isRead == false }))) ?? []
        let reading = unread.filter { $0.stage != .triagedOut && $0.source?.sourceKind != .githubRepo }
        let order = ReadingOrder(rawValue: UserDefaults.standard.string(forKey: ReadingOrder.storageKey) ?? "") ?? .newest
        switch order {
        case .newest: return reading.sorted { ($0.publishedAt ?? $0.ingestedAt) > ($1.publishedAt ?? $1.ingestedAt) }
        case .relevant: return reading.sorted { $0.relevance > $1.relevance }
        }
    }

    /// The listed article best matching `words`.
    private func article(about words: String) -> Article? {
        let list = listed()
        return VoiceItemMatcher.best(words, in: list.map(\.title)).map { list[$0] }
    }

    /// Opens `article` and reads it aloud (or its summary).
    private func read(_ article: Article, summaryOnly: Bool) -> Outcome {
        let navigation = AppNavigation.shared
        // Already open: pushing it again could replace the screen, whose exit stops this reading.
        if navigation.readerArticle?.id != article.id { navigation.openArticle(article) }
        ArticleReadoutController.shared.start(article, scope: summaryOnly ? .summaryOnly : .whole,
                                              sourceName: article.sourceLabel)
        return .silent(summaryOnly ? "Reading the summary of \(article.title)" : "Reading \(article.title)")
    }

    private func projectNames() -> [String] {
        guard let library else { return [] }
        let projects = (try? library.fetch(FetchDescriptor<Project>(sortBy: [SortDescriptor(\.name)]))) ?? []
        return projects.map(\.name)
    }

    private func latestDigest() -> Digest? {
        guard let library else { return nil }
        var descriptor = FetchDescriptor<Digest>(sortBy: [SortDescriptor(\.createdAt, order: .reverse)])
        descriptor.fetchLimit = 1
        return (try? library.fetch(descriptor))?.first
    }

    /// "Brief me": your top unread articles, gist first.
    private func startBriefing() -> Outcome {
        switch BriefingLauncher.start(fromSiri: false) {
        case .success: return .silent(VoiceCommand.startBriefing.confirmation)
        case .failure(let refusal): return .said(refusal.localizedDescription)
        }
    }

    /// Runs the search the Reading tab is showing, and says what it found, so
    /// "open the first one" has something to mean.
    private func search(_ words: String, in library: ModelContext) {
        Task { @MainActor [weak self] in
            let hits = await SearchController.shared.search(words, context: library)
            let navigation = AppNavigation.shared
            // Something newer was searched for meanwhile.
            guard let self, navigation.readingQuery == words else { return }
            let ids = hits.map(\.articleID)
            let found = (try? library.fetch(FetchDescriptor<Article>(predicate: #Predicate { ids.contains($0.id) }))) ?? []
            var byID: [UUID: Article] = [:]
            for article in found { byID[article.id] = article }
            let ordered = hits.compactMap { byID[$0.articleID] }
            navigation.listedArticles = ordered
            self.present(.answer(VoiceAnswers.searchResults(query: words, titles: ordered.map(\.title),
                                                             total: ordered.count)))
        }
    }

    /// The strategist's answer, read aloud like an article: pause, keep going and stop work on it.
    private func ask(_ question: String, in library: ModelContext) {
        isAsking = true
        Task { @MainActor [weak self] in
            let answer = await VoiceAsk.ask(question, context: library)
            guard let self else { return }
            self.isAsking = false
            switch answer {
            case .spoken(let text):
                self.present(.silent("Reading the answer"))
                ArticleReadoutController.shared.startAnswer(text, title: question)
            case .failed(let message):
                self.present(.answer(message))
            }
        }
    }

    private func answer(for status: VoiceStatus) -> String {
        guard let library else { return "I couldn't open your library." }
        switch status {
        case .unreadCount:
            let unread = (try? library.fetch(FetchDescriptor<Article>(predicate: #Predicate { $0.isRead == false }))) ?? []
            return VoiceAnswers.unread(LibraryVoiceQueries.unreadCount(in: unread))
        case .refresh:
            let ingest = IngestController.shared
            return VoiceAnswers.refresh(isRefreshing: ingest.isRefreshing, lastSummary: ingest.lastSummary)
        case .failingSources:
            let sources = (try? library.fetch(FetchDescriptor<Source>())) ?? []
            let names = sources.filter { $0.isEnabled && $0.sourceKind.isPolled && $0.lastError != nil }
                .map { $0.title.isEmpty ? $0.url : $0.title }
                .sorted { $0.localizedStandardCompare($1) == .orderedAscending }
            return VoiceAnswers.failingSources(names)
        case .spendToday:
            let budget = BudgetSettings.current
            let spent = (try? budget.spentToday(context: library)) ?? 0
            return VoiceAnswers.spend(spent: spent, cap: budget.capUSD)
        }
    }

    /// Says the question and waits for a yes; the change is made only by `resolveConfirmation`.
    private func askToConfirm(_ command: VoiceCommand, _ prompt: String) -> Outcome {
        gate.ask(command, prompt: prompt, now: Date())
        return .answer(prompt)
    }

    /// "Yes" runs what was asked; "no", or a yes that came too late, doesn't.
    private func resolveConfirmation(yes: Bool) -> Outcome {
        switch gate.answer(yes: yes, now: Date()) {
        case .nothingToConfirm: return .answer("There's nothing to confirm.")
        case .cancelled: return .answer("Cancelled.")
        case .run(let action): return perform(confirmed: action)
        }
    }

    /// The changes voice may make to your projects, after a yes.
    private func perform(confirmed action: VoiceCommand) -> Outcome {
        guard let project = openProject, let library else { return .answer(VoiceAnswers.noProjectOpen) }
        switch action {
        case .markItemDone(let number):
            let items = ProjectVoiceQueries.openItems(of: project)
            guard items.indices.contains(number - 1) else { return .answer("That item is no longer open.") }
            items[number - 1].status = .done
            try? library.save()
            return .answer("Done. Marked number \(number) as done.")
        case .acceptBriefUpdate:
            guard let revision = BriefEditing.pending(for: project) else { return .answer(VoiceAnswers.noBriefUpdate) }
            do {
                try BriefEditing.accept(revision)
                try? library.save()
                return .answer("Accepted. The brief is updated.")
            } catch {
                return .answer(error.localizedDescription)
            }
        case .rejectBriefUpdate:
            guard let revision = BriefEditing.pending(for: project) else { return .answer(VoiceAnswers.noBriefUpdate) }
            do {
                try BriefEditing.reject(revision)
                try? library.save()
                return .answer("Rejected. The brief is unchanged.")
            } catch {
                return .answer(error.localizedDescription)
            }
        default:
            return .answer("There's nothing to confirm.")
        }
    }

    /// One notch of speech speed, kept within a range that stays understandable.
    private func changeSpeed(_ change: VoiceSpeedChange) {
        let step: Float = 0.05
        let current = VoiceSettings.current.ttsRate
        let target: Float
        switch change {
        case .faster: target = current + step
        case .slower: target = current - step
        case .normal: target = VoiceSettings.defaults.ttsRate
        }
        UserDefaults.standard.set(Double(min(max(target, 0.3), 0.7)), forKey: VoiceSettings.ttsRateKey)
    }

    /// Fetches the page behind a teaser; in a briefing, then reads it.
    private func loadFullText(of article: Article, in library: ModelContext) {
        Task { @MainActor [weak self] in
            do {
                try await IngestController.shared.loadFullText(of: article, context: library)
                guard let self else { return }
                let readout = ArticleReadoutController.shared
                if readout.currentArticle?.id == article.id, readout.expandCurrentToFull() {
                    self.present(.silent("Reading the full article"))
                } else {
                    self.present(.said("Loaded the full article"))
                }
            } catch {
                self?.present(.said(error.localizedDescription))
            }
        }
    }

    private func run(_ command: VoiceCommand, context: VoiceContext) {
        present(outcome(for: command, context: context))
    }

    private func outcome(for command: VoiceCommand, context: VoiceContext) -> Outcome {
        let navigation = AppNavigation.shared
        let readout = ArticleReadoutController.shared

        switch command {
        case .openTab(let tab):
            navigation.show(AppTab(tab))
            return .said(command.confirmation)

        case .back:
            return navigation.back() ? .said(command.confirmation) : .said("There's nothing to go back to.")

        case .showFilter(let filter):
            navigation.show(.reading)
            switch filter {
            case .unread: navigation.readingFilter = .unread
            case .starred: navigation.readingFilter = .starred
            case .all: navigation.readingFilter = .all
            }
            return .said(command.confirmation)

        case .sortBy(let order):
            navigation.show(.reading)
            let value = order == .newest ? ReadingOrder.newest : ReadingOrder.relevant
            UserDefaults.standard.set(value.rawValue, forKey: ReadingOrder.storageKey)
            return .said(command.confirmation)

        case .refresh:
            guard let library else { return .said("I couldn't open your library.") }
            BackgroundWork.startContinuedRefresh(context: library)
            return .said(command.confirmation)

        case .openItem(let number):
            let list = listed()
            guard list.indices.contains(number - 1) else { return .said("There's no number \(number) in the list.") }
            navigation.openArticle(list[number - 1])
            return .said(command.confirmation)

        case .openLastItem:
            guard let last = listed().last else { return .said("There are no articles to pick from.") }
            navigation.openArticle(last)
            return .said(command.confirmation)

        case .openMatching(let words):
            guard let article = article(about: words) else { return .said("I couldn't find an article about \(words).") }
            navigation.openArticle(article)
            return .said("Opening \(article.title)")

        case .readItem(let number, let summaryOnly):
            let list = listed()
            guard list.indices.contains(number - 1) else { return .said("There's no number \(number) in the list.") }
            return read(list[number - 1], summaryOnly: summaryOnly)

        case .readMatching(let words, let summaryOnly):
            guard let article = article(about: words) else { return .said("I couldn't find an article about \(words).") }
            return read(article, summaryOnly: summaryOnly)

        case .openProject(let name):
            guard let library else { return .said("I couldn't open your library.") }
            let projects = (try? library.fetch(FetchDescriptor<Project>(sortBy: [SortDescriptor(\.name)]))) ?? []
            guard let index = VoiceItemMatcher.best(name, in: projects.map(\.name)) else {
                return .said("I couldn't find a project called \(name).")
            }
            navigation.openProject(projects[index])
            return .said("Opening \(projects[index].name)")

        case .readAloud(let summaryOnly):
            guard let article = navigation.readerArticle else { return .said("Open an article first.") }
            readout.start(article, scope: summaryOnly ? .summaryOnly : .whole, sourceName: article.sourceLabel)
            return .silent(command.confirmation)

        case .pauseReading:
            guard readout.isActive else { return .said("Nothing is being read.") }
            readout.pause()
            return .silent(command.confirmation)

        case .resumeReading:
            guard readout.isActive else { return .said("Nothing is being read.") }
            readout.resume()
            return .silent(command.confirmation)

        case .stopReading:
            guard readout.isActive else { return .said("Nothing is being read.") }
            readout.stop()
            return .silent(command.confirmation)

        case .nextSection:
            guard readout.isActive else { return .said("Nothing is being read.") }
            readout.next()
            return .silent(command.confirmation)

        case .previousSection:
            guard readout.isActive else { return .said("Nothing is being read.") }
            readout.previous()
            return .silent(command.confirmation)

        case .star(let on):
            guard let article = readout.currentArticle ?? navigation.readerArticle else {
                return .said("Open an article first.")
            }
            if article.isStarred != on {
                article.isStarred = on
                if on, let library { library.insert(ReadingSignal(articleID: article.id, kind: "star")) }
            }
            return .said(command.confirmation)

        case .startBriefing:
            return startBriefing()

        case .readDigest:
            guard let digest = latestDigest(), !digest.clusters.isEmpty else {
                return .said("There's no digest yet.")
            }
            guard readout.startDigest(digest) else { return .said("There's no digest yet.") }
            return .silent(command.confirmation)

        case .nextArticle:
            guard readout.isBriefing else { return .said("That works in a briefing. Say SmartWard, brief me.") }
            readout.nextItem()
            return .silent(command.confirmation)

        case .previousArticle:
            guard readout.isBriefing else { return .said("That works in a briefing. Say SmartWard, brief me.") }
            readout.previousItem()
            return .silent(command.confirmation)

        case .repeatItem:
            guard readout.isBriefing else { return .said("Nothing to repeat.") }
            readout.repeatItem()
            return .silent(command.confirmation)

        case .readFullItem:
            guard readout.expandCurrentToFull() else {
                return .said("I can read a whole article when you're in an article briefing.")
            }
            return .silent(command.confirmation)

        case .dismiss:
            guard let article = readout.currentArticle ?? navigation.readerArticle else {
                return .said("There's no article to dismiss.")
            }
            let inBriefing = readout.currentArticle?.id == article.id
            article.isRead = true
            library?.insert(ReadingSignal(articleID: article.id, kind: "dismiss"))
            if inBriefing { readout.nextItem() }
            return .said(command.confirmation)

        case .markUnread:
            guard let article = readout.currentArticle ?? navigation.readerArticle else {
                return .said("Open an article first.")
            }
            article.isRead = false
            return .said(command.confirmation)

        case .loadFullArticle:
            guard let article = readout.currentArticle ?? navigation.readerArticle, let library else {
                return .said("Open an article first.")
            }
            loadFullText(of: article, in: library)
            return .said(command.confirmation)

        case .setSpeed(let change):
            changeSpeed(change)
            readout.restartSegment()
            return .said(command.confirmation)

        case .search(let words):
            guard let library else { return .said("I couldn't open your library.") }
            navigation.show(.reading)
            navigation.readingQuery = words
            search(words, in: library)
            return .silent(command.confirmation)

        case .clearSearch:
            navigation.readingQuery = ""
            return .said(command.confirmation)

        case .ask(let question):
            guard let library else { return .said("I couldn't open your library.") }
            guard !isAsking else { return .said("I'm still working on your last question.") }
            ask(question, in: library)
            return .said("Asking the strategist. One moment.")

        case .status(let status):
            return .answer(answer(for: status))

        case .topThemes:
            guard let library else { return .said("I couldn't open your library.") }
            return .answer(VoiceAnswers.topThemes(LibraryVoiceQueries.topThemes(context: library)))

        case .aboutTheme(let words):
            guard let library else { return .said("I couldn't open your library.") }
            guard let theme = LibraryVoiceQueries.describeTheme(matching: words, context: library) else {
                return .answer("I couldn't find a theme called \(words).")
            }
            return .answer(VoiceAnswers.about(theme))

        case .readBrief:
            guard let project = openProject else { return .answer(VoiceAnswers.noProjectOpen) }
            let markdown = project.brief?.markdown.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
            guard !markdown.isEmpty else { return .answer(VoiceAnswers.noBrief) }
            let text = SpeechService.speakableText("Brief for \(project.name). \n\n" + markdown)
            guard readout.startAnswer(text, title: "\(project.name) brief") else { return .answer(VoiceAnswers.noBrief) }
            return .silent(command.confirmation)

        case .readOpenItems:
            guard let project = openProject else { return .answer(VoiceAnswers.noProjectOpen) }
            return .answer(VoiceAnswers.openItems(ProjectVoiceQueries.openItems(of: project).map { (kind: $0.kind, text: $0.text) }))

        case .readProjectReading:
            guard let project = openProject, let library else { return .answer(VoiceAnswers.noProjectOpen) }
            let related = ProjectVoiceQueries.relatedArticles(of: project, context: library)
            guard !related.isEmpty, readout.startBriefing(related) else { return .answer(VoiceAnswers.nothingRelated) }
            return .silent(command.confirmation)

        case .readBriefUpdate:
            guard let project = openProject else { return .answer(VoiceAnswers.noProjectOpen) }
            guard let revision = BriefEditing.pending(for: project) else { return .answer(VoiceAnswers.noBriefUpdate) }
            let counts = BriefDiff.counts(BriefDiff.lines(from: revision.baseMarkdown, to: revision.proposedMarkdown))
            return .answer(VoiceAnswers.briefUpdate(rationale: revision.rationale, added: counts.added,
                                                    removed: counts.removed))

        case .markItemDone(let number):
            guard let project = openProject else { return .answer(VoiceAnswers.noProjectOpen) }
            let items = ProjectVoiceQueries.openItems(of: project)
            guard items.indices.contains(number - 1) else {
                return .answer("There's no open item number \(number).")
            }
            let item = items[number - 1]
            return askToConfirm(command, VoiceAnswers.confirmMarkDone(number: number, kind: item.kind, text: item.text))

        case .acceptBriefUpdate, .rejectBriefUpdate:
            guard let project = openProject else { return .answer(VoiceAnswers.noProjectOpen) }
            guard BriefEditing.pending(for: project) != nil else { return .answer(VoiceAnswers.noBriefUpdate) }
            return askToConfirm(command, command == .acceptBriefUpdate ? VoiceAnswers.confirmAccept
                                                                       : VoiceAnswers.confirmReject)

        case .confirm, .decline:
            // Handled where a phrase arrives; only reached if run some other way.
            return .said("There's nothing to confirm.")

        case .help:
            let lines = VoiceCommandHelp.lines(for: context)
            return Outcome(text: lines.prefix(4).joined(separator: "\n"),
                           spoken: VoiceCommandHelp.spoken(for: context))

        case .stopListening:
            UserDefaults.standard.set(false, forKey: Self.enabledKey)
            return .said(command.confirmation)
        }
    }

    /// Shows what happened, and says it unless that would talk over a reading
    /// or you've turned spoken confirmations off.
    private func present(_ outcome: Outcome) {
        caption = outcome.text
        captionGeneration += 1
        let mine = captionGeneration
        Task { @MainActor [weak self] in
            try? await Task.sleep(nanoseconds: 8_000_000_000)
            guard let self, mine == self.captionGeneration else { return }
            self.caption = ""
        }

        guard let spoken = outcome.spoken else { return }
        let readout = ArticleReadoutController.shared
        if outcome.isAnswer {
            // "Keep going" carries on with what was being read.
            if readout.isActive { readout.pause() }
            VoiceSpeaker.shared.say(spoken)
            return
        }
        guard Self.speaksAloud, !readout.isActive else { return }
        VoiceSpeaker.shared.say(spoken)
    }

    private static var speaksAloud: Bool {
        let defaults = UserDefaults.standard
        return defaults.object(forKey: speakKey) == nil ? true : defaults.bool(forKey: speakKey)
    }
}
