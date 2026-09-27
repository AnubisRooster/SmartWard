import Foundation
import SwiftData
import KnowledgeStore

/// The app's one `ModelContainer`, shared by the UI and background tasks.
@MainActor
enum AppStore {
    static let container: Result<ModelContainer, Error> = Result { try KnowledgeSchema.makeContainer() }
}
