import SwiftUI
import SwiftData
import KnowledgeStore

@main
struct SmartWardApp: App {
    private let store = Result { try KnowledgeSchema.makeContainer() }

    var body: some Scene {
        WindowGroup {
            switch store {
            case .success(let container):
                RootView()
                    .modelContainer(container)
            case .failure(let error):
                ContentUnavailableView("Couldn't open your library",
                                       systemImage: "externaldrive.badge.exclamationmark",
                                       description: Text(error.localizedDescription))
            }
        }
    }
}
