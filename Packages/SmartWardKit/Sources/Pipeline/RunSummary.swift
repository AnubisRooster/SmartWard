import Foundation

/// One line on how a background run ended, for Settings. iOS's own banner
/// only says "Task failed" and can't say why or how much got done.
public enum RunSummary {
    /// - Parameters:
    ///   - stoppedEarly: the run was cancelled: iOS ended it, or you did.
    ///   - fetch: the refresh's own summary ("5 new items · 1 source failed"),
    ///     when the run fetched.
    ///   - indexed: articles chunked and embedded during the run.
    ///   - linked: articles added to the knowledge graph during the run.
    ///   - waiting: articles still waiting to be indexed afterwards.
    public static func text(elapsed: TimeInterval, stoppedEarly: Bool, fetch: String?,
                            indexed: Int, linked: Int = 0, waiting: Int) -> String {
        var parts = [stoppedEarly ? "Stopped early after \(duration(elapsed))" : "Finished in \(duration(elapsed))"]
        if let fetch, !fetch.isEmpty { parts.append(fetch) }
        if indexed > 0 { parts.append("\(indexed) indexed") }
        if linked > 0 { parts.append("\(linked) added to the graph") }
        if waiting > 0 {
            parts.append(waiting == 1 ? "1 article waiting to be indexed" : "\(waiting) articles waiting to be indexed")
        }
        return parts.joined(separator: " · ")
    }

    static func duration(_ seconds: TimeInterval) -> String {
        seconds < 60 ? "less than a minute" : "\(Int((seconds / 60).rounded())) min"
    }
}
