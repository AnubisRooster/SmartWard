import KnowledgeStore

extension Article {
    /// How the reader and the read-aloud name where this came from: the
    /// source's title, or its kind's name when it has none.
    var sourceLabel: String? {
        source.map { $0.title.isEmpty ? $0.sourceKind.displayName : $0.title }
    }
}
