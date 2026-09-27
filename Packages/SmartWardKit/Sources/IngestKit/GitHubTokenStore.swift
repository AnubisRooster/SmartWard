import Foundation
import Security

/// The GitHub token lives only in this device's Keychain: never synced to
/// iCloud Keychain, never in backups or SwiftData (PLAN §5.7).
public struct GitHubTokenStore: Sendable {
    public static let shared = GitHubTokenStore()

    private let service: String
    private let account = "github_token"

    public init(service: String = (Bundle.main.bundleIdentifier ?? "SmartWard") + ".github") {
        self.service = service
    }

    public func token() -> String? {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account,
            kSecReturnData: true,
            kSecMatchLimit: kSecMatchLimitOne,
        ]
        var result: AnyObject?
        guard SecItemCopyMatching(query as CFDictionary, &result) == errSecSuccess,
              let data = result as? Data,
              let token = String(data: data, encoding: .utf8),
              !token.isEmpty else { return nil }
        return token
    }

    /// Saves `token`, or deletes the stored one when `nil` or empty.
    @discardableResult
    public func setToken(_ token: String?) -> Bool {
        let base: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account,
        ]
        SecItemDelete(base as CFDictionary)
        guard let token, !token.isEmpty else { return true }

        var attributes = base
        attributes[kSecValueData] = Data(token.utf8)
        attributes[kSecAttrAccessible] = kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly
        attributes[kSecAttrSynchronizable] = false
        return SecItemAdd(attributes as CFDictionary, nil) == errSecSuccess
    }
}
