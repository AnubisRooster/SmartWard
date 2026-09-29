import Foundation

/// A short digest of one article that answers five questions, each as one or
/// two short bullets (a bullet is at most about two lines on a phone).
public struct ArticleSummary: Codable, Equatable, Sendable {
    /// The five questions, in reading order.
    public enum Question: String, CaseIterable, Codable, Sendable {
        case about, says, evidence, matters, remember

        public var title: String {
            switch self {
            case .about: return "What is this about?"
            case .says: return "What is it saying?"
            case .evidence: return "What evidence or reasoning supports it?"
            case .matters: return "Why does it matter?"
            case .remember: return "What should I remember?"
            }
        }
    }

    /// What a model returns: bullets per question, before cleaning. A missing
    /// question reads as no bullets, since model output is untrusted and noisy.
    public struct Draft: Codable, Equatable, Sendable {
        public var about: [String]
        public var says: [String]
        public var evidence: [String]
        public var matters: [String]
        public var remember: [String]

        enum CodingKeys: String, CodingKey { case about, says, evidence, matters, remember }

        public init(about: [String] = [], says: [String] = [], evidence: [String] = [],
                    matters: [String] = [], remember: [String] = []) {
            self.about = about
            self.says = says
            self.evidence = evidence
            self.matters = matters
            self.remember = remember
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            about = try container.decodeIfPresent([String].self, forKey: .about) ?? []
            says = try container.decodeIfPresent([String].self, forKey: .says) ?? []
            evidence = try container.decodeIfPresent([String].self, forKey: .evidence) ?? []
            matters = try container.decodeIfPresent([String].self, forKey: .matters) ?? []
            remember = try container.decodeIfPresent([String].self, forKey: .remember) ?? []
        }
    }

    public static let maxBulletsPerQuestion = 3
    /// About two lines on a phone.
    public static let maxBulletLength = 140

    public var about: [String]
    public var says: [String]
    public var evidence: [String]
    public var matters: [String]
    public var remember: [String]
    /// `fingerprint(of:)` the text it was written from, so an article whose
    /// text changed (its full page was loaded) gets a fresh summary.
    public var fingerprint: String
    /// Whether long text was cut, so the summary covers only its start.
    public var partial: Bool
    /// Where it was written: "On this device", or the provider and model.
    public var writtenBy: String
    public var createdAt: Date

    public init(draft: Draft, fingerprint: String, partial: Bool, writtenBy: String, createdAt: Date = Date()) {
        about = Self.clean(draft.about)
        says = Self.clean(draft.says)
        evidence = Self.clean(draft.evidence)
        matters = Self.clean(draft.matters)
        remember = Self.clean(draft.remember)
        self.fingerprint = fingerprint
        self.partial = partial
        self.writtenBy = writtenBy
        self.createdAt = createdAt
    }

    public func bullets(for question: Question) -> [String] {
        switch question {
        case .about: return about
        case .says: return says
        case .evidence: return evidence
        case .matters: return matters
        case .remember: return remember
        }
    }

    /// No question got a usable answer.
    public var isEmpty: Bool {
        Question.allCases.allSatisfy { bullets(for: $0).isEmpty }
    }

    // MARK: Cleaning

    /// Trimmed, on one line, without list markers, no duplicates, each cut to
    /// `maxBulletLength`, at most `maxBulletsPerQuestion` of them.
    static func clean(_ bullets: [String]) -> [String] {
        var seen = Set<String>()
        var result: [String] = []
        for raw in bullets {
            var text = raw.split(whereSeparator: { $0.isWhitespace }).joined(separator: " ")
            // A leading marker: "- ", "• ", "1. ", "2) ". Numbers like "2024 was" stay.
            if let marker = text.range(of: #"^(?:[-–—•*·]|\d{1,2}[.)])\s+"#, options: .regularExpression) {
                text.removeSubrange(marker)
            }
            text = limited(text)
            guard text.contains(where: { $0.isLetter || $0.isNumber }) else { continue }
            guard seen.insert(text.lowercased()).inserted else { continue }
            result.append(text)
            if result.count == maxBulletsPerQuestion { break }
        }
        return result
    }

    /// `text` cut at a word to fit `maxBulletLength`, with an ellipsis.
    static func limited(_ text: String) -> String {
        guard text.count > maxBulletLength else { return text }
        let head = text.prefix(maxBulletLength - 1)
        let cut = head.lastIndex(of: " ").map { head[..<$0] } ?? head
        return cut.trimmingCharacters(in: CharacterSet(charactersIn: " ,;:.-–—")) + "…"
    }

    // MARK: Saving

    /// A short stable fingerprint of `text` (FNV-1a), to tell when it changed.
    public static func fingerprint(of text: String) -> String {
        var hash: UInt64 = 14_695_981_039_346_656_037
        for byte in text.utf8 { hash = (hash ^ UInt64(byte)) &* 1_099_511_628_211 }
        return String(hash, radix: 16)
    }

    public func encoded() throws -> String {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        return String(decoding: try encoder.encode(self), as: UTF8.self)
    }

    public static func decode(_ json: String) -> ArticleSummary? {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try? decoder.decode(ArticleSummary.self, from: Data(json.utf8))
    }
}
