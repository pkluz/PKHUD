// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PKHUD",
    platforms: [
        .iOS(.v9),
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
            path: "PKHUD",
            exclude: [
                "Info.plist",
            ],
            resources: [
                .process("Images.xcassets")
            ]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
