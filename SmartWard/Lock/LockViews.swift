import SwiftUI
import PINLockKit
import AppLock

/// Full-screen lock: tries biometrics first, the PIN pad as the fallback.
struct LockScreen: View {
    @State private var controller = AppLockController.shared
    @State private var pin = ""
    @FocusState private var pinFocused: Bool

    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            Image(systemName: "lock.fill")
                .font(.system(size: 44))
                .foregroundStyle(.secondary)
            Text("SmartWard is locked")
                .font(.title2.bold())

            if controller.showsPINPad {
                SecureField("6-digit PIN", text: $pin)
                    .keyboardType(.numberPad)
                    .textContentType(.oneTimeCode)
                    .multilineTextAlignment(.center)
                    .font(.title2.monospacedDigit())
                    .frame(maxWidth: 220)
                    .textFieldStyle(.roundedBorder)
                    .focused($pinFocused)
                    .onChange(of: pin) { _, newValue in
                        if newValue.count >= PINRules.length {
                            if !controller.submitPIN(String(newValue.prefix(PINRules.length))) { pin = "" }
                        }
                    }
                    .onAppear { pinFocused = true }
                    .disabled(controller.coordinator.isPINLockedOut)
            }
            if let message = controller.message {
                Text(message)
                    .font(.footnote)
                    .foregroundStyle(.red)
                    .multilineTextAlignment(.center)
            }

            if let name = controller.coordinator.biometryName {
                Button("Unlock with \(name)") {
                    Task { await controller.unlockWithBiometrics() }
                }
                .buttonStyle(.borderedProminent)
            }
            if !controller.showsPINPad {
                Button("Use PIN") { controller.showPINPad() }
            }
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.background)
        .task {
            if controller.coordinator.biometryName != nil {
                await controller.unlockWithBiometrics()
            } else {
                controller.showPINPad()
            }
        }
    }
}

/// Hides the app's contents in the app switcher while the lock is enabled.
struct PrivacyCover: View {
    var body: some View {
        ZStack {
            Rectangle().fill(.regularMaterial)
            Image(systemName: "lock.fill")
                .font(.system(size: 44))
                .foregroundStyle(.secondary)
        }
        .ignoresSafeArea()
    }
}

/// Settings → Security.
struct SecuritySettingsSection: View {
    @AppStorage(AppLockController.enabledKey) private var lockEnabled = false
    @AppStorage(AppLockController.gracePeriodKey) private var gracePeriod: Double = 0
    @State private var showingSetPIN = false
    @State private var showingDisable = false

    private var lockBinding: Binding<Bool> {
        Binding(
            get: { lockEnabled && PINService.shared.isPINSetup },
            set: { enable in
                if enable {
                    if PINService.shared.isPINSetup { lockEnabled = true } else { showingSetPIN = true }
                } else {
                    showingDisable = true
                }
            }
        )
    }

    var body: some View {
        Section {
            Toggle(toggleTitle, isOn: lockBinding)
            if lockEnabled {
                Picker("Lock after", selection: $gracePeriod) {
                    Text("Immediately").tag(0.0)
                    Text("1 minute").tag(60.0)
                    Text("5 minutes").tag(300.0)
                    Text("15 minutes").tag(900.0)
                }
                Button("Change PIN") { showingSetPIN = true }
            }
        } header: {
            Text("Security")
        } footer: {
            Text("Locks SmartWard on launch and after it's been in the background. Your PIN is always available as a fallback, and it's required after Face ID or Touch ID enrollment changes.")
        }
        .sheet(isPresented: $showingSetPIN) {
            SetPINView { lockEnabled = true }
        }
        .sheet(isPresented: $showingDisable) {
            VerifyPINView(title: "Turn off app lock") { lockEnabled = false }
        }
    }

    private var toggleTitle: String {
        if let name = AppLockController.shared.coordinator.biometryName {
            return "Require \(name) or PIN"
        }
        return "Require PIN"
    }
}

struct SetPINView: View {
    var onSet: () -> Void

    @Environment(\.dismiss) private var dismiss
    @State private var first = ""
    @State private var second = ""
    @State private var error: String?

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    SecureField("New 6-digit PIN", text: $first)
                        .keyboardType(.numberPad)
                    SecureField("Confirm PIN", text: $second)
                        .keyboardType(.numberPad)
                } footer: {
                    Text(error ?? "Avoid repeated digits and simple runs like 123456.")
                        .foregroundStyle(error == nil ? Color.secondary : Color.red)
                }
            }
            .navigationTitle("Set PIN")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save", action: save)
                        .disabled(first.count != PINRules.length || second.count != PINRules.length)
                }
            }
        }
    }

    private func save() {
        guard PINRules.isAcceptable(first) else {
            error = "Choose 6 digits that aren't all the same or a simple run."
            return
        }
        guard first == second else {
            error = "The PINs don't match."
            return
        }
        guard PINService.shared.save(first) else {
            error = "Couldn't save the PIN to the Keychain."
            return
        }
        onSet()
        dismiss()
    }
}

struct VerifyPINView: View {
    let title: String
    var onVerified: () -> Void

    @Environment(\.dismiss) private var dismiss
    @State private var pin = ""
    @State private var message: String?

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    SecureField("Current PIN", text: $pin)
                        .keyboardType(.numberPad)
                } footer: {
                    if let message { Text(message).foregroundStyle(.red) }
                }
            }
            .navigationTitle(title)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Confirm", action: verify)
                        .disabled(pin.count != PINRules.length)
                }
            }
        }
    }

    private func verify() {
        switch AppLockController.shared.coordinator.submitPIN(pin, rebaseline: false) {
        case .unlocked, .noPIN:
            onVerified()
            dismiss()
        case .incorrect(let remaining):
            message = "Incorrect PIN. \(remaining) left."
            pin = ""
        case .lockedOut(let seconds):
            message = "Too many attempts. Try again in \(seconds) seconds."
            pin = ""
        }
    }
}
