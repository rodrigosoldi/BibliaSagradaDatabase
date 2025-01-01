// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BibliaSagradaDatabase",
    platforms: [
        .macOS(.v13),
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "BibliaSagradaDatabase",
            targets: ["BibliaSagradaDatabase"]),
    ],
    dependencies: [
        .package(url: "https://github.com/realm/realm-swift.git", from: "20.0.0"),
    ],
    targets: [
        .target(
            name: "BibliaSagradaDatabase",
            dependencies: [
                .product(name: "RealmSwift", package: "realm-swift")
            ],
            resources: [
                .copy("resources/database.realm")
            ]
        ),
        .testTarget(
            name: "BibliaSagradaDatabaseTests",
            dependencies: ["BibliaSagradaDatabase"]
        ),
    ]
)
