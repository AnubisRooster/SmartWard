import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            Tab("Today", systemImage: "sun.max") {
                ComingSoonView(title: "Today",
                               systemImage: "sun.max",
                               message: "Your digest of new research, clustered by theme, lands here once sources are connected.")
            }
            Tab("Chat", systemImage: "bubble.left.and.bubble.right") {
                ComingSoonView(title: "Chat",
                               systemImage: "bubble.left.and.bubble.right",
                               message: "Brainstorm with your strategist. Add an API key in Settings to get ready.")
            }
            Tab("Projects", systemImage: "folder") {
                ProjectsView()
            }
            Tab("Settings", systemImage: "gearshape") {
                SettingsView()
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
