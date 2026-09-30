import Foundation
import AVFoundation
import SwiftUI
import VoiceLoopKit
import Pipeline

/// The knobs `VoiceConversationController` needs, resolved from
/// `UserDefaults` — the controller itself has no storage opinions.
enum VoiceSettings {
    static let silenceIntervalKey = "voice.silenceInterval"
    static let ttsRateKey = "voice.ttsRate"
    static let voiceIDKey = "voice.voiceID"

    /// VoiceLoopKit's own defaults, so Settings and the controller agree.
    static let defaults = VoiceLoopConfig()

    static var current: VoiceLoopConfig {
        let store = UserDefaults.standard
        let silence = store.object(forKey: silenceIntervalKey) == nil
            ? defaults.silenceInterval : store.double(forKey: silenceIntervalKey)
        let rate = store.object(forKey: ttsRateKey) == nil
            ? Double(defaults.ttsRate) : store.double(forKey: ttsRateKey)
        return VoiceLoopConfig(silenceInterval: silence, ttsRate: Float(rate), ttsPitch: defaults.ttsPitch,
                               voiceID: store.string(forKey: voiceIDKey) ?? defaults.voiceID)
    }

    /// The chosen voice, or the best English one installed.
    @MainActor
    static func voice(for identifier: String) -> AVSpeechSynthesisVoice? {
        guard !identifier.isEmpty else { return SpeechService.bestAvailableVoice() }
        return AVSpeechSynthesisVoice(identifier: identifier) ?? SpeechService.bestAvailableVoice()
    }

    static func englishVoices() -> [AVSpeechSynthesisVoice] {
        AVSpeechSynthesisVoice.speechVoices()
            .filter { $0.language.hasPrefix("en") }
            .sorted { $0.name < $1.name }
    }
}

/// Settings → Voice conversation: speaking voice/rate and how long a pause
/// ends your turn. Voice mode needs "Approve fetches and new sources
/// automatically" (`ActionApprovalSettingsSection`, just above this one):
/// a hands-free turn can't stop for an approval card.
struct VoiceSettingsSection: View {
    @AppStorage(VoiceSettings.silenceIntervalKey) private var silenceInterval = VoiceSettings.defaults.silenceInterval
    @AppStorage(VoiceSettings.ttsRateKey) private var ttsRate = Double(VoiceSettings.defaults.ttsRate)
    @AppStorage(VoiceSettings.voiceIDKey) private var voiceID = VoiceSettings.defaults.voiceID
    @AppStorage(ActionTools.autoApproveKey) private var autoApprove = false
    /// Loaded once: enumerating installed voices on every slider tick stutters.
    @State private var voices: [AVSpeechSynthesisVoice] = []

    var body: some View {
        Section {
            Picker("Voice", selection: $voiceID) {
                Text("Automatic").tag("")
                ForEach(voices, id: \.identifier) { voice in
                    Text(voice.name).tag(voice.identifier)
                }
            }
            HStack {
                Text("Speaking rate")
                Slider(value: $ttsRate, in: 0.3...0.7)
            }
            Picker("Pause before sending", selection: $silenceInterval) {
                Text("3 seconds").tag(3.0)
                Text("5 seconds").tag(5.0)
                Text("8 seconds").tag(8.0)
                Text("12 seconds").tag(12.0)
            }
        } header: {
            Text("Voice conversation")
        } footer: {
            Text("Used when you tap the mic in a chat to talk instead of type. Speech is transcribed on-device where possible, and always in off-the-record chats. "
                 + (autoApprove
                    ? "Saving decisions or open items is left for typed chats."
                    : "Needs \"Approve fetches and new sources automatically\" turned on above: a hands-free turn can't stop for an approval card."))
        }
        .task { if voices.isEmpty { voices = VoiceSettings.englishVoices() } }
    }
}
