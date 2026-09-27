import Foundation
import SwiftData

public enum KnowledgeSchema {
    /// Every persistent model type. The app's `ModelContainer` and all tests
    /// use this list, so a model can't be silently left out of either.
    public static let models: [any PersistentModel.Type] = [
        Project.self,
        ProjectBrief.self,
        BriefRevision.self,
        StrategyItem.self,
        ProjectLink.self,
        InterestProfile.self,
        ReadingSignal.self,
        Source.self,
        Article.self,
        Conversation.self,
        Message.self,
        Chunk.self,
        ThemeNode.self,
        EntityAlias.self,
        Mention.self,
        ThemeEdge.self,
        MergeSuggestion.self,
        UsageRecord.self,
        Digest.self,
    ]

    public static var schema: Schema { Schema(models) }

    /// The app's container. `inMemory` is for tests and SwiftUI previews.
    /// CloudKit sync is off until Phase 6 (PLAN §6); the schema is already
    /// CloudKit-compatible so turning it on is a configuration change.
    public static func makeContainer(inMemory: Bool = false) throws -> ModelContainer {
        let configuration = ModelConfiguration(schema: schema,
                                               isStoredInMemoryOnly: inMemory,
                                               cloudKitDatabase: .none)
        return try ModelContainer(for: schema, configurations: [configuration])
    }
}
