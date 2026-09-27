import Foundation
import SwiftData
import KnowledgeStore

/// Every theme's decayed strength, in one pass over the mentions table
/// instead of walking each theme's mentions (PLAN §4: strength is derived
/// from mentions, never stored).
public enum ThemeStrengths {
    public struct Entry: Equatable, Sendable {
        public var strength: Double
        public var mentions: Int
    }

    @MainActor
    public static func compute(context: ModelContext, now: Date = Date(),
                               halfLife: TimeInterval = ThemeStrength.defaultHalfLife) throws -> [UUID: Entry] {
        var descriptor = FetchDescriptor<Mention>()
        descriptor.relationshipKeyPathsForPrefetching = [\.node]
        var result: [UUID: Entry] = [:]
        for mention in try context.fetch(descriptor) {
            guard let id = mention.node?.id else { continue }
            let age = max(0, now.timeIntervalSince(mention.createdAt))
            let weight = mention.confidence * pow(0.5, age / halfLife)
            var entry = result[id] ?? Entry(strength: 0, mentions: 0)
            entry.strength += weight
            entry.mentions += 1
            result[id] = entry
        }
        return result
    }
}

/// Theme strengths remembered between graph views. Decay is exponential, so
/// a cached score only needs rescaling as time passes:
/// `strength(now) = strength(then) × 0.5^((now − then) / halfLife)`. Any
/// change to the mentions or themes (a new article, a merge, a split, a
/// restore) changes the fingerprint and forces a fresh pass.
@MainActor
public final class ThemeStrengthCache {
    struct Fingerprint: Equatable {
        let mentions: Int
        let themes: Int
        let newest: Date?
    }

    private var cached: (fingerprint: Fingerprint, asOf: Date, entries: [UUID: ThemeStrengths.Entry])?
    public let halfLife: TimeInterval
    /// For tests and the developer readout.
    public private(set) var hits = 0
    public private(set) var misses = 0

    public init(halfLife: TimeInterval = ThemeStrength.defaultHalfLife) {
        self.halfLife = halfLife
    }

    public func strengths(context: ModelContext, now: Date = Date()) throws -> [UUID: ThemeStrengths.Entry] {
        let fingerprint = try Self.fingerprint(context)
        if let cached, cached.fingerprint == fingerprint, now >= cached.asOf,
           (fingerprint.newest ?? .distantPast) <= cached.asOf {
            hits += 1
            let factor = pow(0.5, now.timeIntervalSince(cached.asOf) / halfLife)
            return cached.entries.mapValues { ThemeStrengths.Entry(strength: $0.strength * factor, mentions: $0.mentions) }
        }
        misses += 1
        let entries = try ThemeStrengths.compute(context: context, now: now, halfLife: halfLife)
        cached = (fingerprint, now, entries)
        return entries
    }

    public func invalidate() {
        cached = nil
    }

    static func fingerprint(_ context: ModelContext) throws -> Fingerprint {
        var newest = FetchDescriptor<Mention>(sortBy: [SortDescriptor(\.createdAt, order: .reverse)])
        newest.fetchLimit = 1
        return Fingerprint(mentions: try context.fetchCount(FetchDescriptor<Mention>()),
                           themes: try context.fetchCount(FetchDescriptor<ThemeNode>()),
                           newest: try context.fetch(newest).first?.createdAt)
    }
}
