// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UnderwaterMetalLibLoader",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(
            name: "UnderwaterMetalLibLoader",
            targets: ["UnderwaterMetalLibLoader"]),
    ],
    targets: [
        .target(
            name: "UnderwaterMetalLibLoader",
            dependencies: []),
        .testTarget(
            name: "UnderwaterMetalLibLoaderTests",
            dependencies: ["UnderwaterMetalLibLoader"]),
    ]
)
