import Foundation
import SwiftUI
import BackgroundTasks
import SwiftData
import IngestKit
import KnowledgeStore
import ShareInbox
import Pipeline

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

    /// Settings → how soon the *next* background refresh request's
    /// `earliestBeginDate` is. iOS still decides the actual time from its
    /// own budget (battery, usage patterns): this only nudges the earliest
    /// it's allowed to run, never a guaranteed cadence.
    static let refreshEagernessKey = "background.refreshEagerness"

    /// How the last background run ended, for Settings: iOS's own banner
    /// only says "Task failed" and can't say why.
    static let lastRunKey = "background.lastRun"
    static let lastRunAtKey = "background.lastRunAt"

    @MainActor
    private static func recordRun(_ label: String, started: Date, stoppedEarly: Bool, fetch: String?,
                                  report: PipelineRunner.Report?) {
        let summary = RunSummary.text(elapsed: Date().timeIntervalSince(started), stoppedEarly: stoppedEarly,
                                      fetch: fetch, indexed: report?.embedded ?? 0,
                                      waiting: PipelineController.shared.waiting)
        UserDefaults.standard.set("\(label): \(summary)", forKey: lastRunKey)
        UserDefaults.standard.set(Date().timeIntervalSince1970, forKey: lastRunAtKey)
    }

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
        refresh.earliestBeginDate = Date(timeIntervalSinceNow: RefreshEagerness.current.interval)
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
        let started = Date()
        ShareIntake.importPending(context: context)
        let report = await PipelineController.shared.process(context: context, budget: budget)
        // Relations whose evidence was deleted; too heavy for every foreground run.
        if (try? GraphLinker.pruneOrphanedEdges(context: context)) ?? 0 > 0 {
            try? context.save()
        }
        await DigestController.shared.buildIfDue(context: context, notify: true)
        recordRun("Overnight indexing", started: started, stoppedEarly: Task.isCancelled, fetch: nil, report: report)
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
        let started = Date()

        // Percent, so the bar only moves forward and iOS sees steady progress:
        // fetching the sources is the first fifth, indexing the rest.
        let fetchShare: Int64 = 20
        task.progress.totalUnitCount = 100
        let fetch = await IngestController.shared.refreshAll(context: context, process: false) { finished, total in
            task.progress.completedUnitCount = fetchShare * Int64(finished) / Int64(max(total, 1))
        }
        let fetched = !Task.isCancelled

        var report: PipelineRunner.Report?
        if fetched {
            task.progress.completedUnitCount = fetchShare
            report = await PipelineController.shared.process(context: context, budget: continuedBudget) { done, total in
                task.progress.completedUnitCount = fetchShare + (100 - fetchShare) * Int64(done) / Int64(max(total, 1))
            }
        }

        let stoppedEarly = Task.isCancelled
        if !stoppedEarly { task.progress.completedUnitCount = 100 }
        recordRun("Refresh now", started: started, stoppedEarly: stoppedEarly, fetch: fetch, report: report)
        // Indexing saves after every step and picks up where it stopped, so a
        // run that iOS ends after the fetch lost nothing: it only fails if
        // the fetch itself was cut short.
        task.setTaskCompleted(success: fetched)
    }
}

/// How soon background refresh may next run — a nudge to iOS, not a
/// schedule it honors exactly.
enum RefreshEagerness: String, CaseIterable, Identifiable {
    case relaxed, normal, frequent
    var id: Self { self }

    var interval: TimeInterval {
        switch self {
        case .relaxed: return 4 * 60 * 60
        case .normal: return 60 * 60
        case .frequent: return 15 * 60
        }
    }

    var label: String {
        switch self {
        case .relaxed: return "Less often"
        case .normal: return "Normal"
        case .frequent: return "More often"
        }
    }

    static var current: RefreshEagerness {
        RefreshEagerness(rawValue: UserDefaults.standard.string(forKey: BackgroundWork.refreshEagernessKey) ?? "")
            ?? .normal
    }
}

/// Settings → Reading: how soon the next background refresh is allowed to
/// run, and a manual trigger for right now.
struct BackgroundRefreshSettingsSection: View {
    @AppStorage(BackgroundWork.refreshEagernessKey) private var eagernessRaw = RefreshEagerness.normal.rawValue
    @AppStorage(BackgroundWork.lastRunKey) private var lastRun = ""
    @AppStorage(BackgroundWork.lastRunAtKey) private var lastRunAt = 0.0
    @Environment(\.modelContext) private var context
    @State private var ingest = IngestController.shared
    @State private var pipeline = PipelineController.shared

    private var eagerness: Binding<RefreshEagerness> {
        Binding(get: { RefreshEagerness(rawValue: eagernessRaw) ?? .normal },
               set: { eagernessRaw = $0.rawValue })
    }

    private var isRefreshing: Bool { ingest.isRefreshing || pipeline.isRunning }

    var body: some View {
        Section {
            Picker("Check for updates", selection: eagerness) {
                ForEach(RefreshEagerness.allCases) { Text($0.label).tag($0) }
            }
            Button {
                BackgroundWork.startContinuedRefresh(context: context)
            } label: {
                HStack {
                    Text("Refresh now")
                    Spacer()
                    if isRefreshing { ProgressView() }
                }
            }
            .disabled(isRefreshing)
            LabeledContent("Waiting to be indexed", value: "\(pipeline.waiting)")
            if !lastRun.isEmpty {
                VStack(alignment: .leading, spacing: 2) {
                    Text(lastRun)
                    Text(Date(timeIntervalSince1970: lastRunAt), format: .relative(presentation: .named))
                }
                .font(.footnote)
                .foregroundStyle(.secondary)
            }
        } header: {
            Text("Background refresh")
        } footer: {
            Text("iOS decides the actual time from its own budget — battery, how often you open SmartWard — so this only changes how soon the next refresh is allowed to run, not a fixed schedule. Refresh now always fetches immediately, in the background if you leave the app. If iOS ends a run early, the line above says how far it got; the rest carries on next time. Keeping the app open and plugged in helps.")
        }
        .task { pipeline.refreshWaiting(context: context) }
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
