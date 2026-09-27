import SwiftUI
import SwiftData
import KnowledgeStore
import Pipeline

/// The theme graph (FR-15): strongest themes in a scope, drawn natively and
/// offline. Tap a theme for its detail; review uncertain merges from here.
struct GraphView: View {
    enum ScopeChoice: Hashable {
        case all, recent, project(UUID), source(UUID)
    }

    @Environment(\.modelContext) private var context
    @Query(sort: \Project.name) private var projects: [Project]
    @Query(sort: \Source.title) private var sources: [Source]
    @Query(filter: #Predicate<MergeSuggestion> { $0.status == "pending" }) private var pending: [MergeSuggestion]
    @Query private var nodes: [ThemeNode]

    @State private var scope: ScopeChoice = .all
    @State private var showDormant = false
    @State private var snapshot = GraphSnapshot(nodes: [], edges: [])
    @State private var positions: [UUID: ForceLayout.Point] = [:]
    @State private var selected: ThemeNode?
    @State private var showingReview = false

    private var graphScope: GraphSnapshot.Scope {
        switch scope {
        case .all: return .all
        case .recent: return .recent(days: 14)
        case .project(let id): return .project(id)
        case .source(let id): return .source(id)
        }
    }

    var body: some View {
        NavigationStack {
            Group {
                if snapshot.nodes.isEmpty {
                    ContentUnavailableView("No themes yet", systemImage: "point.3.connected.trianglepath.dotted",
                                           description: Text("Themes appear as SmartWard reads your sources and your conversations."))
                } else {
                    GraphCanvas(snapshot: snapshot, positions: positions) { id in
                        selected = nodes.first { $0.id == id }
                    }
                }
            }
            .navigationTitle("Graph")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Menu {
                        Picker("Scope", selection: $scope) {
                            Text("All themes").tag(ScopeChoice.all)
                            Text("Last two weeks").tag(ScopeChoice.recent)
                            if !projects.isEmpty {
                                Section("Projects") {
                                    ForEach(projects) { Text($0.name).tag(ScopeChoice.project($0.id)) }
                                }
                            }
                            let polled = sources.filter { $0.sourceKind.isPolled || $0.sourceKind == .githubRepo }
                            if !polled.isEmpty {
                                Section("Sources") {
                                    ForEach(polled) { source in
                                        Text(source.title.isEmpty ? source.url : source.title)
                                            .tag(ScopeChoice.source(source.id))
                                    }
                                }
                            }
                        }
                        Toggle("Show dormant themes", isOn: $showDormant)
                    } label: {
                        Label("Scope", systemImage: "line.3.horizontal.decrease.circle")
                    }
                }
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        showingReview = true
                    } label: {
                        Label("Review merges", systemImage: "arrow.triangle.merge")
                    }
                    .badge(pending.count)
                    .disabled(pending.isEmpty)
                }
            }
            .sheet(item: $selected) { node in
                NavigationStack { ThemeDetailView(node: node) }
            }
            .sheet(isPresented: $showingReview) {
                NavigationStack { MergeReviewView() }
            }
            .task(id: RefreshKey(scope: scope, showDormant: showDormant, nodeCount: nodes.count)) {
                rebuild()
            }
            .onChange(of: selected) { _, newValue in
                if newValue == nil { rebuild() }
            }
            .onChange(of: showingReview) { _, showing in
                if !showing { rebuild() }
            }
        }
    }

    private struct RefreshKey: Hashable {
        let scope: ScopeChoice
        let showDormant: Bool
        let nodeCount: Int
    }

    private func rebuild() {
        let built = (try? GraphSnapshot.build(context: context, scope: graphScope, includeDormant: showDormant))
            ?? GraphSnapshot(nodes: [], edges: [])
        snapshot = built
        positions = ForceLayout.layout(built)
    }
}

/// Draws the snapshot: node size by strength, colour by type, edge width by
/// evidence. Tap a node to open it.
struct GraphCanvas: View {
    let snapshot: GraphSnapshot
    let positions: [UUID: ForceLayout.Point]
    var onTap: (UUID) -> Void

    @State private var zoom: CGFloat = 1
    @GestureState private var pinch: CGFloat = 1

    private func radius(_ node: GraphSnapshot.Node) -> CGFloat {
        CGFloat(min(26, max(7, 6 + node.strength * 3)))
    }

    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            let scale = zoom * pinch
            let point: (UUID) -> CGPoint? = { id in
                guard let p = positions[id] else { return nil }
                return CGPoint(x: (CGFloat(p.x) - 0.5) * size.width * scale + size.width / 2,
                               y: (CGFloat(p.y) - 0.5) * size.height * scale + size.height / 2)
            }
            ZStack {
                Canvas { canvas, _ in
                    for edge in snapshot.edges {
                        guard let a = point(edge.source), let b = point(edge.target) else { continue }
                        var path = Path()
                        path.move(to: a)
                        path.addLine(to: b)
                        canvas.stroke(path, with: .color(.secondary.opacity(0.35)),
                                      lineWidth: CGFloat(min(4, 0.8 + Double(edge.weight) * 0.5)))
                    }
                }
                ForEach(snapshot.nodes) { node in
                    if let center = point(node.id) {
                        let r = radius(node)
                        VStack(spacing: 2) {
                            Circle()
                                .fill(ThemeStyle.color(for: node.type).gradient)
                                .frame(width: r * 2, height: r * 2)
                            Text(node.label)
                                .font(.caption2)
                                .lineLimit(1)
                                .fixedSize()
                        }
                        .position(x: center.x, y: center.y + 6)
                        .onTapGesture { onTap(node.id) }
                        .accessibilityElement(children: .ignore)
                        .accessibilityLabel("\(node.label), \(node.type), \(node.mentions) mentions")
                        .accessibilityAddTraits(.isButton)
                    }
                }
            }
            .contentShape(Rectangle())
            .gesture(MagnifyGesture()
                .updating($pinch) { value, state, _ in state = value.magnification }
                .onEnded { value in zoom = min(3, max(0.6, zoom * value.magnification)) })
        }
        .padding(8)
    }
}

/// One theme: how strong it is, what it's called, what it connects to, and
/// where it came up. Fix the resolver's mistakes here with merge and split.
struct ThemeDetailView: View {
    @Bindable var node: ThemeNode

    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @State private var mergingInto = false
    @State private var errorMessage: String?

    struct Connection: Identifiable {
        let node: ThemeNode
        let count: Int
        let type: String
        var id: UUID { node.id }
    }

    private var connections: [Connection] {
        let id = node.id
        let edges = (try? context.fetch(FetchDescriptor<ThemeEdge>(predicate: #Predicate {
            $0.sourceNodeID == id || $0.targetNodeID == id
        }))) ?? []
        var counts: [UUID: (count: Int, type: String)] = [:]
        for edge in edges {
            let other = edge.sourceNodeID == id ? edge.targetNodeID : edge.sourceNodeID
            let current = counts[other] ?? (count: 0, type: edge.type)
            counts[other] = (count: current.count + 1, type: current.type)
        }
        let ids = Array(counts.keys)
        let others = (try? context.fetch(FetchDescriptor<ThemeNode>(predicate: #Predicate { ids.contains($0.id) }))) ?? []
        var result: [Connection] = []
        for other in others {
            guard let entry = counts[other.id] else { continue }
            result.append(Connection(node: other, count: entry.count, type: entry.type))
        }
        return result.sorted { $0.count > $1.count }
    }

    private var recentMentions: [Mention] {
        (node.mentions ?? []).sorted { $0.createdAt > $1.createdAt }.prefix(12).map { $0 }
    }

    var body: some View {
        Form {
            Section {
                TextField("Name", text: $node.canonicalLabel)
                LabeledContent("Type", value: node.type)
                LabeledContent("Mentions", value: "\(node.mentions?.count ?? 0)")
                LabeledContent("Strength", value: String(format: "%.1f", ThemeStrength.score(of: node)))
            }
            if !(node.aliases ?? []).isEmpty {
                Section {
                    ForEach(node.aliases ?? []) { alias in
                        HStack {
                            Text(alias.alias)
                            Spacer()
                            if alias.origin == "user" {
                                Image(systemName: "person.crop.circle.badge.checkmark")
                                    .foregroundStyle(.secondary)
                                    .accessibilityLabel("Set by you")
                            }
                        }
                        .swipeActions {
                            Button("Split off") { split(alias) }
                                .tint(.orange)
                        }
                    }
                } header: {
                    Text("Also called")
                } footer: {
                    Text("Swipe a name to split it into its own theme if it's a different thing.")
                }
            }
            let connections = self.connections
            if !connections.isEmpty {
                Section("Connected to") {
                    ForEach(connections) { entry in
                        HStack {
                            Label(entry.node.canonicalLabel, systemImage: ThemeStyle.systemImage(for: entry.node.type))
                            Spacer()
                            Text("\(entry.type.replacingOccurrences(of: "_", with: " ").lowercased()) ×\(entry.count)")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            Section("Where it came up") {
                ForEach(recentMentions) { mention in
                    VStack(alignment: .leading, spacing: 2) {
                        Text(title(for: mention)).font(.subheadline)
                        Text(mention.createdAt, format: .relative(presentation: .named))
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            Section {
                Button("Merge into another theme…") { mergingInto = true }
            } footer: {
                if let errorMessage { Text(errorMessage).foregroundStyle(.red) }
            }
        }
        .navigationTitle(node.canonicalLabel)
        .navigationBarTitleDisplayMode(.inline)
        .onChange(of: node.canonicalLabel) { _, label in
            node.normalizedKey = ThemeNode.normalizedKey(type: node.type, label: label)
        }
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Done") {
                    try? context.save()
                    dismiss()
                }
            }
        }
        .sheet(isPresented: $mergingInto) {
            NavigationStack {
                ThemePicker(excluding: node.id) { target in
                    merge(into: target)
                }
            }
        }
    }

    private func title(for mention: Mention) -> String {
        if let article = mention.chunk?.article { return article.title }
        if let conversation = mention.chunk?.message?.conversation {
            return "Conversation: \(conversation.title.isEmpty ? "Untitled" : conversation.title)"
        }
        return "Unknown"
    }

    private func split(_ alias: EntityAlias) {
        GraphEditing.split(alias, from: node, context: context)
        try? context.save()
    }

    private func merge(into target: ThemeNode) {
        do {
            try GraphEditing.merge(node, into: target, context: context)
            try context.save()
            dismiss()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}

/// Picks a theme to merge into.
struct ThemePicker: View {
    let excluding: UUID
    var onPick: (ThemeNode) -> Void

    @Environment(\.dismiss) private var dismiss
    @Query(sort: \ThemeNode.canonicalLabel) private var nodes: [ThemeNode]
    @State private var query = ""

    private var matches: [ThemeNode] {
        let others = nodes.filter { $0.id != excluding }
        guard !query.isEmpty else { return others }
        return others.filter { $0.canonicalLabel.localizedCaseInsensitiveContains(query) }
    }

    var body: some View {
        List(matches) { node in
            Button {
                onPick(node)
                dismiss()
            } label: {
                Label(node.canonicalLabel, systemImage: ThemeStyle.systemImage(for: node.type))
            }
        }
        .searchable(text: $query)
        .navigationTitle("Merge into")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") { dismiss() }
            }
        }
    }
}

/// The resolver's uncertain calls: "is X the same as Y?"
struct MergeReviewView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @Query(filter: #Predicate<MergeSuggestion> { $0.status == "pending" },
           sort: \MergeSuggestion.similarity, order: .reverse) private var pending: [MergeSuggestion]
    @Query private var nodes: [ThemeNode]

    var body: some View {
        List {
            ForEach(pending) { suggestion in
                if let node = nodes.first(where: { $0.id == suggestion.nodeID }),
                   let candidate = nodes.first(where: { $0.id == suggestion.candidateID }) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Is **\(node.canonicalLabel)** the same as **\(candidate.canonicalLabel)**?")
                        HStack {
                            Button("Same thing") { merge(node, into: candidate) }
                                .buttonStyle(.borderedProminent)
                            Button("Different") { keepSeparate(suggestion) }
                                .buttonStyle(.bordered)
                        }
                        .controlSize(.small)
                    }
                    .padding(.vertical, 4)
                }
            }
        }
        .overlay {
            if pending.isEmpty {
                ContentUnavailableView("Nothing to review", systemImage: "checkmark.circle")
            }
        }
        .navigationTitle("Review merges")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Done") { dismiss() }
            }
        }
    }

    private func merge(_ node: ThemeNode, into candidate: ThemeNode) {
        try? GraphEditing.merge(node, into: candidate, context: context)
        try? context.save()
    }

    private func keepSeparate(_ suggestion: MergeSuggestion) {
        GraphEditing.dismiss(suggestion)
        try? context.save()
    }
}
