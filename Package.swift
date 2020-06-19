// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "FirebaseSPM",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "FirebaseSPM",
            targets: ["FirebaseSPM"]
        )
    ],
    targets: [
        .target(
            name: "FirebaseSPM",
            dependencies: [],
            path: "Sources"
        ),
    ],
    swiftLanguageVersions: [
        .version("5.1")
    ]
)
