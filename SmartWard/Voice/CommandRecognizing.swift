import Foundation

/// What voice navigation needs from a speech recognizer, so the standard
/// engine (`SpeechCommandRecognizer`, SFSpeechRecognizer) and the newer one
/// (`AnalyzerCommandRecognizer`, SpeechAnalyzer) are interchangeable.
@MainActor
protocol CommandRecognizing: AnyObject {
    /// The words heard so far in the phrase being spoken.
    var onPartial: ((String) -> Void)? { get set }
    /// A finished phrase.
    var onPhrase: ((String) -> Void)? { get set }
    /// It gave up (after repeated failures); the reason.
    var onFailure: ((SpeechCommandRecognizer.Failure) -> Void)? { get set }
    var isRunning: Bool { get }

    func start() async throws
    func stop()
}

extension SpeechCommandRecognizer: CommandRecognizing {}

/// Which speech engine listens for commands (Settings → Voice navigation).
enum VoiceEngine: String, CaseIterable, Identifiable {
    /// SFSpeechRecognizer, on-device only. What has run on devices so far.
    case standard
    /// SpeechAnalyzer (iOS 26). Falls back to standard where it can't run.
    case newer

    var id: String { rawValue }
    static let storageKey = "voice.navigation.engine"

    static var current: VoiceEngine {
        VoiceEngine(rawValue: UserDefaults.standard.string(forKey: storageKey) ?? "") ?? .standard
    }
}
