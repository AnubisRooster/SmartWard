import SwiftUI

struct RootView: View {
    @AppStorage("onboarding.completed") private var onboardingCompleted = false
    @Environment(\.scenePhase) private var scenePhase
    @State private var lock = AppLockController.shared

    var body: some View {
        TabView {
            Tab("Today", systemImage: "sun.max") {
                ComingSoonView(title: "Today",
                               systemImage: "sun.max",
                               message: "Your digest of new research, clustered by theme, lands here once sources are connected.")
            }
            Tab("Reading", systemImage: "newspaper") {
                ReadingView()
            }
            Tab("Chat", systemImage: "bubble.left.and.bubble.right") {
                ChatListView()
            }
            Tab("Projects", systemImage: "folder") {
                ProjectsView()
            }
            Tab("Settings", systemImage: "gearshape") {
                SettingsView()
            }
        }
        .fullScreenCover(isPresented: Binding(get: { !onboardingCompleted },
                                              set: { onboardingCompleted = !$0 })) {
            OnboardingView()
        }
        .overlay {
            if lock.isLocked {
                LockScreen()
            } else if lock.isObscured {
                PrivacyCover()
            }
        }
        .onChange(of: scenePhase, initial: true) { _, phase in
            lock.handle(phase)
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
