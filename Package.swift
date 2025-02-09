// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CorpsFoundation",
    products: [
        .library(name: "CorpsFoundation", targets: ["CorpsFoundation"]),
        .library(name: "CorpsCollections", targets: ["CorpsCollections"]),
    ],
    targets: [
        .target(
            name: "CorpsCollections"
        ),
        .target(
            name: "CorpsFoundation",
            dependencies: [
                "CorpsCollections",
            ]
        ),
//        .testTarget(
//            name: "CorpsFoundationTests",
//            dependencies: ["CorpsFoundation"]
//        ),
    ]
)
