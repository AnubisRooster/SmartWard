import SwiftUI
import SwiftData
import KnowledgeStore

@main
struct SmartWardApp: App {
    init() {
        // Background task handlers must be registered before launch finishes.
        BackgroundWork.registerHandlers()
    }

    var body: some Scene {
        WindowGroup {
            switch AppStore.container {
            case .success(let container):
                RootView()
                    .modelContainer(container)
            case .failure(let error):
                ContentUnavailableView("Couldn't open your library",
                                       systemImage: "externaldrive.badge.exclamationmark",
                                       description: Text(error.localizedDescription))
            }
        }
        .backgroundTask(.appRefresh(BackgroundWork.refreshID)) {
            await BackgroundWork.appRefresh()
        }
    }
}
