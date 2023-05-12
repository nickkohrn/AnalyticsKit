// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AnalyticsKit",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "AnalyticsKit",
            targets: ["AnalyticsKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture.git", .upToNextMajor(from: "0.0.0")),
        .package(url: "https://github.com/TelemetryDeck/SwiftClient.git", .upToNextMajor(from: "1.4.3")),
    ],
    targets: [
        .target(
            name: "AnalyticsKit",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "TelemetryClient", package: "swiftclient"),
            ]),
        .testTarget(
            name: "AnalyticsKitTests",
            dependencies: ["AnalyticsKit"]),
    ]
)
