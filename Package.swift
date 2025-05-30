// swift-tools-version: 6.1

import Foundation
import PackageDescription

/// Hack to force Xcode builds to not produce a dylib, since linking fails
/// without a toolset.json specified. Ideally this can be removed if/when
/// Xcode gains toolset.json support.
let xcode = (Context.environment["XPC_SERVICE_NAME"]?.count ?? 0) > 2

let package = Package(
    name: "PlaydateKitTemplate",
    platforms: [.macOS(.v14)],
    products: [.library(name: "PlaydateKitTemplate", type: xcode ? nil : .dynamic, targets: ["PlaydateKitTemplate"])],
    dependencies: [
        .package(url: "https://github.com/finnvoor/PlaydateKit.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "PlaydateKitTemplate",
            dependencies: [.product(name: "PlaydateKit", package: "PlaydateKit")],
            exclude: ["Resources"],
            swiftSettings: [
                .enableExperimentalFeature("Embedded"),
                .unsafeFlags([
                    "-whole-module-optimization",
                    "-Xfrontend", "-disable-objc-interop",
                    "-Xfrontend", "-disable-stack-protector",
                    "-Xfrontend", "-function-sections",
                    "-Xfrontend", "-gline-tables-only",
                    "-Xcc", "-DTARGET_EXTENSION"
                ]),
            ],
        )
    ]
)
