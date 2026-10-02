import SwiftUI
import SwiftData
import UIKit
import FoundationModels
import KnowledgeStore
import Pipeline

/// Settings → Background refresh → Indexing details: what indexing has
/// actually been doing, so a backlog that won't shrink can be explained
/// (provider failing, today's budget spent, slow on-device calls).
struct IndexingDetailsView: View {
    @Environment(\.modelContext) private var context
    @State private var pipeline = PipelineController.shared
    @State private var spentToday: Double?
    @State private var copied = false

    private var graph: GraphRunStats { pipeline.sessionGraph }
    private var budget: DailyBudget { BudgetSettings.current }

    private var providerLine: String {
        guard let settings = ExtractionSettings.byokSettings() else {
            let defaults = UserDefaults.standard
            if defaults.object(forKey: ExtractionSettings.useProviderKey) != nil,
               !defaults.bool(forKey: ExtractionSettings.useProviderKey) {
                return "Off (Settings → Knowledge graph)"
            }
            return "None: no API key for the chosen provider"
        }
        return "\(settings.provider.rawValue) · \(settings.model)"
    }

    private var onDeviceLine: String {
        switch SystemLanguageModel.default.availability {
        case .available: return "Available"
        case .unavailable(.appleIntelligenceNotEnabled): return "Turned off in Settings"
        case .unavailable(.deviceNotEligible): return "Not supported on this device"
        case .unavailable(.modelNotReady): return "Downloading"
        case .unavailable: return "Unavailable"
        @unknown default: return "Unavailable"
        }
    }

    private var budgetLine: String {
        let spent = spentToday.map { $0.formatted(.currency(code: "USD")) } ?? "?"
        guard let cap = budget.capUSD else { return "\(spent) today, no cap" }
        return "\(spent) of \(cap.formatted(.currency(code: "USD"))) today"
    }

    /// Until when your provider is paused, and why, while it is.
    private var pauseLine: String? {
        let pause = pipeline.providerPause
        guard pause.isActive(now: Date()), let until = pause.until else { return nil }
        let reason = pause.reason.map { ": \($0)" } ?? ""
        return "Paused until \(until.formatted(date: .omitted, time: .shortened))\(reason)"
    }

    private static func seconds(_ value: Double?) -> String {
        value.map { String(format: "%.1f s per call", $0) } ?? "no calls yet"
    }

    var body: some View {
        List {
            Section("Waiting") {
                LabeledContent("Not yet searchable", value: "\(pipeline.backlog.notSearchable)")
                LabeledContent("Waiting for the knowledge graph", value: "\(pipeline.backlog.graphPending)")
                LabeledContent("Left out of the graph", value: "\(pipeline.backlog.graphSkipped)")
            }

            Section {
                LabeledContent("Provider for the graph", value: providerLine)
                LabeledContent("Apple Intelligence", value: onDeviceLine)
                LabeledContent("Spend", value: budgetLine)
                if let pauseLine {
                    Label("Your provider is skipped for a while after rate limits, timeouts or repeated failures, so Apple Intelligence takes the articles. \(pauseLine)",
                          systemImage: "pause.circle")
                        .foregroundStyle(.orange)
                }
                if graph.budgetPaused {
                    Label("Today's budget is spent, so your provider is paused and only Apple Intelligence is extracting.",
                          systemImage: "pause.circle")
                        .foregroundStyle(.orange)
                }
                LabeledContent("Indexing while open", value: pipeline.isIndexingWhileOpen ? "On" : "Off")
                LabeledContent("Running now", value: pipeline.isRunning ? "Yes" : "No")
            } header: {
                Text("Setup")
            }

            Section {
                LabeledContent("Added by your provider", value: "\(graph.providerLinked)")
                LabeledContent("Provider failures", value: "\(graph.providerFailures)")
                LabeledContent("Provider speed", value: Self.seconds(graph.providerSecondsPerCall))
                LabeledContent("Added on this device", value: "\(graph.onDeviceLinked)")
                LabeledContent("On-device failures", value: "\(graph.onDeviceFailures)")
                LabeledContent("On-device speed", value: Self.seconds(graph.onDeviceSecondsPerCall))
                LabeledContent("No extractor allowed", value: "\(graph.unavailable)")
                LabeledContent("Retried later (temporary errors)", value: "\(graph.deferred)")
                LabeledContent("Chat turns added", value: "\(graph.turnsLinked)")
                LabeledContent("Chat turns failed", value: "\(graph.turnsFailed)")
                LabeledContent("Runs", value: "\(pipeline.runsThisSession)")
                if let at = pipeline.lastRunAt {
                    LabeledContent("Last run") {
                        Text("\(Int(pipeline.lastRunSeconds)) s, ") + Text(at, style: .relative) + Text(" ago")
                    }
                }
            } header: {
                Text("Knowledge graph since SmartWard opened")
            }

            Section {
                if graph.errors.isEmpty {
                    Text("No failures since SmartWard opened.").foregroundStyle(.secondary)
                } else {
                    ForEach(graph.errors, id: \.self) { error in
                        Text(error).font(.footnote).textSelection(.enabled)
                    }
                }
            } header: {
                Text("Recent failures")
            }

            Section {
                Button(copied ? "Copied" : "Copy details", systemImage: "doc.on.doc") {
                    UIPasteboard.general.string = report
                    copied = true
                }
            } footer: {
                Text("Paste these into a message when asking for help. They contain no article text, only counts, timings, your provider and model names, and error messages.")
            }
        }
        .navigationTitle("Indexing details")
        .task {
            pipeline.refreshWaiting(context: context)
            spentToday = try? budget.spentToday(context: context)
        }
    }

    /// Everything on screen, as text.
    private var report: String {
        var lines = [
            "SmartWard indexing details",
            "Not yet searchable: \(pipeline.backlog.notSearchable)",
            "Waiting for the graph: \(pipeline.backlog.graphPending)",
            "Left out of the graph: \(pipeline.backlog.graphSkipped)",
            "Provider: \(providerLine)",
            "Apple Intelligence: \(onDeviceLine)",
            "Spend: \(budgetLine)\(graph.budgetPaused ? " (provider paused: budget spent)" : "")",
            "Provider pause: \(pauseLine ?? (graph.providerPaused ? "was paused this session" : "none"))",
            "Indexing while open: \(pipeline.isIndexingWhileOpen ? "on" : "off"), running now: \(pipeline.isRunning ? "yes" : "no")",
            "Provider: \(graph.providerLinked) added, \(graph.providerFailures) failed, \(Self.seconds(graph.providerSecondsPerCall))",
            "On device: \(graph.onDeviceLinked) added, \(graph.onDeviceFailures) failed, \(Self.seconds(graph.onDeviceSecondsPerCall))",
            "No extractor allowed: \(graph.unavailable), retried later: \(graph.deferred)",
            "Chat turns: \(graph.turnsLinked) added, \(graph.turnsFailed) failed",
            "Runs: \(pipeline.runsThisSession), last \(Int(pipeline.lastRunSeconds)) s",
        ]
        if let summary = UserDefaults.standard.string(forKey: BackgroundWork.lastRunKey) { lines.append("Last background run: \(summary)") }
        lines.append("Recent failures:")
        lines += graph.errors.isEmpty ? ["none"] : graph.errors.map { "- " + $0 }
        return lines.joined(separator: "\n")
    }
}
