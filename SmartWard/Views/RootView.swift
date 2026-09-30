import SwiftUI

struct RootView: View {
    @AppStorage("onboarding.completed") private var onboardingCompleted = false
    @Environment(\.scenePhase) private var scenePhase
    @Environment(\.modelContext) private var context
    @State private var lock = AppLockController.shared
    @State private var navigation = AppNavigation.shared
    @State private var audio = AppAudio.shared
    @AppStorage(VoiceCommandController.enabledKey) private var voiceEnabled = false

    /// The tab bar, with the voice control above it (shown while voice
    /// navigation is on).
    @ViewBuilder
    private var tabs: some View {
        if #available(iOS 26.1, *) {
            tabView.tabViewBottomAccessory(isEnabled: voiceEnabled) { VoiceCommandBar() }
        } else {
            tabView.tabViewBottomAccessory { VoiceCommandBar() }
        }
    }

    private var tabView: some View {
        // Five tabs fit an iPhone tab bar without a "More" tab; Settings is
        // behind the gear on Today.
        TabView(selection: $navigation.tab) {
            Tab("Today", systemImage: "sun.max", value: AppTab.today) {
                TodayView()
            }
            Tab("Reading", systemImage: "newspaper", value: AppTab.reading) {
                ReadingView()
            }
            Tab("Graph", systemImage: "point.3.connected.trianglepath.dotted", value: AppTab.graph) {
                GraphView()
            }
            Tab("Chat", systemImage: "bubble.left.and.bubble.right", value: AppTab.chat) {
                ChatListView()
            }
            Tab("Projects", systemImage: "folder", value: AppTab.projects) {
                ProjectsView()
            }
        }
    }

    /// Voice navigation listens only while it's switched on and the app is in
    /// front and unlocked, and no voice chat has the microphone.
    private var shouldListenByVoice: Bool {
        voiceEnabled && onboardingCompleted && scenePhase == .active
            && !lock.isLocked && !lock.isObscured && !audio.voiceChatActive
    }

    var body: some View {
        tabs
        .fullScreenCover(isPresented: Binding(get: { !onboardingCompleted },
                                              set: { onboardingCompleted = !$0 })) {
            OnboardingView()
        }
        // In its own window, so it covers sheets and full-screen covers too.
        .onChange(of: [lock.isLocked, lock.isObscured]) { _, state in
            LockWindow.update(isLocked: state[0], isObscured: state[1])
        }
        .onChange(of: shouldListenByVoice, initial: true) { _, listen in
            VoiceCommandController.shared.reconcile(shouldListen: listen)
        }
        // Reading aloud never outlives the app being unlocked; only a briefing may go on
        // with the app in the background (`BriefingLauncher`).
        .onChange(of: lock.isLocked) { _, locked in
            if locked { ArticleReadoutController.shared.stop() }
        }
        .onChange(of: scenePhase, initial: true) { _, phase in
            lock.handle(phase)
            let readout = ArticleReadoutController.shared
            if phase == .background, !readout.isBriefing { readout.stop() }
            // Back in front, past SmartWard's lock or not: the lock screen's time limit no longer applies.
            if phase == .active { readout.cancelScheduledStop() }
            // Right away, not on the next view update: the app-switcher
            // snapshot is taken as the app leaves the foreground.
            LockWindow.update(isLocked: lock.isLocked, isObscured: lock.isObscured)
            switch phase {
            case .active:
                Task { await ModelCatalogController.shared.load() }
                // Items shared while the app was closed.
                if ShareIntake.importPending(context: context) > 0 {
                    Task { await PipelineController.shared.process(context: context) }
                }
            case .background:
                BackgroundWork.schedule()
            default:
                break
            }
        }
    }
}

struct ComingSoonView: View {
    let title: String
    let systemImage: String
    let message: String

    var body: some View {
        NavigationStack {
            ContentUnavailableView(title, systemImage: systemImage, description: Text(message))
                .navigationTitle(title)
        }
    }
}
