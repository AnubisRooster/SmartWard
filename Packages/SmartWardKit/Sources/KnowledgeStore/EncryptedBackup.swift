import Foundation
import CryptoKit
import CommonCrypto
import Security

/// A passphrase-encrypted backup of the whole library (PLAN Phase 5).
///
/// File layout: `SWBK` · format version (1 byte) · PBKDF2 iterations
/// (UInt32, big-endian) · salt (16 bytes) · AES-GCM box (nonce, ciphertext,
/// tag). The key comes from your passphrase through PBKDF2-HMAC-SHA256, the
/// payload is the `LibraryArchive` JSON compressed with LZFSE, and the
/// header is authenticated with it, so a tampered or truncated file fails to
/// open rather than restoring something else. Nothing is stored that could
/// open it without the passphrase.
public enum EncryptedBackup {
    public static let fileExtension = "smartwardbackup"
    public static let minimumPassphraseLength = 8
    /// OWASP's 2023 guidance for PBKDF2-HMAC-SHA256.
    public static let defaultIterations: UInt32 = 600_000

    static let magic = Data("SWBK".utf8)
    static let formatVersion: UInt8 = 1
    static let saltLength = 16
    static let headerLength = 4 + 1 + 4 + 16

    public enum BackupError: LocalizedError, Equatable {
        case passphraseTooShort(minimum: Int)
        case notABackup
        case newerVersion(Int)
        case wrongPassphraseOrDamaged

        public var errorDescription: String? {
            switch self {
            case .passphraseTooShort(let minimum):
                return "Use a passphrase of at least \(minimum) characters."
            case .notABackup:
                return "That file isn't a SmartWard backup."
            case .newerVersion(let version):
                return "That backup was made by a newer SmartWard (format \(version)). Update the app to restore it."
            case .wrongPassphraseOrDamaged:
                return "The passphrase is wrong, or the backup is damaged."
            }
        }
    }

    /// Encrypts `archive` with a key derived from `passphrase`.
    public static func seal(_ archive: LibraryArchive, passphrase: String,
                            iterations: UInt32 = defaultIterations) throws -> Data {
        guard passphrase.count >= minimumPassphraseLength else {
            throw BackupError.passphraseTooShort(minimum: minimumPassphraseLength)
        }
        let compressed = try (archive.encoded() as NSData).compressed(using: .lzfse) as Data
        var salt = Data(count: saltLength)
        let status = salt.withUnsafeMutableBytes { SecRandomCopyBytes(kSecRandomDefault, saltLength, $0.baseAddress!) }
        guard status == errSecSuccess else { throw CocoaError(.fileWriteUnknown) }

        var header = magic
        header.append(formatVersion)
        withUnsafeBytes(of: iterations.bigEndian) { header.append(contentsOf: $0) }
        header.append(salt)

        let key = try deriveKey(passphrase: passphrase, salt: salt, iterations: iterations)
        let box = try AES.GCM.seal(compressed, using: key, authenticating: header)
        guard let combined = box.combined else { throw CocoaError(.fileWriteUnknown) }
        return header + combined
    }

    /// Decrypts and decodes a backup made by `seal`.
    public static func open(_ data: Data, passphrase: String) throws -> LibraryArchive {
        guard data.count > headerLength, data.prefix(4) == magic else { throw BackupError.notABackup }
        let bytes = [UInt8](data.prefix(headerLength))
        let version = bytes[4]
        guard version <= formatVersion else { throw BackupError.newerVersion(Int(version)) }
        let iterations = bytes[5..<9].reduce(UInt32(0)) { $0 << 8 | UInt32($1) }
        // A file can't make opening it take forever.
        guard iterations > 0, iterations <= 10_000_000 else { throw BackupError.notABackup }
        let header = Data(bytes)
        let salt = Data(bytes[9..<headerLength])

        let key = try deriveKey(passphrase: passphrase, salt: salt, iterations: iterations)
        let compressed: Data
        do {
            let box = try AES.GCM.SealedBox(combined: Data(data.dropFirst(headerLength)))
            compressed = try AES.GCM.open(box, using: key, authenticating: header)
        } catch {
            throw BackupError.wrongPassphraseOrDamaged
        }
        guard let json = try? (compressed as NSData).decompressed(using: .lzfse) as Data else {
            throw BackupError.wrongPassphraseOrDamaged
        }
        return try LibraryArchive.decode(json)
    }

    /// PBKDF2-HMAC-SHA256 → a 256-bit key. The passphrase is normalized so
    /// the same words typed on another device give the same key.
    static func deriveKey(passphrase: String, salt: Data, iterations: UInt32) throws -> SymmetricKey {
        let password = Array(passphrase.precomposedStringWithCanonicalMapping.utf8)
        guard !password.isEmpty else { throw BackupError.wrongPassphraseOrDamaged }
        var derived = [UInt8](repeating: 0, count: 32)
        let status = salt.withUnsafeBytes { saltBytes in
            password.withUnsafeBufferPointer { passwordBytes in
                passwordBytes.baseAddress!.withMemoryRebound(to: Int8.self, capacity: password.count) { passwordPointer in
                    CCKeyDerivationPBKDF(CCPBKDFAlgorithm(kCCPBKDF2), passwordPointer, password.count,
                                         saltBytes.bindMemory(to: UInt8.self).baseAddress, salt.count,
                                         CCPseudoRandomAlgorithm(kCCPRFHmacAlgSHA256), iterations,
                                         &derived, derived.count)
                }
            }
        }
        guard status == Int32(kCCSuccess) else { throw CocoaError(.fileReadUnknown) }
        return SymmetricKey(data: derived)
    }
}
