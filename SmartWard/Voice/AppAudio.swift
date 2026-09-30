import AVFoundation
import Observation

/// The app's one audio session, shared by everything that speaks or listens
/// (the read-aloud voice, spoken confirmations, the command listener, and
/// voice chat), so they don't each reconfigure it out from under the others.
@MainActor
@Observable
final class AppAudio {
    static let shared = AppAudio()

    /// The command listener has the microphone.
    var isListening = false
    /// A voice chat (the mic in a conversation) has the microphone; the
    /// command listener waits for it.
    var voiceChatActive = false

    /// Gets the session ready. While the command listener is on it must be
    /// able to record as well as play; otherwise it only plays. Speaking ducks
    /// other apps' audio; listening alone leaves it be.
    func configure(speaking: Bool) {
        let session = AVAudioSession.sharedInstance()
        do {
            if isListening {
                var options: AVAudioSession.CategoryOptions = [.defaultToSpeaker, .allowBluetoothHFP]
                options.insert(speaking ? .duckOthers : .mixWithOthers)
                try session.setCategory(.playAndRecord, mode: .default, options: options)
            } else {
                try session.setCategory(.playback, mode: .spokenAudio, options: [.duckOthers])
            }
            try session.setActive(true)
        } catch {
            // Not fatal: the synthesizer may still speak in the default session.
        }
    }

    /// Called when something that was speaking is done. Gives the session
    /// back, unless something else is still using it; while listening, only
    /// stops ducking other apps' audio.
    func releaseIfIdle() {
        if voiceChatActive { return }
        if isListening {
            configure(speaking: false)
        } else if ArticleReadoutController.shared.isActive {
            configure(speaking: true)
        } else {
            try? AVAudioSession.sharedInstance().setActive(false, options: .notifyOthersOnDeactivation)
        }
    }
}
