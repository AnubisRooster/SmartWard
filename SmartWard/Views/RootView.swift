import SwiftUI

struct RootView: View {
    @AppStorage("onboarding.completed") private var onboardingCompleted = false
    @Environment(\.scenePhase) private var scenePhase
    @Environment(\.modelContext) private var context
    @State private var lock = AppLockController.shared

    var body: some View {
        // Five tabs fit an iPhone tab bar without a "More" tab; Settings is
        // behind the gear on Today.
        TabView {
            Tab("Today", systemImage: "sun.max") {
                TodayView()
            }
            Tab("Reading", systemImage: "newspaper") {
                ReadingView()
            }
            Tab("Graph", systemImage: "point.3.connected.trianglepath.dotted") {
                GraphView()
            }
            Tab("Chat", systemImage: "bubble.left.and.bubble.right") {
                ChatListView()
            }
            Tab("Projects", systemImage: "folder") {
                ProjectsView()
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
