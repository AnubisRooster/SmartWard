// swift-tools-version: 5.9
import PackageDescription

// Platform floors are SwiftData's minimums, not the app's (the app targets
// iOS 26). OnDeviceKit declares iOS only, so tests run on the iOS Simulator
// (see .github/workflows/ci.yml), not with `swift test` on the macOS host.
let package = Package(
    name: "SmartWardKit",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
    ],
    products: [
        .library(name: "KnowledgeStore", targets: ["KnowledgeStore"]),
        .library(name: "StrategistCore", targets: ["StrategistCore"]),
        .library(name: "IngestKit", targets: ["IngestKit"]),
        .library(name: "AppLock", targets: ["AppLock"]),
    ],
    dependencies: [
        .package(url: "https://github.com/AnubisRooster/OnDeviceKit", branch: "main"),
    ],
    targets: [
        .target(name: "KnowledgeStore"),
        .target(name: "StrategistCore",
                dependencies: [
                    "KnowledgeStore",
                    .product(name: "BYOKLLMKit", package: "OnDeviceKit"),
                ]),
        .target(name: "IngestKit", dependencies: ["KnowledgeStore"]),
        .target(name: "AppLock",
                dependencies: [
                    .product(name: "PINLockKit", package: "OnDeviceKit"),
                    .product(name: "BiometricLockKit", package: "OnDeviceKit"),
                ]),
        .testTarget(name: "KnowledgeStoreTests", dependencies: ["KnowledgeStore"]),
        .testTarget(name: "StrategistCoreTests",
                    dependencies: [
                        "StrategistCore",
                        "KnowledgeStore",
                        .product(name: "BYOKLLMKit", package: "OnDeviceKit"),
                    ]),
        .testTarget(name: "IngestKitTests", dependencies: ["IngestKit", "KnowledgeStore"]),
        .testTarget(name: "AppLockTests",
                    dependencies: [
                        "AppLock",
                        .product(name: "PINLockKit", package: "OnDeviceKit"),
                        .product(name: "BiometricLockKit", package: "OnDeviceKit"),
                    ]),
    ]
)
