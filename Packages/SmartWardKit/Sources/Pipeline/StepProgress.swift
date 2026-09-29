import Foundation

/// How far along a refresh or indexing run is: `done` of `total` steps.
public struct StepProgress: Equatable, Sendable {
    public var done: Int
    public var total: Int

    public init(done: Int, total: Int) {
        self.done = done
        self.total = total
    }

    /// Whether the total is known, so a bar can show a real percentage.
    public var isDeterminate: Bool { total > 0 }

    /// Whole percent, `0...100`; 0 while the total isn't known.
    public var percent: Int {
        guard total > 0 else { return 0 }
        return min(100, max(0, done * 100 / total))
    }
}
