import SwiftUI

/// Settings → Voice navigation: the switch, and whether it talks back.
struct VoiceNavigationSettingsSection: View {
    @AppStorage(VoiceCommandController.enabledKey) private var enabled = false
    @AppStorage(VoiceCommandController.speakKey) private var speak = true
    @AppStorage(VoiceCommandController.handsFreeKey) private var handsFree = true
    @AppStorage(VoiceCommandController.naturalKey) private var natural = true
    @AppStorage(VoiceEngine.storageKey) private var engine = VoiceEngine.standard.rawValue

    private var understandingNote: String {
        switch (VoiceIntentResolver.providerAvailable, VoiceIntentResolver.onDeviceAvailable) {
        case (true, true):
            return " With smart understanding on, words SmartWard doesn't know (\u{201C}read the first article\u{201D}, \u{201C}skip this one and read the next\u{201D}) are worked out by your provider: what you said, the titles in the list on screen and your project names are sent to it, and it uses a little of your daily budget. If it can't answer, Apple Intelligence on this device does."
        case (true, false):
            return " With smart understanding on, words SmartWard doesn't know are worked out by your provider: what you said, the titles in the list on screen and your project names are sent to it, and it uses a little of your daily budget."
        case (false, true):
            return " With smart understanding on, words SmartWard doesn't know are worked out by Apple Intelligence on this device. Add an API key to have your provider do it, which understands more."
        case (false, false):
            return " Smart understanding needs an API key for your provider, or Apple Intelligence."
        }
    }

    var body: some View {
        Section {
            Toggle("Voice navigation", isOn: $enabled)
            Toggle("Hands-free (no \u{201C}SmartWard\u{201D} needed)", isOn: $handsFree)
                .disabled(!enabled)
            Toggle("Smart understanding", isOn: $natural)
                .disabled(!enabled)
            Toggle("Speak what I did", isOn: $speak)
                .disabled(!enabled)
            Picker("Speech engine", selection: $engine) {
                Text("Standard").tag(VoiceEngine.standard.rawValue)
                Text("Newer (beta)").tag(VoiceEngine.newer.rawValue)
            }
            .disabled(!enabled)
            .onChange(of: engine) { _, _ in VoiceCommandController.shared.engineChanged() }
        } header: {
            Text("Voice navigation")
        } footer: {
            Text("Hands-free, just say what you want while SmartWard is open: \u{201C}read the first article\u{201D}, \u{201C}show starred\u{201D}, \u{201C}brief me\u{201D}. While something is being read aloud, only \u{201C}pause\u{201D}, \u{201C}next\u{201D} and the other reading controls work on their own (the app's voice is in the room); start with \u{201C}SmartWard\u{201D} for anything else. Without hands-free, start every request with \u{201C}SmartWard\u{201D}. It listens only while SmartWard is open and unlocked, never in the background, and turns your speech into words on this device. Headphones work best, so it doesn't hear its own voice.\(understandingNote) The newer speech engine (iOS 26) may recognize names and technical words better; it hasn't been tested as long, iOS downloads Apple's English speech model the first time, and if it can't start, SmartWard uses the standard engine.")
        }
    }
}

/// Settings → Briefings: whether Siri may start one with the phone locked.
struct BriefingSettingsSection: View {
    @AppStorage(BriefingLauncher.lockScreenKey) private var lockScreen = true

    var body: some View {
        Section {
            Toggle("From the lock screen", isOn: $lockScreen)
        } header: {
            Text("Briefings")
        } footer: {
            Text("\u{201C}Hey Siri, brief me with SmartWard\u{201D} reads your top unread articles aloud, with the phone locked or in the car (CarPlay's Siri included), and keeps going in the background; next, previous and pause work from Siri, headphones, the steering wheel and the lock screen. Anyone who can talk to your locked phone could start one and hear your article titles and summaries, so turn this off if that matters. With SmartWard's own lock on, a briefing from the lock screen only works while SmartWard is unlocked, and stops when its lock-after time is up.")
        }
    }
}
