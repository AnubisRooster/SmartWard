import SwiftUI
import SwiftData
import UIKit
import KnowledgeStore
import Pipeline

/// Settings → Export (NFR-3): your library in open formats, through the
/// share sheet. Nothing is uploaded anywhere by SmartWard itself.
struct ExportView: View {
    enum Kind: String, CaseIterable, Identifiable {
        case library, graph, projects
        var id: Self { self }

        var title: String {
            switch self {
            case .library: return "Library (JSON)"
            case .graph: return "Knowledge graph (GraphML)"
            case .projects: return "Projects and briefs (Markdown)"
            }
        }

        var detail: String {
            switch self {
            case .library: return "Everything: projects, briefs, decisions, sources, articles, chats, the graph, usage and digests."
            case .graph: return "Themes and how they connect, for Gephi or yEd."
            case .projects: return "Each project's goal, brief, decisions, open questions and action items."
            }
        }

        var systemImage: String {
            switch self {
            case .library: return "curlybraces"
            case .graph: return "point.3.connected.trianglepath.dotted"
            case .projects: return "doc.text"
            }
        }

        var fileExtension: String {
            switch self {
            case .library: return "json"
            case .graph: return "graphml"
            case .projects: return "md"
            }
        }
    }

    @Environment(\.modelContext) private var context
    @AppStorage("export.includePrivate") private var includePrivate = false
    @State private var shared: SharedFile?
    @State private var errorMessage: String?

    struct SharedFile: Identifiable {
        let url: URL
        var id: URL { url }
    }

    var body: some View {
        Form {
            Section {
                ForEach(Kind.allCases) { kind in
                    Button {
                        export(kind)
                    } label: {
                        Label {
                            VStack(alignment: .leading, spacing: 2) {
                                Text(kind.title)
                                Text(kind.detail).font(.caption).foregroundStyle(.secondary)
                            }
                        } icon: {
                            Image(systemName: kind.systemImage)
                        }
                    }
                }
            } footer: {
                if let errorMessage {
                    Text(errorMessage).foregroundStyle(.red)
                }
            }
            Section {
                Toggle("Include private repo content", isOn: $includePrivate)
            } footer: {
                Text("Off by default: content synced from private repos, links to them, and themes found only there are left out. Embeddings are never exported; they're rebuilt on this device.")
            }
        }
        .navigationTitle("Export")
        .sheet(item: $shared) { file in
            ActivitySheet(items: [file.url])
        }
    }

    private func export(_ kind: Kind) {
        do {
            let data: Data
            switch kind {
            case .library:
                data = try LibraryArchive.snapshot(context: context, includePrivate: includePrivate,
                                                   includeEmbeddings: false).encoded()
            case .graph:
                let archive = try LibraryArchive.snapshot(context: context, includePrivate: includePrivate,
                                                          includeEmbeddings: false)
                data = Data(GraphExport.graphML(archive).utf8)
            case .projects:
                data = Data(try MarkdownExport.projects(context: context, includePrivate: includePrivate).utf8)
            }
            let day = Date().formatted(.iso8601.year().month().day())
            let url = FileManager.default.temporaryDirectory
                .appendingPathComponent("SmartWard-\(kind.rawValue.capitalized)-\(day).\(kind.fileExtension)")
            try data.write(to: url, options: [.atomic, .completeFileProtection])
            errorMessage = nil
            shared = SharedFile(url: url)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}

/// The system share sheet for files.
struct ActivitySheet: UIViewControllerRepresentable {
    let items: [Any]

    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: items, applicationActivities: nil)
    }

    func updateUIViewController(_ controller: UIActivityViewController, context: Context) {}
}
