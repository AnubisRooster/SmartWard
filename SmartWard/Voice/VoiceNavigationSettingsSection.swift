import SwiftUI

/// Settings → Voice navigation: the switch, and whether it talks back.
struct VoiceNavigationSettingsSection: View {
    @AppStorage(VoiceCommandController.enabledKey) private var enabled = false
    @AppStorage(VoiceCommandController.speakKey) private var speak = true
    @AppStorage(VoiceCommandController.naturalKey) private var natural = true

    private var naturalNote: String {
        FoundationModelsVoiceRephraser.isAvailable
            ? " With natural phrasing on, wording SmartWard doesn't know is worked out by Apple Intelligence on this device, and it can only choose something it already does."
            : " Natural phrasing (working out your own wording) needs Apple Intelligence, which isn't available on this device."
    }

    var body: some View {
        Section {
            Toggle("Voice navigation", isOn: $enabled)
            Toggle("Speak what I did", isOn: $speak)
                .disabled(!enabled)
            Toggle("Understand natural phrasing", isOn: $natural)
                .disabled(!enabled || !FoundationModelsVoiceRephraser.isAvailable)
        } header: {
            Text("Voice navigation")
        } footer: {
            Text("Say \u{201C}SmartWard\u{201D} and then what you want: \u{201C}SmartWard, open Reading\u{201D}, \u{201C}SmartWard, read this article\u{201D}, \u{201C}SmartWard, what can I say?\u{201D}. While an article is being read, \u{201C}pause\u{201D} and \u{201C}keep going\u{201D} work on their own. It listens only while SmartWard is open and unlocked, never in the background, and turns your speech into words on this device: nothing you say goes to a server. Headphones work best, so it doesn't hear its own voice.\(naturalNote)")
        }
    }
}
