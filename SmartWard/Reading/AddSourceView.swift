import SwiftUI
import SwiftData
import IngestKit
import KnowledgeStore

/// Adds a source after a test fetch, so a typo or a page without a feed is
/// caught here rather than showing up later as a failing source.
struct AddSourceView: View {
    enum Choice: String, CaseIterable, Identifiable {
        case feed, arxiv, hackerNews, hfPapers, githubReleases, site
        var id: Self { self }

        var kind: SourceKind {
            switch self {
            case .feed: return .rss
            case .arxiv: return .arxiv
            case .hackerNews: return .hn
            case .hfPapers: return .hfPapers
            case .githubReleases: return .githubReleases
            case .site: return .site
            }
        }

        var prompt: String {
            switch self {
            case .feed: return "Feed or blog address"
            case .arxiv: return "Category (cs.CL) or search terms"
            case .hackerNews: return "Search terms (empty: front page)"
            case .hfPapers: return ""
            case .githubReleases: return "owner/repo or GitHub link"
            case .site: return "Page address"
            }
        }

        var footer: String {
            switch self {
            case .feed:
                return "An RSS or Atom feed. A blog's home page works too if it advertises its feed."
            case .arxiv:
                return "Newest submissions first. Separate categories with commas, e.g. cs.AI, cs.CL."
            case .hackerNews:
                return "Stories matching your terms once they have a few points."
            case .hfPapers:
                return "The papers the Hugging Face community picks each day."
            case .githubReleases:
                return "New releases of a project you depend on or watch."
            case .site:
                return "A single page, re-checked on refresh and resurfaced when it changes. SmartWard honors the site's robots.txt."
            }
        }

        var needsInput: Bool { self != .hfPapers && self != .hackerNews }
    }

    static let arxivSuggestions = ["cs.AI", "cs.CL", "cs.LG", "cs.SE", "cs.CV", "stat.ML"]

    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @Query private var sources: [Source]
    @State private var choice: Choice = .feed
    @State private var input = ""
    @State private var name = ""
    @State private var isChecking = false
    @State private var errorMessage: String?
    @State private var canAddAnyway = false

    private var trimmedInput: String { input.trimmingCharacters(in: .whitespacesAndNewlines) }

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Type", selection: $choice) {
                        ForEach(Choice.allCases) { choice in
                            Text(choice.kind.displayName).tag(choice)
                        }
                    }
                    if choice != .hfPapers {
                        TextField(choice.prompt, text: $input)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled()
                            .keyboardType(choice == .arxiv || choice == .hackerNews ? .default : .URL)
                    }
                    if choice == .arxiv {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(Self.arxivSuggestions, id: \.self) { category in
                                    Button(category) { addCategory(category) }
                                        .buttonStyle(.bordered)
                                        .controlSize(.small)
                                }
                            }
                        }
                    }
                    TextField("Name (optional)", text: $name)
                } footer: {
                    Text(choice.footer)
                }

                if let errorMessage {
                    Section {
                        Text(errorMessage).foregroundStyle(.red)
                        if canAddAnyway {
                            Button("Add anyway") { add(fetched: nil) }
                        }
                    }
                }
            }
            .navigationTitle("Add source")
            .navigationBarTitleDisplayMode(.inline)
            .onChange(of: choice) {
                input = ""
                errorMessage = nil
                canAddAnyway = false
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    if isChecking {
                        ProgressView()
                    } else {
                        Button("Add") { Task { await check() } }
                            .disabled(choice.needsInput && trimmedInput.isEmpty)
                    }
                }
            }
        }
    }

    // MARK: Actions

    private func addCategory(_ category: String) {
        let current = trimmedInput
        guard !current.split(separator: ",").map({ $0.trimmingCharacters(in: .whitespaces) }).contains(category) else {
            return
        }
        input = current.isEmpty ? category : "\(current), \(category)"
    }

    /// What's stored as the source's `url`: a normalized address for web
    /// sources, the user's query for searches.
    private var storedURL: String? {
        SourceEndpoint.storedAddress(kind: choice.kind, input: trimmedInput)
    }

    private var defaultName: String {
        switch choice {
        case .arxiv: return "arXiv: \(trimmedInput)"
        case .hackerNews: return trimmedInput.isEmpty ? "Hacker News front page" : "Hacker News: \(trimmedInput)"
        case .githubReleases:
            return SourceEndpoint.fetchURL(kind: .githubReleases, input: trimmedInput)
                .map { "\($0.pathComponents.dropFirst().prefix(2).joined(separator: "/")) releases" } ?? ""
        case .feed, .hfPapers, .site: return ""
        }
    }

    private func check() async {
        errorMessage = nil
        canAddAnyway = false
        guard let url = storedURL else {
            errorMessage = "That doesn't look like a valid \(choice.kind.displayName) address."
            return
        }
        if sources.contains(where: { $0.kind == choice.kind.rawValue && $0.url.lowercased() == url.lowercased() }) {
            errorMessage = "You already have this source."
            return
        }

        isChecking = true
        defer { isChecking = false }
        do {
            let fetched = try await IngestController.shared.fetcher.fetch(SourceDescriptor(kind: choice.kind, url: url))
            add(fetched: fetched)
        } catch {
            errorMessage = error.localizedDescription
            canAddAnyway = true
        }
    }

    private func add(fetched: FetchedSource?) {
        guard let url = storedURL else { return }
        let trimmedName = name.trimmingCharacters(in: .whitespacesAndNewlines)
        let source = Source(kind: choice.kind.rawValue, url: url,
                            title: trimmedName.isEmpty ? defaultName : trimmedName)
        context.insert(source)
        do {
            if let fetched {
                try FeedIngest.apply(fetched, to: source, context: context)
            } else {
                try context.save()
            }
            dismiss()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
