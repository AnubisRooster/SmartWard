import Foundation
import SwiftData
import IngestKit
import KnowledgeStore
import StrategistCore

/// Adding a feed from outside the Sources screen: the strategist's
/// `add_source` (after your approval) and the "Add a source" shortcut. Both
/// validate the same way: a known kind, an address that resolves, no local
/// or private hosts, and nothing you already follow.
public enum SourceIntake {
    /// Public feeds only, not repos or shared items.
    public static let kinds: [SourceKind] = [.rss, .site, .arxiv, .hn, .githubReleases, .hfPapers]

    public struct Plan: Equatable, Sendable {
        public let kind: SourceKind
        public let url: String
        public let title: String
    }

    public enum Refusal: LocalizedError, Equatable {
        case unsupportedKind(String)
        case invalidAddress(String, kind: String)
        case unsafeAddress(String)
        case alreadyFollowed

        public var errorDescription: String? {
            switch self {
            case .unsupportedKind(let kind): return "unknown kind '\(kind)'"
            case .invalidAddress(let address, let kind): return "'\(address)' isn't a valid \(kind) address"
            case .unsafeAddress(let reason): return reason
            case .alreadyFollowed: return "the user already follows this source"
            }
        }
    }

    @MainActor
    public static func plan(kind: SourceKind, address: String, title: String?, context: ModelContext) throws -> Plan {
        guard kinds.contains(kind) else { throw Refusal.unsupportedKind(kind.rawValue) }
        let address = address.trimmingCharacters(in: .whitespacesAndNewlines)
        guard address.count <= FetchURLTool.maxURLLength,
              let url = SourceEndpoint.storedAddress(kind: kind, input: address) else {
            throw Refusal.invalidAddress(address, kind: kind.rawValue)
        }
        if kind != .arxiv && kind != .hn, let web = URL(string: url) {
            do {
                _ = try FetchURLTool.validate(web.absoluteString)
            } catch {
                throw Refusal.unsafeAddress(error.localizedDescription)
            }
        }
        let key = url.lowercased()
        let rawKind = kind.rawValue
        let existing = try context.fetch(FetchDescriptor<Source>(predicate: #Predicate { $0.kind == rawKind }))
        guard !existing.contains(where: { $0.url.lowercased() == key }) else { throw Refusal.alreadyFollowed }
        let name = (title ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        return Plan(kind: kind, url: url, title: String((name.isEmpty ? address : name).prefix(80)))
    }

    /// Onboarding's proposed sources, held to the same validation as every
    /// other way of adding one: a normalized address, no local or unsafe
    /// host, nothing already followed. Ones it refuses are dropped.
    @MainActor
    public static func checked(_ proposal: OnboardingProposal, context: ModelContext) -> OnboardingProposal {
        var result = proposal
        result.sources = proposal.sources.compactMap { source in
            guard let kind = SourceKind(rawValue: source.kind),
                  let plan = try? Self.plan(kind: kind, address: source.url, title: source.title, context: context) else {
                return nil
            }
            return OnboardingProposal.SourceProposal(kind: plan.kind.rawValue, url: plan.url, title: plan.title)
        }
        return result
    }

    /// Adds an enabled source; it's fetched on the next refresh.
    @MainActor
    @discardableResult
    public static func add(_ plan: Plan, origin: String, context: ModelContext) -> Source {
        let source = Source(kind: plan.kind.rawValue, url: plan.url, title: plan.title, origin: origin)
        context.insert(source)
        return source
    }
}
