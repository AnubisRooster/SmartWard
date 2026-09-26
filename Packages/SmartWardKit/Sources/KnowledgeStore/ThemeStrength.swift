import Foundation

/// Node strength is derived from mentions rather than stored (PLAN §4): each
/// mention contributes its confidence, decayed exponentially by age. Two
/// devices that add mentions offline therefore agree after sync with no merge.
public enum ThemeStrength {
    public static let defaultHalfLife: TimeInterval = 90 * 24 * 60 * 60

    /// Sum over mentions of `confidence × 0.5^(age / halfLife)`. Mentions
    /// dated in the future count at full weight.
    public static func score(mentions: [(confidence: Double, createdAt: Date)],
                             now: Date = Date(),
                             halfLife: TimeInterval = defaultHalfLife) -> Double {
        guard halfLife > 0 else { return 0 }
        return mentions.reduce(0) { total, mention in
            let age = max(0, now.timeIntervalSince(mention.createdAt))
            return total + mention.confidence * pow(0.5, age / halfLife)
        }
    }

    public static func score(of node: ThemeNode,
                             now: Date = Date(),
                             halfLife: TimeInterval = defaultHalfLife) -> Double {
        score(mentions: (node.mentions ?? []).map { (confidence: $0.confidence, createdAt: $0.createdAt) },
              now: now, halfLife: halfLife)
    }
}
