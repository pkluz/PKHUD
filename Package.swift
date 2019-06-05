// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "PKHUD",
    platforms: [
        .iOS(.v8),
    ],
    products: [
        .library(
            name: "PKHUD",
            targets: ["PKHUD"]
        ),
    ],
    targets: [
        .target(
            name: "PKHUD",
            path: "PKHUD"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
