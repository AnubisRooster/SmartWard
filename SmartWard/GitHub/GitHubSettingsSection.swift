import SwiftUI
import IngestKit

/// Settings → GitHub (D4): one-tap sign-in by default, a personal access
/// token under Advanced.
struct GitHubSettingsSection: View {
    @State private var account = GitHubAccount.shared
    @AppStorage("github.includePrivateRepos") private var includePrivateRepos = false
    @State private var showingDeviceFlow = false
    @State private var tokenDraft = ""
    @State private var showingAdvanced = false

    var body: some View {
        Section {
            if let login = account.login {
                LabeledContent("Signed in as", value: "@\(login)")
                Button("Sign out", role: .destructive) { account.signOut() }
            } else if account.hasToken && account.isChecking {
                ProgressView()
            } else {
                if !GitHubConfig.oauthClientID.isEmpty {
                    Toggle("Include private repos", isOn: $includePrivateRepos)
                    Button("Sign in with GitHub") { showingDeviceFlow = true }
                }
                DisclosureGroup("Use a personal access token instead", isExpanded: $showingAdvanced) {
                    SecureField("Fine-grained token (read-only)", text: $tokenDraft)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    Button("Save token") {
                        Task {
                            if await account.signIn(token: tokenDraft) { tokenDraft = "" }
                        }
                    }
                    .disabled(tokenDraft.isEmpty || account.isChecking)
                }
            }
            if let error = account.lastError {
                Text(error).font(.footnote).foregroundStyle(.red)
            }
        } header: {
            Text("GitHub")
        } footer: {
            Text("SmartWard only reads from GitHub: repo docs, architecture reports and dependency manifests, never source code. Private repos are processed on-device only. The token stays in this device's Keychain.")
        }
        .task { await account.refresh() }
        .sheet(isPresented: $showingDeviceFlow) {
            GitHubDeviceSignInView(includePrivateRepos: includePrivateRepos)
        }
    }
}

struct GitHubDeviceSignInView: View {
    let includePrivateRepos: Bool

    @Environment(\.dismiss) private var dismiss
    @Environment(\.openURL) private var openURL
    @State private var code: GitHubDeviceCode?
    @State private var errorMessage: String?

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                if let code {
                    Text("Enter this code on GitHub")
                        .font(.headline)
                    Text(code.userCode)
                        .font(.system(.largeTitle, design: .monospaced))
                        .textSelection(.enabled)
                    Button("Copy code and open GitHub") {
                        UIPasteboard.general.string = code.userCode
                        if let url = URL(string: code.verificationURI) { openURL(url) }
                    }
                    .buttonStyle(.borderedProminent)
                    ProgressView("Waiting for approval…")
                } else if let errorMessage {
                    Label(errorMessage, systemImage: "exclamationmark.triangle")
                        .foregroundStyle(.red)
                } else {
                    ProgressView("Contacting GitHub…")
                }
            }
            .padding()
            .navigationTitle("Sign in with GitHub")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
            }
            .task { await run() }
        }
    }

    private func run() async {
        let flow = GitHubDeviceFlow(clientID: GitHubConfig.oauthClientID, includePrivateRepos: includePrivateRepos)
        do {
            let started = try await flow.start()
            code = started
            let token = try await flow.waitForToken(started)
            if await GitHubAccount.shared.signIn(token: token) {
                dismiss()
            } else {
                errorMessage = GitHubAccount.shared.lastError ?? "Sign-in failed."
            }
        } catch is CancellationError {
            return
        } catch {
            errorMessage = error.localizedDescription
            code = nil
        }
    }
}
