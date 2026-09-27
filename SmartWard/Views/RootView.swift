import SwiftUI

struct RootView: View {
    @AppStorage("onboarding.completed") private var onboardingCompleted = false

    var body: some View {
        TabView {
            Tab("Today", systemImage: "sun.max") {
                ComingSoonView(title: "Today",
                               systemImage: "sun.max",
                               message: "Your digest of new research, clustered by theme, lands here once sources are connected.")
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
