import SwiftUI

/// The voice control above the tab bar: what it's hearing, what it just did,
/// and a mic button to turn voice navigation off or on.
struct VoiceCommandBar: View {
    @State private var voice = VoiceCommandController.shared
    @State private var readout = ArticleReadoutController.shared
    @AppStorage(VoiceCommandController.enabledKey) private var enabled = false

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(voice.isArmed ? Color.accentColor : Color.secondary)
                .symbolEffect(.pulse, isActive: voice.isArmed || voice.phase == .starting)
                .accessibilityHidden(true)
            Text(line)
                .font(.subheadline)
                .lineLimit(2)
                .frame(maxWidth: .infinity, alignment: .leading)
            Button {
                enabled.toggle()
            } label: {
                Image(systemName: enabled ? "mic.slash" : "mic")
            }
            .accessibilityLabel(enabled ? "Turn voice navigation off" : "Turn voice navigation on")
        }
        .padding(.horizontal)
    }

    private var icon: String {
        guard enabled else { return "mic.slash" }
        switch voice.phase {
        case .listening: return "waveform"
        case .unavailable: return "exclamationmark.triangle"
        case .off, .starting: return "waveform.slash"
        }
    }

    private var line: String {
        guard enabled else { return "Voice navigation is off" }
        switch voice.phase {
        case .off: return "Voice navigation is paused"
        case .starting: return "Starting…"
        case .unavailable(let message): return message
        case .listening:
            if !voice.heard.isEmpty { return "\u{201C}\(voice.heard)\u{201D}" }
            if !voice.caption.isEmpty { return voice.caption }
            if readout.isBriefing, let place = readout.playback.groupPosition {
                let title = readout.briefing?.itemTitle ?? ""
                return "\(readout.isPaused ? "Paused" : "Briefing") \(place.number) of \(place.count)"
                    + (title.isEmpty ? "" : " · \(title)")
            }
            if voice.isArmed { return "Listening…" }
            return VoiceCommandController.isHandsFree ? "Listening: just say what you want" : "Say \u{201C}SmartWard, …\u{201D}"
        }
    }
}
