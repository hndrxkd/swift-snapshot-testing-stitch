// swift-tools-version:6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SnapshotTestingStitch",
    platforms: [
        .iOS(.v16),
    ],
    products: [
        .library(
            name: "SnapshotTestingStitch",
            targets: ["SnapshotTestingStitch"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing.git",
                 from: "1.18.3"),
        .package(url: "https://github.com/alexey1312/SnapshotTestingHEIC.git",
                 from: "1.5.1"),
    ],
    targets: [
        .target(
            name: "SnapshotTestingStitch",
            dependencies: [
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing"),
                .product(name: "SnapshotTestingHEIC", package: "SnapshotTestingHEIC"),
            ]
        ),
        
        .testTarget(
            name: "SnapshotTestingStitchTests",
            dependencies: ["SnapshotTestingStitch"],
            exclude: ["__Snapshots__"]
        ),
    ]
)
