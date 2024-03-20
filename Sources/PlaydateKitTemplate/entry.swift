import PlaydateKit

/// Boilerplate entry code
nonisolated(unsafe) var game: PlaydateKitTemplate!
@_cdecl("eventHandler") func eventHandler(
    pointer: UnsafeMutableRawPointer!,
    event: System.Event,
    _: CUnsignedInt
) -> CInt {
    switch event {
    case .initialize:
        Playdate.initialize(with: pointer)
        game = PlaydateKitTemplate()
        System.updateCallback = game.update
    default: game.handle(event)
    }
    return 0
}
