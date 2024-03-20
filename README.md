# PlaydateKitTemplate

> [!Important]
> This is a WIP. See [here](https://github.com/finnvoor/PlaydateKit/pull/5) for more info.

This is a template package for [PlaydateKit](https://github.com/finnvoor/PlaydateKit).

## How to Use
For detailed instructions on how to get started creating a game using PlaydateKit, see [here](https://github.com/finnvoor/PlaydateKit).

1. Install a nightly [Swift](https://www.swift.org/download/#snapshots) toolchain that supports the Embedded experimental feature.
2. Install the [Playdate SDK](https://play.date/dev/).
3. Create a new repository using this template.
4. (optional) Change the name of the package by renaming the product in target in `Package.swift` and renaming `Sources/PlaydateKitTemplate` to the new name.
5. Build and run directly in the simulator using Xcode, or build using the command `swift package pdc`. When run using `swift package`, the built `pdx` game file will be located at `.build/plugins/PDCPlugin/outputs/PlaydateKitTemplate.pdx` and can be opened in the Playdate simulator. 
