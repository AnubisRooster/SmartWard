import Foundation
import BackgroundTasks
import SwiftData
import IngestKit
import KnowledgeStore
import ShareInbox

/// Background scheduling (PLAN §5.1):
/// - App refresh: poll feeds. Network only, so it fits the short window.
/// - Processing (on power): triage, full text and indexing of the backlog.
/// - Continued processing (iOS 26): a tapped "Refresh" keeps going, with the
///   system's progress UI, after you leave the app.
enum BackgroundWork {
    static let refreshID = "com.intelligentdesignsllc.smartward.refresh"
    static let processingID = "com.intelligentdesignsllc.smartward.processing"
    /// Continued-processing requests use `<prefix>.<uuid>`; Info.plist permits `<prefix>.*`.
    static let continuedPrefix = "com.intelligentdesignsllc.smartward.continued"

    static let processingBudget: TimeInterval = 10 * 60
    static let continuedBudget: TimeInterval = 5 * 60

    static func registerHandlers() {
        _ = BGTaskScheduler.shared.register(forTaskWithIdentifier: processingID, using: nil) { task in
            guard let task = task as? BGProcessingTask else {
                task.setTaskCompleted(success: false)
                return
            }
            let work = Task { @MainActor in
                await runBacklog(budget: processingBudget)
                task.setTaskCompleted(success: !Task.isCancelled)
            }
            task.expirationHandler = { work.cancel() }
        }
    }

    /// Asks for the next refresh and processing windows. Called when the app
    /// goes to the background and after each refresh.
    static func schedule() {
        let refresh = BGAppRefreshTaskRequest(identifier: refreshID)
        refresh.earliestBeginDate = Date(timeIntervalSinceNow: 60 * 60)
        try? BGTaskScheduler.shared.submit(refresh)

        let processing = BGProcessingTaskRequest(identifier: processingID)
        processing.requiresExternalPower = true
        processing.requiresNetworkConnectivity = true
        try? BGTaskScheduler.shared.submit(processing)
    }

    /// The app-refresh window: fetch only; processing runs in its own window.
    @MainActor
    static func appRefresh() async {
        schedule()
        guard case .success(let container) = AppStore.container else { return }
        let context = container.mainContext
        ShareIntake.importPending(context: context)
        await IngestController.shared.refreshAll(context: context, process: false)
    }

    @MainActor
    static func runBacklog(budget: TimeInterval) async {
        guard case .success(let container) = AppStore.container else { return }
        let context = container.mainContext
        ShareIntake.importPending(context: context)
        await PipelineController.shared.process(context: context, budget: budget)
        await DigestController.shared.buildIfDue(context: context, notify: true)
    }

    /// "Refresh" from the Reading tab: fetch every source, then triage and
    /// index, continuing in the background with system progress if you leave
    /// the app. Falls back to an in-app refresh if the system declines.
    @MainActor
    static func startContinuedRefresh(context: ModelContext) {
        let identifier = "\(continuedPrefix).\(UUID().uuidString)"
        _ = BGTaskScheduler.shared.register(forTaskWithIdentifier: identifier, using: nil) { task in
            guard let task = task as? BGContinuedProcessingTask else {
                task.setTaskCompleted(success: false)
                return
            }
            let work = Task { @MainActor in
                await runContinued(task)
            }
            task.expirationHandler = { work.cancel() }
        }
        let request = BGContinuedProcessingTaskRequest(identifier: identifier,
                                                       title: "Refreshing SmartWard",
                                                       subtitle: "Fetching and reading your sources")
        do {
            try BGTaskScheduler.shared.submit(request)
        } catch {
            Task { await IngestController.shared.refreshAll(context: context) }
        }
    }

    @MainActor
    private static func runContinued(_ task: BGContinuedProcessingTask) async {
        guard case .success(let container) = AppStore.container else {
            task.setTaskCompleted(success: false)
            return
        }
        let context = container.mainContext
        task.progress.totalUnitCount = 2
        await IngestController.shared.refreshAll(context: context, process: false)
        task.progress.completedUnitCount = 1
        await PipelineController.shared.process(context: context, budget: continuedBudget)
        task.progress.completedUnitCount = 2
        task.setTaskCompleted(success: !Task.isCancelled)
    }
}

/// Moves share-sheet items from the App Group inbox into the library, and
/// keeps the extension's project list current.
@MainActor
enum ShareIntake {
    /// - Returns: how many items were added or resurfaced.
    @discardableResult
    static func importPending(context: ModelContext) -> Int {
        guard let inbox = SharedInbox.appGroup() else { return 0 }
        publishProjects(to: inbox, context: context)

        let items = inbox.pending()
        guard !items.isEmpty else { return 0 }
        do {
            let result = try SharedImport.importItems(items, context: context)
            for item in items { inbox.remove(item.id) }
            return result.added + result.resurfaced
        } catch {
            return 0
        }
    }

    static func publishProjects(to inbox: SharedInbox, context: ModelContext) {
        let projects = (try? context.fetch(FetchDescriptor<Project>(predicate: #Predicate { $0.isActive },
                                                                   sortBy: [SortDescriptor(\.name)]))) ?? []
        try? inbox.writeProjects(projects.map { SharedProject(id: $0.id, name: $0.name) })
    }
}
