// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DBChooser",
    products: [
        .library(
            name: "DBChooser",
            targets: ["DBChooser"]),
    ],
    targets: [
        .target(
            name: "DBChooser",
            dependencies: [],
            path: "Sources",
            publicHeadersPath: "include"
        )
    ]
)
