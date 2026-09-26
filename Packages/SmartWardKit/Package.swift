// swift-tools-version: 5.9
import PackageDescription

// Platform floors are SwiftData's minimums, not the app's (the app targets
// iOS 26). Keeping them low lets `swift test` run on any macOS 14+ CI host.
let package = Package(
    name: "SmartWardKit",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
    ],
    products: [
        .library(name: "KnowledgeStore", targets: ["KnowledgeStore"]),
    ],
    targets: [
        .target(name: "KnowledgeStore"),
        .testTarget(name: "KnowledgeStoreTests", dependencies: ["KnowledgeStore"]),
    ]
)
