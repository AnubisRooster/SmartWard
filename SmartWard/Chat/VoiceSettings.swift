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

    static var current: VoiceLoopConfig {
        let defaults = UserDefaults.standard
        let silence = defaults.object(forKey: silenceIntervalKey) == nil
            ? 5.0 : defaults.double(forKey: silenceIntervalKey)
        let rate = defaults.object(forKey: ttsRateKey) == nil
            ? 0.5 : defaults.double(forKey: ttsRateKey)
        let voiceID = defaults.string(forKey: voiceIDKey) ?? ""
        return VoiceLoopConfig(silenceInterval: silence, ttsRate: Float(rate), voiceID: voiceID)
    }
}

/// Settings → Voice conversation: speaking voice/rate and how long a pause
/// ends your turn. Requires "Approve fetches and new sources automatically"
/// (`ActionApprovalSettingsSection`, placed just above this one) — a
/// hands-free turn that pauses on an approval card no one can tap has no way
/// forward, so voice mode refuses to start until that's on.
struct VoiceSettingsSection: View {
    @AppStorage(VoiceSettings.silenceIntervalKey) private var silenceInterval = 5.0
    @AppStorage(VoiceSettings.ttsRateKey) private var ttsRate = 0.5
    @AppStorage(VoiceSettings.voiceIDKey) private var voiceID = ""
    @AppStorage(ActionTools.autoApproveKey) private var autoApprove = false

    private var voices: [AVSpeechSynthesisVoice] {
        AVSpeechSynthesisVoice.speechVoices()
            .filter { $0.language.hasPrefix("en") }
            .sorted { $0.name < $1.name }
    }

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
            Text(autoApprove
                 ? "Used when you tap the mic in a chat to talk instead of type."
                 : "Used when you tap the mic in a chat to talk instead of type. Needs \"Approve fetches and new sources automatically\" turned on above — otherwise a hands-free turn could stall on an approval card with no way to tap it.")
        }
    }
}
