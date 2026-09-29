import Foundation

/// How a source's last failure is saved and shown: what went wrong, and what
/// to do about it. The two are saved together in `Source.lastError` (message,
/// then the hint on its own line), so backups and older data keep working.
public enum SourceHealth {
    /// What to do about `error`, or `nil` when there's nothing useful to add.
    public static func hint(for error: Error) -> String? {
        if let error = error as? IngestError { return error.recoverySuggestion }
        guard let urlError = error as? URLError else { return nil }
        switch urlError.code {
        case .notConnectedToInternet, .networkConnectionLost, .dataNotAllowed:
            return "You're offline, or the connection dropped. SmartWard tries again on the next refresh."
        case .timedOut:
            return "The site took too long to answer. SmartWard tries again on the next refresh."
        case .cannotFindHost, .dnsLookupFailed:
            return "The site's address doesn't exist. Check it for a typo."
        case .secureConnectionFailed, .serverCertificateUntrusted, .serverCertificateHasBadDate,
             .serverCertificateNotYetValid, .serverCertificateHasUnknownRoot:
            return "The site's security certificate isn't valid, so SmartWard won't connect. Try its https address, or remove this source."
        default:
            return nil
        }
    }

    /// What's saved as a source's last error: the message, then the hint.
    public static func stored(_ error: Error) -> String {
        let message = (error as? LocalizedError)?.errorDescription ?? error.localizedDescription
        guard let hint = hint(for: error) else { return message }
        return "\(message)\n\(hint)"
    }

    /// The message and the hint of a saved last error (older ones have no hint).
    public static func split(_ stored: String) -> (message: String, hint: String?) {
        guard let newline = stored.firstIndex(of: "\n") else { return (stored, nil) }
        let hint = stored[stored.index(after: newline)...].trimmingCharacters(in: .whitespacesAndNewlines)
        return (String(stored[..<newline]), hint.isEmpty ? nil : hint)
    }

    /// One line naming the sources that couldn't refresh, or `nil` when none.
    public static func summary(failing titles: [String]) -> String? {
        switch titles.count {
        case 0: return nil
        case 1: return "Couldn't refresh \(titles[0])"
        case 2: return "Couldn't refresh \(titles[0]) and \(titles[1])"
        default: return "Couldn't refresh \(titles[0]), \(titles[1]) and \(titles.count - 2) more"
        }
    }
}
