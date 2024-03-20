import PlaydateKit

final class PlaydateKitTemplate: PlaydateGame {
    // MARK: Lifecycle

    init() {
        let graphics = Playdate.playdateAPI.graphics.pointee
        let sprite = Playdate.playdateAPI.sprite.pointee

        let logoBitmap = graphics.loadBitmap(StaticString("logo.png").utf8Start, nil)
        let logoSprite = sprite.newSprite()
        sprite.setImage(logoSprite, logoBitmap, .bitmapUnflipped)
        sprite.setBounds(logoSprite, .init(x: 0, y: 0, width: 400, height: 240))
        sprite.addSprite(logoSprite)
    }

    // MARK: Internal

    func update() -> Bool {
        Sprite.drawDisplayListSprites()
        System.drawFPS()
        return true
    }

    func gameWillPause() {
        System.log("Paused!")
    }
}
