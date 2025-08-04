// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "crowd-connected-sdk-swift-spm",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(name: "CrowdConnectedCore", targets: ["CrowdConnectedCore"]),
        .library(name: "CrowdConnectedCoreBluetooth", targets: ["CrowdConnectedCoreBluetooth"]),
        .library(name: "CrowdConnectedGeo", targets: ["CrowdConnectedGeo"]),
        .library(name: "CrowdConnectedIPS", targets: ["CrowdConnectedIPS"]),
        .library(name: "CrowdConnectedShared", targets: ["CrowdConnectedShared"])
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        // Binary targets for xcframeworks
        .binaryTarget(
            name: "CrowdConnectedShared",
            path: "CrowdConnectedShared.xcframework"),
        .binaryTarget(
            name: "CrowdConnectedCore",
            path: "CrowdConnectedCore.xcframework"),
        .binaryTarget(
            name: "CrowdConnectedCoreBluetooth",
            path: "CrowdConnectedCoreBluetooth.xcframework"),
        .binaryTarget(
            name: "CrowdConnectedGeo",
            path: "CrowdConnectedGeo.xcframework"),
        .binaryTarget(
            name: "CrowdConnectedIPS",
            path: "CrowdConnectedIPS.xcframework"),

    ]
)
