// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "FirebaseSPM",
    platforms: [
        .iOS(.v10)
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
    ]
)
