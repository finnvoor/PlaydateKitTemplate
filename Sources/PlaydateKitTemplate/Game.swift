import PlaydateKit

final class Game: PlaydateGame {
    // MARK: Lifecycle

    init() {
        logoSprite.image = try! Graphics.Bitmap(path: "logo.png")
        logoSprite.bounds = .init(x: 0, y: 0, width: 400, height: 240)
        logoSprite.addToDisplayList()
    }

    // MARK: Internal

    let logoSprite = Sprite.Sprite()

    func update() -> Bool {
        Sprite.drawDisplayListSprites()
        System.drawFPS()
        return true
    }

    func gameWillPause() {
        System.log("Paused!")
    }
}
