// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SlackLogger",
    platforms: [
        .macOS(.v14),
        .iOS(.v17)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SlackLogger",
            targets: ["SlackLogger"]),
    ],
    dependencies: [
        .package(url: "https://github.com/0xpablo/SlackKit.git", revision: "360fc02cf5146183bad79ebebe9456ddbb10162d"),
        .package(url: "https://github.com/hummingbird-project/hummingbird.git", exact: "2.0.0-beta.2"), // Required for SlackKit to compile
        .package(url: "https://github.com/apple/swift-collections.git", exact: "1.1.0"), // Required for HummingbirdCore to compile
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SlackLogger",
            dependencies: [
                .product(name: "Collections", package: "swift-collections"),
                .product(name: "SlackKit", package: "SlackKit"),
                .product(name: "Hummingbird", package: "hummingbird"),
            ]
        ),
    ]
)
