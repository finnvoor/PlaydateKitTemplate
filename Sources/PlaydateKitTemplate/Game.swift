import PlaydateKit

final class Game: PlaydateGame {
    // MARK: Lifecycle

    init() {
        logoSprite.addToDisplayList()
    }

    // MARK: Internal

    let logoBitmap = Graphics.Bitmap(path: "logo.png")
    lazy var logoSprite: Sprite.Sprite = {
        let sprite = Sprite.Sprite()
        sprite.setImage(logoBitmap)
        sprite.bounds = .init(x: 0, y: 0, width: 400, height: 240)
        return sprite
    }()

    func update() -> Bool {
        Sprite.drawDisplayListSprites()
        System.drawFPS()
        return true
    }

    func gameWillPause() {
        System.log("Paused!")
    }
}
