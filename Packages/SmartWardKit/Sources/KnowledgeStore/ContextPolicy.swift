import Foundation

/// The single gate between stored content and anything sent to a BYOK
/// provider. Private-repo content is on-device only, with no override (D5):
/// every code path that assembles provider context or runs BYOK extraction
/// must go through here.
public enum ContextPolicy {

    /// Whether a chunk may appear in context sent to a BYOK provider: not
    /// private-repo content, and not a turn of an off-the-record chat (so it
    /// can't be quoted into another chat's prompt).
    public static func mayLeaveDevice(_ chunk: Chunk) -> Bool {
        !chunk.localOnly && !(chunk.article?.localOnly ?? false)
            && !(chunk.message?.conversation?.offTheRecord ?? false)
    }

    /// Whether a whole conversation turn may be quoted to a BYOK provider
    /// from another chat.
    public static func messageMayLeaveDevice(_ message: Message) -> Bool {
        !(message.conversation?.offTheRecord ?? false) && (message.chunks ?? []).allSatisfy(mayLeaveDevice)
    }

    /// `chunks` with local-only content removed, order preserved.
    public static func chunksAllowedForBYOK(_ chunks: [Chunk]) -> [Chunk] {
        chunks.filter(mayLeaveDevice)
    }

    /// Whether BYOK (rather than on-device) extraction may run for a
    /// conversation's turns. Off-the-record conversations stay on-device.
    public static func mayExtractWithBYOK(_ conversation: Conversation) -> Bool {
        !conversation.offTheRecord
    }
}
