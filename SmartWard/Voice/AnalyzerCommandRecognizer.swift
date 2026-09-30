import Foundation
import Speech
import AVFoundation
import Pipeline

/// The newer on-device engine (SpeechAnalyzer with SpeechTranscriber, iOS 26)
/// listening for commands. Same job and same limits as `SpeechCommandRecognizer`:
///
/// - Speech is turned into words on the device. (The first time, the system
///   downloads the language's speech model, which is Apple's, from Apple.)
/// - A phrase ends after a short pause (`SpeechCommandRecognizer.phraseSilence`,
///   longer for a question to the strategist), decided here, not by the engine.
/// - One analyzer session runs continuously, so nothing is missed between
///   phrases. Results carry the audio time they cover, so after each phrase
///   everything up to that moment is ignored (`cutoff`), including late
///   revisions of words already delivered.
///
/// Opt-in (Settings → Voice navigation → Speech engine): it hasn't had the
/// hours on devices the standard engine has, and it falls back to it when it
/// can't start.
@MainActor
final class AnalyzerCommandRecognizer {
    var onPartial: ((String) -> Void)?
    var onPhrase: ((String) -> Void)?
    var onFailure: ((SpeechCommandRecognizer.Failure) -> Void)?

    private(set) var isRunning = false

    /// Recreated on every start, after the audio session is active.
    private var engine = AVAudioEngine()
    private var analyzer: SpeechAnalyzer?
    private var feed: AnalyzerFeed?
    private var resultsTask: Task<Void, Never>?
    private var silenceTimer: Timer?
    private var configurationObserver: NSObjectProtocol?
    /// Bumped whenever a session ends, so a late result from the old one is ignored.
    private var generation = 0

    private var committed = ""
    private var volatile = ""
    private var latest = ""
    /// Audio time (seconds) up to which results have been delivered or dropped.
    private var cutoff = -1.0
    private var lastRangeEnd = -1.0
    private var failures = 0
    private var startedAt = Date.distantPast

    // MARK: Start and stop

    func start() async throws {
        guard !isRunning else { return }
        guard SpeechTranscriber.isAvailable else { throw SpeechCommandRecognizer.Failure.engineUnavailable }
        guard await Self.authorize() else { throw SpeechCommandRecognizer.Failure.permissionDenied }
        guard !isRunning else { return }

        let session = try await makeSession()
        try beginEngine(feeding: session.feed)
        isRunning = true
        failures = 0
        observeConfigurationChanges()
        run(session)
    }

    func stop() {
        let wasListening = AppAudio.shared.isListening
        isRunning = false
        endSession()
        endEngine()
        if let configurationObserver { NotificationCenter.default.removeObserver(configurationObserver) }
        configurationObserver = nil
        AppAudio.shared.isListening = false
        if wasListening { AppAudio.shared.releaseIfIdle() }
    }

    private static func authorize() async -> Bool {
        let speechAllowed = await withCheckedContinuation { (continuation: CheckedContinuation<Bool, Never>) in
            SFSpeechRecognizer.requestAuthorization { continuation.resume(returning: $0 == .authorized) }
        }
        guard speechAllowed else { return false }
        return await withCheckedContinuation { (continuation: CheckedContinuation<Bool, Never>) in
            AVAudioApplication.requestRecordPermission { continuation.resume(returning: $0) }
        }
    }

    // MARK: The analyzer session

    private struct Session {
        let analyzer: SpeechAnalyzer
        let transcriber: SpeechTranscriber
        let feed: AnalyzerFeed
        let stream: AsyncStream<AnalyzerInput>
    }

    /// Gets the speech model (downloading it the first time), and readies an
    /// analyzer whose input is converted to the format it wants.
    private func makeSession() async throws -> Session {
        guard let locale = await SpeechTranscriber.supportedLocale(equivalentTo: Locale(identifier: "en-US")) else {
            throw SpeechCommandRecognizer.Failure.engineUnavailable
        }
        // Fast, tentative results: phrases are a few words and the app should react at the pause.
        let transcriber = SpeechTranscriber(locale: locale, transcriptionOptions: [],
                                            reportingOptions: [.volatileResults, .fastResults],
                                            attributeOptions: [])
        if let request = try await AssetInventory.assetInstallationRequest(supporting: [transcriber]) {
            try await request.downloadAndInstall()
        }
        guard let format = await SpeechAnalyzer.bestAvailableAudioFormat(compatibleWith: [transcriber]) else {
            throw SpeechCommandRecognizer.Failure.engineUnavailable
        }

        let analyzer = SpeechAnalyzer(modules: [transcriber], options: nil)
        // So "SmartWard" isn't heard as "smart word".
        let context = AnalysisContext()
        context.contextualStrings[.general] = SpeechCommandRecognizer.vocabulary
        try await analyzer.setContext(context)
        try await analyzer.prepareToAnalyze(in: format)

        let (stream, continuation) = AsyncStream.makeStream(of: AnalyzerInput.self)
        return Session(analyzer: analyzer, transcriber: transcriber,
                       feed: AnalyzerFeed(format: format, continuation: continuation), stream: stream)
    }

    private func run(_ session: Session) {
        analyzer = session.analyzer
        feed = session.feed
        resetPhrase()
        cutoff = -1
        lastRangeEnd = -1
        generation += 1
        let mine = generation

        resultsTask = Task { @MainActor [weak self] in
            do {
                for try await result in session.transcriber.results {
                    let text = String(result.text.characters)
                    let end = result.range.end.seconds
                    guard let self, mine == self.generation else { return }
                    self.handle(text: text, isFinal: result.isFinal, rangeEnd: end.isFinite ? end : nil)
                }
            } catch {
                guard let self, mine == self.generation else { return }
                self.sessionFailed()
            }
        }
        Task { @MainActor [weak self] in
            do {
                try await session.analyzer.start(inputSequence: session.stream)
            } catch {
                guard let self, mine == self.generation else { return }
                self.sessionFailed()
            }
        }
    }

    private func endSession() {
        silenceTimer?.invalidate()
        silenceTimer = nil
        generation += 1
        resultsTask?.cancel()
        resultsTask = nil
        feed?.finish()
        feed = nil
        if let analyzer {
            Task { await analyzer.cancelAndFinishNow() }
        }
        analyzer = nil
        resetPhrase()
    }

    /// The analyzer stopped answering: start a fresh session, a few times, then give up.
    private func sessionFailed() {
        guard isRunning else { return }
        failures += 1
        endSession()
        if failures > SpeechCommandRecognizer.maxFailures {
            fail(.notResponding)
            return
        }
        Task { @MainActor [weak self] in
            try? await Task.sleep(nanoseconds: 600_000_000)
            guard let self, self.isRunning else { return }
            do {
                let session = try await self.makeSession()
                guard self.isRunning else { return }
                self.endEngine()
                try self.beginEngine(feeding: session.feed)
                self.run(session)
            } catch {
                self.sessionFailed()
            }
        }
    }

    // MARK: Audio

    private func beginEngine(feeding feed: AnalyzerFeed) throws {
        AppAudio.shared.isListening = true
        // A restart mid-reading keeps the session set up for speaking.
        AppAudio.shared.configure(speaking: ArticleReadoutController.shared.isActive || VoiceSpeaker.shared.isBusy)

        engine = AVAudioEngine()
        let input = engine.inputNode
        let format = input.inputFormat(forBus: 0)
        guard format.sampleRate > 0, format.channelCount > 0, feed.prepare(from: format) else {
            AppAudio.shared.isListening = false
            throw SpeechCommandRecognizer.Failure.micNotReady
        }
        input.installTap(onBus: 0, bufferSize: 1024, format: format, block: Self.tapBlock(for: feed))
        engine.prepare()
        do {
            try engine.start()
        } catch {
            input.removeTap(onBus: 0)
            AppAudio.shared.isListening = false
            throw SpeechCommandRecognizer.Failure.micNotReady
        }
        startedAt = Date()
    }

    /// Built outside the main actor: it runs on the audio thread.
    private nonisolated static func tapBlock(for feed: AnalyzerFeed) -> AVAudioNodeTapBlock {
        { buffer, _ in
            guard buffer.frameLength > 0 else { return }
            feed.append(buffer)
        }
    }

    private func endEngine() {
        if engine.isRunning { engine.stop() }
        engine.inputNode.removeTap(onBus: 0)
    }

    /// Headphones connecting or a route change stops the engine; start it again.
    private func observeConfigurationChanges() {
        configurationObserver = NotificationCenter.default.addObserver(
            forName: .AVAudioEngineConfigurationChange, object: nil, queue: .main
        ) { [weak self] _ in
            Task { @MainActor in self?.restartEngine() }
        }
    }

    private func restartEngine() {
        // Our own session changes right after starting also announce themselves.
        guard isRunning, let feed, Date().timeIntervalSince(startedAt) > 1 else { return }
        endEngine()
        do {
            try beginEngine(feeding: feed)
        } catch {
            fail(.micNotReady)
        }
    }

    // MARK: Results and phrases

    private func resetPhrase() {
        committed = ""
        volatile = ""
        latest = ""
    }

    private func handle(text: String, isFinal: Bool, rangeEnd: Double?) {
        guard isRunning else { return }
        if let rangeEnd {
            // Words for audio already delivered (a late revision) aren't a new phrase.
            if rangeEnd <= cutoff { return }
            lastRangeEnd = max(lastRangeEnd, rangeEnd)
        }
        failures = 0
        let piece = text.trimmingCharacters(in: .whitespacesAndNewlines)
        if isFinal {
            committed = Self.join(committed, piece)
            volatile = ""
        } else {
            volatile = piece
        }
        let heard = Self.join(committed, volatile)
        guard !heard.isEmpty, heard != latest else { return }
        latest = heard
        onPartial?(heard)
        resetSilenceTimer()
        let limit = VoiceCommandParser.isAsking(heard) ? SpeechCommandRecognizer.maxQuestionWords
                                                        : SpeechCommandRecognizer.maxWords
        if heard.split(separator: " ").count > limit { endPhrase() }
    }

    private static func join(_ first: String, _ second: String) -> String {
        [first, second].filter { !$0.isEmpty }.joined(separator: " ")
    }

    private func resetSilenceTimer() {
        silenceTimer?.invalidate()
        let pause = VoiceCommandParser.isAsking(latest) ? SpeechCommandRecognizer.questionSilence
                                                          : SpeechCommandRecognizer.phraseSilence
        silenceTimer = Timer.scheduledTimer(withTimeInterval: pause, repeats: false) { [weak self] _ in
            Task { @MainActor in self?.endPhrase() }
        }
    }

    /// Delivers what was said, and ignores everything up to now.
    private func endPhrase() {
        silenceTimer?.invalidate()
        silenceTimer = nil
        let phrase = latest.trimmingCharacters(in: .whitespacesAndNewlines)
        resetPhrase()
        cutoff = max(cutoff, lastRangeEnd)
        if !phrase.isEmpty { onPhrase?(phrase) }
    }

    private func fail(_ failure: SpeechCommandRecognizer.Failure) {
        stop()
        onFailure?(failure)
    }
}

extension AnalyzerCommandRecognizer: CommandRecognizing {}

/// Where the audio tap hands its buffers, which arrive on the audio thread:
/// converted to the analyzer's format and passed on as its input.
private final class AnalyzerFeed: @unchecked Sendable {
    private let lock = NSLock()
    private let format: AVAudioFormat
    private let continuation: AsyncStream<AnalyzerInput>.Continuation
    private var converter: AVAudioConverter?

    init(format: AVAudioFormat, continuation: AsyncStream<AnalyzerInput>.Continuation) {
        self.format = format
        self.continuation = continuation
    }

    /// Readies conversion from the microphone's format; false if there isn't one.
    func prepare(from input: AVAudioFormat) -> Bool {
        lock.lock()
        defer { lock.unlock() }
        converter = AVAudioConverter(from: input, to: format)
        return converter != nil
    }

    func append(_ buffer: AVAudioPCMBuffer) {
        lock.lock()
        defer { lock.unlock() }
        guard let converter else { return }
        let ratio = format.sampleRate / buffer.format.sampleRate
        let capacity = AVAudioFrameCount(Double(buffer.frameLength) * ratio) + 1_024
        guard let output = AVAudioPCMBuffer(pcmFormat: format, frameCapacity: capacity) else { return }
        var supplied = false
        var error: NSError?
        let status = converter.convert(to: output, error: &error) { _, inputStatus in
            if supplied {
                inputStatus.pointee = .noDataNow
                return nil
            }
            supplied = true
            inputStatus.pointee = .haveData
            return buffer
        }
        guard status != .error, error == nil, output.frameLength > 0 else { return }
        continuation.yield(AnalyzerInput(buffer: output))
    }

    func finish() {
        continuation.finish()
    }
}
