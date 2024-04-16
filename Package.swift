// swift-tools-version: 5.10

import Foundation
import PackageDescription

let gccIncludePrefix =
    "/usr/local/playdate/gcc-arm-none-eabi-9-2019-q4-major/lib/gcc/arm-none-eabi/9.2.1"

let playdateSDKPath: String
if let path = Context.environment["PLAYDATE_SDK_PATH"] {
    playdateSDKPath = path
} else {
    playdateSDKPath = "\(Context.environment["HOME"]!)/Developer/PlaydateSDK/"
}

let package = Package(
    name: "PlaydateKitTemplate",
    platforms: [.macOS(.v14)],
    products: [.library(name: "PlaydateKitTemplate", targets: ["PlaydateKitTemplate"])],
    dependencies: [
        .package(url: "https://github.com/finnvoor/PlaydateKit.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "PlaydateKitTemplate",
            dependencies: [.product(name: "PlaydateKit", package: "PlaydateKit")],
            swiftSettings: [
                .enableExperimentalFeature("Embedded"),
                .unsafeFlags([
                    "-Xfrontend", "-disable-objc-interop",
                    "-Xfrontend", "-disable-stack-protector",
                    "-Xfrontend", "-function-sections",
                    "-Xfrontend", "-gline-tables-only",
                    "-Xcc", "-DTARGET_EXTENSION",
                    "-Xcc", "-I", "-Xcc", "\(gccIncludePrefix)/include",
                    "-Xcc", "-I", "-Xcc", "\(gccIncludePrefix)/include-fixed",
                    "-Xcc", "-I", "-Xcc", "\(gccIncludePrefix)/../../../../arm-none-eabi/include",
                    "-I", "\(playdateSDKPath)/C_API"
                ]),
            ]
        )
    ]
)
