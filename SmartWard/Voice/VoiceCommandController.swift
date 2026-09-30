import Foundation
import SwiftUI
import SwiftData
import AVFoundation
import UIKit
import Observation
import KnowledgeStore
import Pipeline

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

        static func said(_ text: String) -> Outcome { Outcome(text: text, spoken: text) }
        static func silent(_ text: String) -> Outcome { Outcome(text: text, spoken: nil) }
    }

    @ObservationIgnored private let recognizer = SpeechCommandRecognizer()
    @ObservationIgnored private var wanted = false
    @ObservationIgnored private var startTask: Task<Void, Never>?
    @ObservationIgnored private var armedUntil = Date.distantPast
    @ObservationIgnored private var armedGeneration = 0
    @ObservationIgnored private var captionGeneration = 0
    @ObservationIgnored private var interruptionObserver: NSObjectProtocol?

    /// How long after the wake word the next phrase needs no prefix.
    private static let armedWindow: TimeInterval = 6

    private init() {
        recognizer.onPartial = { [weak self] text in self?.heard = text }
        recognizer.onPhrase = { [weak self] phrase in self?.handle(phrase) }
        recognizer.onFailure = { [weak self] failure in
            self?.phase = .unavailable(failure.localizedDescription)
            self?.heard = ""
        }
        interruptionObserver = NotificationCenter.default.addObserver(
            forName: AVAudioSession.interruptionNotification, object: nil, queue: .main
        ) { [weak self] note in
            let type = (note.userInfo?[AVAudioSessionInterruptionTypeKey] as? UInt)
                .flatMap { AVAudioSession.InterruptionType(rawValue: $0) }
            Task { @MainActor in self?.interruption(type) }
        }
    }

    // MARK: Listening

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
            do {
                try await recognizer.start()
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
            run(command, context: context)
        case .unrecognized(let words):
            disarm()
            UINotificationFeedbackGenerator().notificationOccurred(.warning)
            present(.said("I can't do \u{201C}\(words)\u{201D}. Say SmartWard, what can I say?"))
        }
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
                            isArmed: Date() < armedUntil,
                            spokenNow: readout.currentText,
                            items: navigation.listedArticles.map(\.title),
                            projects: projectNames())
    }

    // MARK: Doing it

    private var library: ModelContext? {
        guard case .success(let container) = AppStore.container else { return nil }
        return container.mainContext
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
        guard let library else { return .said("I couldn't open your library.") }
        let unread = (try? library.fetch(FetchDescriptor<Article>(predicate: #Predicate { $0.isRead == false }))) ?? []
        let queue = ArticleBriefing.queue(from: unread)
        guard !queue.isEmpty, ArticleReadoutController.shared.startBriefing(queue) else {
            return .said("You're all caught up. There's nothing unread.")
        }
        return .silent(VoiceCommand.startBriefing.confirmation)
    }

    /// What Siri's "Brief me" does once the app is open in front of you.
    func beginRequestedBriefing() {
        present(startBriefing())
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
            guard navigation.tab == .reading else { return .said("Open Reading first, then say a number.") }
            guard navigation.listedArticles.indices.contains(number - 1) else {
                return .said("There's no number \(number) in this list.")
            }
            navigation.openArticle(navigation.listedArticles[number - 1])
            return .said(command.confirmation)

        case .openLastItem:
            guard navigation.tab == .reading, let last = navigation.listedArticles.last else {
                return .said("There's no list to pick from. Open Reading first.")
            }
            navigation.openArticle(last)
            return .said(command.confirmation)

        case .openMatching(let words):
            let titles = navigation.listedArticles.map(\.title)
            guard let index = VoiceItemMatcher.best(words, in: titles) else {
                return .said("I couldn't find an article about \(words).")
            }
            navigation.openArticle(navigation.listedArticles[index])
            return .said("Opening \(titles[index])")

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

        guard let spoken = outcome.spoken, Self.speaksAloud,
              !ArticleReadoutController.shared.isActive else { return }
        VoiceSpeaker.shared.say(spoken)
    }

    private static var speaksAloud: Bool {
        let defaults = UserDefaults.standard
        return defaults.object(forKey: speakKey) == nil ? true : defaults.bool(forKey: speakKey)
    }
}
