import SwiftUI
import UIKit

/// Shows the lock screen and the app-switcher privacy cover in their own
/// window, above everything else the app presents. An overlay on the root
/// view sits underneath sheets and full-screen covers, so Settings, a
/// theme's detail or the brief editor, left open, would stay visible and
/// usable over the lock.
@MainActor
enum LockWindow {
    private static var window: UIWindow?

    static func update(isLocked: Bool, isObscured: Bool) {
        guard isLocked || isObscured else {
            hide()
            return
        }
        if window == nil {
            guard let scene = activeScene() else { return }
            let window = UIWindow(windowScene: scene)
            window.windowLevel = .alert + 1
            let host = UIHostingController(rootView: LockOverlay())
            host.view.backgroundColor = .clear
            window.rootViewController = host
            self.window = window
        }
        window?.isHidden = false
        // The PIN pad needs the keyboard; the privacy cover only has to be seen.
        if isLocked { window?.makeKey() }
    }

    private static func hide() {
        guard let window else { return }
        let scene = window.windowScene
        window.isHidden = true
        self.window = nil
        scene?.windows.first { !$0.isHidden && $0.windowLevel == .normal }?.makeKey()
    }

    private static func activeScene() -> UIWindowScene? {
        let scenes = UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }
        return scenes.first { $0.activationState == .foregroundActive }
            ?? scenes.first { $0.activationState == .foregroundInactive }
            ?? scenes.first
    }
}

private struct LockOverlay: View {
    @State private var lock = AppLockController.shared

    var body: some View {
        if lock.isLocked {
            LockScreen()
        } else {
            PrivacyCover()
        }
    }
}
