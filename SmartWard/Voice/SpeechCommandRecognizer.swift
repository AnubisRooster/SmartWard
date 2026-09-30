import Foundation
import Speech
import AVFoundation

/// Listens to the microphone continuously and hands over each phrase.
///
/// - On-device recognition only: what you say to control the app never goes
///   to a server. Where the device can't do that, it says so rather than fall back.
/// - A phrase ends after a short pause (`phraseSilence`), much shorter than a
///   chat turn: commands are a few words.
/// - The audio engine keeps running; only the recognition request is replaced
///   after each phrase, so nothing is missed between them, and the recognizer's
///   own limits (about a minute per request) don't matter.
///
/// Modeled on `VoiceConversationController` in OnDeviceKit, which has run on
/// devices; the differences are the phrase length, the continuous restart and
/// the on-device requirement.
@MainActor
final class SpeechCommandRecognizer {
    enum Failure: Error, LocalizedError {
        case permissionDenied, unavailable, onDeviceUnsupported, micNotReady, notResponding

        var errorDescription: String? {
            switch self {
            case .permissionDenied: return "Allow the microphone and speech recognition for SmartWard in Settings."
            case .unavailable: return "Speech recognition isn't available right now."
            case .onDeviceUnsupported:
                return "Voice navigation needs on-device speech recognition, which isn't available for English on this device."
            case .micNotReady: return "The microphone couldn't start. Make sure no other app is using it."
            case .notResponding: return "Speech recognition stopped responding."
            }
        }
    }

    /// The words heard so far in the phrase being spoken.
    var onPartial: ((String) -> Void)?
    /// A finished phrase.
    var onPhrase: ((String) -> Void)?
    /// It gave up (after repeated failures); the reason.
    var onFailure: ((Failure) -> Void)?

    /// A pause this long ends a phrase.
    static let phraseSilence: TimeInterval = 0.9
    /// Commands are short; a phrase running longer than this is something else (the app's own voice, say).
    static let maxWords = 24
    static let maxFailures = 3
    /// Words the recognizer should expect, so "SmartWard" isn't heard as "smart word".
    static let vocabulary = [
        "SmartWard", "SmartWard open Reading", "SmartWard go back", "SmartWard read this article",
        "SmartWard read the summary", "SmartWard what can I say", "SmartWard stop listening",
        "SmartWard brief me", "SmartWard read today's digest", "keep going", "stop reading", "next article",
        "tell me more", "dismiss",
    ]

    private(set) var isRunning = false

    private let recognizer = SFSpeechRecognizer(locale: Locale(identifier: "en-US"))
    /// Recreated on every start, after the audio session is active: reusing an
    /// engine can cache a 0 Hz input format.
    private var engine = AVAudioEngine()
    private let requestBox = RequestBox()
    private var task: SFSpeechRecognitionTask?
    private var silenceTimer: Timer?
    private var generation = 0
    private var latest = ""
    private var failures = 0
    private var startedAt = Date.distantPast
    private var configurationObserver: NSObjectProtocol?

    // MARK: Start and stop

    func start() async throws {
        guard !isRunning else { return }
        guard let recognizer, recognizer.isAvailable else { throw Failure.unavailable }
        guard recognizer.supportsOnDeviceRecognition else { throw Failure.onDeviceUnsupported }
        guard await Self.authorize() else { throw Failure.permissionDenied }
        guard !isRunning else { return }

        try beginEngine()
        isRunning = true
        failures = 0
        observeConfigurationChanges()
        beginTask()
    }

    func stop() {
        let wasListening = AppAudio.shared.isListening
        isRunning = false
        silenceTimer?.invalidate()
        silenceTimer = nil
        generation += 1
        task?.cancel()
        task = nil
        requestBox.set(nil)
        latest = ""
        endEngine()
        if let configurationObserver { NotificationCenter.default.removeObserver(configurationObserver) }
        configurationObserver = nil
        AppAudio.shared.isListening = false
        // Only give the session back if this was what had it.
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

    // MARK: Audio

    private func beginEngine() throws {
        AppAudio.shared.isListening = true
        // A restart mid-reading keeps the session set up for speaking.
        AppAudio.shared.configure(speaking: ArticleReadoutController.shared.isActive || VoiceSpeaker.shared.isBusy)

        engine = AVAudioEngine()
        let input = engine.inputNode
        let format = input.inputFormat(forBus: 0)
        guard format.sampleRate > 0, format.channelCount > 0 else {
            AppAudio.shared.isListening = false
            throw Failure.micNotReady
        }
        input.installTap(onBus: 0, bufferSize: 1024, format: format, block: Self.tapBlock(for: requestBox))
        engine.prepare()
        do {
            try engine.start()
        } catch {
            input.removeTap(onBus: 0)
            AppAudio.shared.isListening = false
            throw Failure.micNotReady
        }
        startedAt = Date()
    }

    /// Built outside the main actor: it runs on the audio thread.
    private nonisolated static func tapBlock(for box: RequestBox) -> AVAudioNodeTapBlock {
        { buffer, _ in
            // Empty buffers arrive while the pipeline warms up; the recognizer doesn't want them.
            guard buffer.frameLength > 0 else { return }
            box.append(buffer)
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
        guard isRunning, Date().timeIntervalSince(startedAt) > 1 else { return }
        endEngine()
        do {
            try beginEngine()
        } catch {
            fail(.micNotReady)
        }
    }

    // MARK: Recognition

    private func beginTask() {
        guard isRunning, let recognizer else { return }
        let request = SFSpeechAudioBufferRecognitionRequest()
        request.shouldReportPartialResults = true
        request.requiresOnDeviceRecognition = true
        request.contextualStrings = Self.vocabulary
        requestBox.set(request)
        latest = ""

        generation += 1
        let mine = generation
        task = recognizer.recognitionTask(with: request) { [weak self] result, error in
            let text = result?.bestTranscription.formattedString
            let isFinal = result?.isFinal ?? false
            let failure = error as NSError?
            Task { @MainActor in
                // Ignore callbacks from a request already replaced.
                guard let self, mine == self.generation else { return }
                self.handle(text: text, isFinal: isFinal, error: failure)
            }
        }
    }

    private func handle(text: String?, isFinal: Bool, error: NSError?) {
        guard isRunning else { return }
        if let text, !text.isEmpty {
            failures = 0
            if text != latest {
                latest = text
                onPartial?(text)
                resetSilenceTimer()
                if text.split(separator: " ").count > Self.maxWords {
                    endPhrase()
                    return
                }
            }
        }
        if isFinal {
            endPhrase()
        } else if let error {
            // "No speech detected" is just silence, not a failure.
            let silence = error.domain == "kAFAssistantErrorDomain" && error.code == 1110
            endPhrase(restartDelay: silence ? 0.3 : 0.6, countsAsFailure: !silence && latest.isEmpty)
        }
    }

    private func resetSilenceTimer() {
        silenceTimer?.invalidate()
        silenceTimer = Timer.scheduledTimer(withTimeInterval: Self.phraseSilence, repeats: false) { [weak self] _ in
            Task { @MainActor in self?.endPhrase() }
        }
    }

    /// Delivers what was said and starts listening for the next phrase.
    private func endPhrase(restartDelay: TimeInterval = 0.05, countsAsFailure: Bool = false) {
        silenceTimer?.invalidate()
        silenceTimer = nil
        let phrase = latest.trimmingCharacters(in: .whitespacesAndNewlines)
        latest = ""
        requestBox.set(nil)
        task?.cancel()
        task = nil
        generation += 1
        if !phrase.isEmpty { onPhrase?(phrase) }

        if countsAsFailure {
            failures += 1
            if failures > Self.maxFailures {
                fail(.notResponding)
                return
            }
        }
        Task { @MainActor [weak self] in
            try? await Task.sleep(nanoseconds: UInt64(restartDelay * 1_000_000_000))
            guard let self, self.isRunning else { return }
            self.beginTask()
        }
    }

    private func fail(_ failure: Failure) {
        stop()
        onFailure?(failure)
    }
}

/// Where the audio tap hands its buffers, which arrive on the audio thread,
/// to whichever recognition request is current.
private final class RequestBox: @unchecked Sendable {
    private let lock = NSLock()
    private var request: SFSpeechAudioBufferRecognitionRequest?

    func set(_ request: SFSpeechAudioBufferRecognitionRequest?) {
        lock.lock()
        self.request?.endAudio()
        self.request = request
        lock.unlock()
    }

    func append(_ buffer: AVAudioPCMBuffer) {
        lock.lock()
        request?.append(buffer)
        lock.unlock()
    }
}
