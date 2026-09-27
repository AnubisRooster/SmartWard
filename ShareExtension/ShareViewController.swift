import UIKit
import SwiftUI
import Observation
import UniformTypeIdentifiers
import ShareInbox

/// Share-sheet entry point (PLAN FR-3). It only writes the shared link or
/// text to the App Group inbox; the app imports it next time it runs.
final class ShareViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let model = ShareModel(extensionContext: extensionContext)
        let host = UIHostingController(rootView: ShareView(model: model))
        addChild(host)
        host.view.frame = view.bounds
        host.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(host.view)
        host.didMove(toParent: self)
        Task { await model.load() }
    }
}

@MainActor
@Observable
final class ShareModel {
    var url: String?
    var text: String?
    var title = ""
    var projects: [SharedProject] = []
    var projectID: UUID?
    var isLoading = true
    var errorMessage: String?

    @ObservationIgnored private weak var extensionContext: NSExtensionContext?
    private let inbox = SharedInbox.appGroup()

    init(extensionContext: NSExtensionContext?) {
        self.extensionContext = extensionContext
    }

    var canSave: Bool { inbox != nil && (url != nil || !(text ?? "").isEmpty) }

    func load() async {
        defer { isLoading = false }
        projects = inbox?.projects() ?? []
        let items = extensionContext?.inputItems.compactMap { $0 as? NSExtensionItem } ?? []
        for item in items {
            if title.isEmpty, let contentText = item.attributedContentText?.string {
                title = contentText
            }
            for provider in item.attachments ?? [] {
                if url == nil, provider.hasItemConformingToTypeIdentifier(UTType.url.identifier) {
                    let loaded = try? await provider.loadItem(forTypeIdentifier: UTType.url.identifier, options: nil)
                    if let shared = loaded as? URL, shared.scheme == "http" || shared.scheme == "https" {
                        url = shared.absoluteString
                    }
                } else if text == nil, provider.hasItemConformingToTypeIdentifier(UTType.plainText.identifier) {
                    let loaded = try? await provider.loadItem(forTypeIdentifier: UTType.plainText.identifier, options: nil)
                    text = loaded as? String
                }
            }
        }
        if inbox == nil {
            errorMessage = "SmartWard's shared container isn't available. Open SmartWard once, then try again."
        }
    }

    func save() {
        guard let inbox else { return }
        let trimmedTitle = title.trimmingCharacters(in: .whitespacesAndNewlines)
        let item = SharedItem(url: url, text: text, title: trimmedTitle.isEmpty ? nil : trimmedTitle,
                              projectID: projectID)
        do {
            try inbox.write(item)
            extensionContext?.completeRequest(returningItems: nil)
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func cancel() {
        extensionContext?.cancelRequest(withError: CocoaError(.userCancelled))
    }
}

struct ShareView: View {
    @Bindable var model: ShareModel

    var body: some View {
        NavigationStack {
            Form {
                if model.isLoading {
                    ProgressView()
                } else {
                    Section {
                        TextField("Title (optional)", text: $model.title)
                        if let url = model.url {
                            Text(url)
                                .font(.footnote)
                                .foregroundStyle(.secondary)
                                .lineLimit(2)
                        }
                        if let text = model.text, !text.isEmpty {
                            Text(text)
                                .font(.footnote)
                                .lineLimit(6)
                        }
                    } footer: {
                        Text("SmartWard reads and indexes it the next time it runs.")
                    }
                    if !model.projects.isEmpty {
                        Section {
                            Picker("Project", selection: $model.projectID) {
                                Text("None").tag(UUID?.none)
                                ForEach(model.projects) { project in
                                    Text(project.name).tag(UUID?.some(project.id))
                                }
                            }
                        }
                    }
                    if let error = model.errorMessage {
                        Section {
                            Text(error).foregroundStyle(.red)
                        }
                    }
                }
            }
            .navigationTitle("Add to SmartWard")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { model.cancel() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") { model.save() }
                        .disabled(!model.canSave)
                }
            }
        }
    }
}
