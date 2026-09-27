import SwiftUI
import SwiftData
import UniformTypeIdentifiers
import KnowledgeStore

/// Settings → Backup & restore: the whole library, including private-repo
/// content and embeddings, encrypted with a passphrase you choose.
struct BackupView: View {
    @Environment(\.modelContext) private var context

    @State private var passphrase = ""
    @State private var confirmation = ""
    @State private var isWorking = false
    @State private var message: String?
    @State private var shared: ExportView.SharedFile?

    @State private var isImporting = false
    @State private var backupData: Data?
    @State private var restorePassphrase = ""
    @State private var pendingRestore: LibraryArchive?

    private var canCreate: Bool {
        passphrase.count >= EncryptedBackup.minimumPassphraseLength && passphrase == confirmation && !isWorking
    }

    var body: some View {
        Form {
            Section {
                SecureField("Passphrase", text: $passphrase)
                    .textContentType(.newPassword)
                SecureField("Confirm passphrase", text: $confirmation)
                    .textContentType(.newPassword)
                Button {
                    create()
                } label: {
                    HStack {
                        Label("Create backup", systemImage: "lock.doc")
                        Spacer()
                        if isWorking && backupData == nil { ProgressView() }
                    }
                }
                .disabled(!canCreate)
            } header: {
                Text("Back up")
            } footer: {
                Text("Everything in SmartWard, encrypted with this passphrase (at least \(EncryptedBackup.minimumPassphraseLength) characters). Without it, the backup can't be opened by anyone, including you, so keep it somewhere safe. API keys, your GitHub sign-in and settings aren't included.")
            }

            Section {
                if backupData == nil {
                    Button("Choose a backup file…", systemImage: "doc.badge.arrow.up") { isImporting = true }
                        .disabled(isWorking)
                } else {
                    SecureField("Backup passphrase", text: $restorePassphrase)
                    Button {
                        openBackup()
                    } label: {
                        HStack {
                            Label("Open backup", systemImage: "lock.open")
                            Spacer()
                            if isWorking { ProgressView() }
                        }
                    }
                    .disabled(restorePassphrase.isEmpty || isWorking)
                    Button("Cancel", role: .cancel) { resetRestore() }
                }
            } header: {
                Text("Restore")
            } footer: {
                Text("Restoring replaces everything in SmartWard on this iPhone with the backup.")
            }

            if let message {
                Section { Text(message) }
            }
        }
        .navigationTitle("Backup & restore")
        .sheet(item: $shared) { file in
            ActivitySheet(items: [file.url])
        }
        .fileImporter(isPresented: $isImporting, allowedContentTypes: [.data]) { result in
            load(result)
        }
        .confirmationDialog("Replace your library?", isPresented: Binding(get: { pendingRestore != nil },
                                                                         set: { if !$0 { pendingRestore = nil } }),
                            titleVisibility: .visible) {
            Button("Erase and restore", role: .destructive) { restore() }
            Button("Cancel", role: .cancel) { resetRestore() }
        } message: {
            if let archive = pendingRestore {
                Text("The backup from \(archive.exportedAt.formatted(date: .abbreviated, time: .shortened)) has \(archive.projects.count) projects, \(archive.articles.count) articles and \(archive.conversations.count) chats. Everything currently in SmartWard is erased first.")
            }
        }
    }

    // MARK: Actions

    private func create() {
        let passphrase = passphrase
        isWorking = true
        message = nil
        Task {
            defer { isWorking = false }
            do {
                let archive = try LibraryArchive.snapshot(context: context, includePrivate: true, includeEmbeddings: true)
                // Key derivation and compression are slow; keep them off the main thread.
                let data = try await Task.detached(priority: .userInitiated) {
                    try EncryptedBackup.seal(archive, passphrase: passphrase)
                }.value
                let day = Date().formatted(.iso8601.year().month().day())
                let url = FileManager.default.temporaryDirectory
                    .appendingPathComponent("SmartWard-Backup-\(day).\(EncryptedBackup.fileExtension)")
                try data.write(to: url, options: [.atomic, .completeFileProtection])
                self.passphrase = ""
                confirmation = ""
                shared = ExportView.SharedFile(url: url)
            } catch {
                message = error.localizedDescription
            }
        }
    }

    private func load(_ result: Result<URL, Error>) {
        do {
            let url = try result.get()
            let scoped = url.startAccessingSecurityScopedResource()
            defer { if scoped { url.stopAccessingSecurityScopedResource() } }
            backupData = try Data(contentsOf: url)
            message = nil
        } catch {
            message = error.localizedDescription
        }
    }

    private func openBackup() {
        guard let data = backupData else { return }
        let passphrase = restorePassphrase
        isWorking = true
        message = nil
        Task {
            defer { isWorking = false }
            do {
                pendingRestore = try await Task.detached(priority: .userInitiated) {
                    try EncryptedBackup.open(data, passphrase: passphrase)
                }.value
            } catch {
                message = error.localizedDescription
            }
        }
    }

    private func restore() {
        guard let archive = pendingRestore else { return }
        guard !PipelineController.shared.isRunning else {
            message = "SmartWard is reading new items. Try again when it's done."
            return
        }
        do {
            try LibraryArchive.erase(context)
            try archive.restore(into: context)
            try context.save()
            message = "Restored \(archive.projects.count) projects, \(archive.articles.count) articles and \(archive.conversations.count) chats."
        } catch {
            message = "Restore failed: \(error.localizedDescription)"
        }
        resetRestore()
    }

    private func resetRestore() {
        backupData = nil
        restorePassphrase = ""
        pendingRestore = nil
    }
}
