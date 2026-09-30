import Foundation
import AVFoundation
import MediaPlayer
import Observation
import KnowledgeStore
import Pipeline
import VoiceLoopKit

/// Reads an article aloud, a segment at a time (`ArticleReadout`), with
/// pause, keep going, skip and back.
///
/// - The system voice only (`AVSpeechSynthesizer`): article text, private
///   items included, is never sent to a cloud voice (D5).
/// - It never outlives the app being in front and unlocked: the reader
///   stops it when the app leaves the foreground, locks, or the screen goes
///   away. A phone call or unplugged headphones pause it.
/// - Headphone and Control Center buttons work while it's reading: play,
///   pause, next and previous.
@MainActor
@Observable
final class ArticleReadoutController {
    static let shared = ArticleReadoutController()

    private(set) var playback = ReadoutPlayback()
    /// The article being read, while there is a read-aloud.
    private(set) var articleID: UUID?

    var isActive: Bool { playback.isActive }
    var isPaused: Bool { playback.status == .paused }
    /// Where on the reader screen the voice is, so the screen can follow.
    var currentAnchor: ReadoutSegment.Anchor? { playback.current?.anchor }
    /// The words being said right now, so the listener can tell its own voice from yours.
    var currentText: String { playback.current?.text ?? "" }

    @ObservationIgnored private let synthesizer = AVSpeechSynthesizer()
    @ObservationIgnored private let delegate = SpeechFinishDelegate()
    @ObservationIgnored private var currentUtterance: AVSpeechUtterance?
    @ObservationIgnored private var remoteTargets: [(command: MPRemoteCommand, token: Any)] = []
    @ObservationIgnored private var observers: [NSObjectProtocol] = []
    @ObservationIgnored private var nowPlayingTitle = ""
    @ObservationIgnored private var nowPlayingSource = ""

    private init() {
        synthesizer.delegate = delegate
        delegate.onFinish = { [weak self] id in
            Task { @MainActor in self?.utteranceFinished(id) }
        }
    }

    // MARK: Control

    /// Starts reading `article` from the top, replacing any read-aloud in progress.
    func start(_ article: Article, scope: ReadoutScope = .whole, sourceName: String? = nil) {
        stop()
        let segments = ArticleReadout.segments(for: article, scope: scope, sourceName: sourceName,
                                               clean: SpeechService.speakableText)
        guard !segments.isEmpty else { return }
        articleID = article.id
        nowPlayingTitle = article.title
        nowPlayingSource = sourceName ?? ""
        playback.start(segments)
        activateAudio()
        installRemoteControls()
        speakCurrent()
    }

    func pause() {
        guard playback.status == .playing else { return }
        playback.pause()
        synthesizer.pauseSpeaking(at: .word)
        updateNowPlaying()
    }

    /// "Keep going".
    func resume() {
        guard playback.status == .paused else { return }
        playback.resume()
        // A call or another app may have taken the audio session meanwhile.
        AppAudio.shared.configure(speaking: true)
        if synthesizer.isPaused {
            synthesizer.continueSpeaking()
        } else {
            speakCurrent()
        }
        updateNowPlaying()
    }

    func next() {
        playback.next()
        continueAfterSkip()
    }

    func previous() {
        playback.previous()
        continueAfterSkip()
    }

    func stop() {
        guard articleID != nil || playback.status != .idle else { return }
        playback.stop()
        articleID = nil
        currentUtterance = nil
        synthesizer.stopSpeaking(at: .immediate)
        tearDown()
    }

    // MARK: Speaking

    private func continueAfterSkip() {
        switch playback.status {
        case .playing: speakCurrent()
        case .finished: finish()
        default: break
        }
        updateNowPlaying()
    }

    private func speakCurrent() {
        guard playback.status == .playing, let segment = playback.current else { return }
        let config = VoiceSettings.current
        let utterance = AVSpeechUtterance(string: segment.text)
        utterance.rate = config.ttsRate
        utterance.pitchMultiplier = config.ttsPitch
        utterance.voice = VoiceSettings.voice(for: config.voiceID)
        // The old utterance stays referenced until this point, so the new
        // one can't share its identity with a callback still on its way.
        currentUtterance = utterance
        synthesizer.stopSpeaking(at: .immediate)
        synthesizer.speak(utterance)
    }

    private func utteranceFinished(_ id: ObjectIdentifier) {
        guard let current = currentUtterance, ObjectIdentifier(current) == id,
              playback.status == .playing else { return }
        playback.segmentFinished()
        if playback.status == .playing {
            speakCurrent()
        } else {
            finish()
        }
    }

    /// Read to the end.
    private func finish() {
        playback.stop()
        articleID = nil
        currentUtterance = nil
        tearDown()
    }

    // MARK: Audio session, interruptions, headphone buttons

    private func activateAudio() {
        AppAudio.shared.configure(speaking: true)
        let center = NotificationCenter.default
        observers.append(center.addObserver(forName: AVAudioSession.interruptionNotification, object: nil,
                                            queue: .main) { [weak self] note in
            let type = (note.userInfo?[AVAudioSessionInterruptionTypeKey] as? UInt)
                .flatMap { AVAudioSession.InterruptionType(rawValue: $0) }
            guard type == .began else { return }
            Task { @MainActor in self?.pause() }
        })
        observers.append(center.addObserver(forName: AVAudioSession.routeChangeNotification, object: nil,
                                            queue: .main) { [weak self] note in
            let reason = (note.userInfo?[AVAudioSessionRouteChangeReasonKey] as? UInt)
                .flatMap { AVAudioSession.RouteChangeReason(rawValue: $0) }
            // Headphones pulled out: don't start blaring from the speaker.
            guard reason == .oldDeviceUnavailable else { return }
            Task { @MainActor in self?.pause() }
        })
    }

    private func installRemoteControls() {
        let center = MPRemoteCommandCenter.shared()
        func add(_ command: MPRemoteCommand, _ action: @escaping @MainActor (ArticleReadoutController) -> Void) {
            command.isEnabled = true
            let token = command.addTarget { [weak self] _ in
                Task { @MainActor in
                    if let self { action(self) }
                }
                return .success
            }
            remoteTargets.append((command, token))
        }
        add(center.playCommand) { $0.resume() }
        add(center.pauseCommand) { $0.pause() }
        add(center.togglePlayPauseCommand) { $0.isPaused ? $0.resume() : $0.pause() }
        add(center.nextTrackCommand) { $0.next() }
        add(center.previousTrackCommand) { $0.previous() }
        updateNowPlaying()
    }

    private func updateNowPlaying() {
        guard articleID != nil else { return }
        MPNowPlayingInfoCenter.default().nowPlayingInfo = [
            MPMediaItemPropertyTitle: nowPlayingTitle,
            MPMediaItemPropertyArtist: nowPlayingSource.isEmpty ? "SmartWard" : nowPlayingSource,
            MPNowPlayingInfoPropertyPlaybackRate: isPaused ? 0.0 : 1.0,
        ]
    }

    /// Gives back the audio session and the headphone buttons, so other
    /// apps' audio isn't left ducked and the buttons go back to them.
    private func tearDown() {
        for target in remoteTargets { target.command.removeTarget(target.token) }
        remoteTargets = []
        for observer in observers { NotificationCenter.default.removeObserver(observer) }
        observers = []
        MPNowPlayingInfoCenter.default().nowPlayingInfo = nil
        AppAudio.shared.releaseIfIdle()
    }
}

/// `AVSpeechSynthesizer` keeps its delegate weakly and wants an `NSObject`.
final class SpeechFinishDelegate: NSObject, AVSpeechSynthesizerDelegate {
    var onFinish: ((ObjectIdentifier) -> Void)?

    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        onFinish?(ObjectIdentifier(utterance))
    }
}
