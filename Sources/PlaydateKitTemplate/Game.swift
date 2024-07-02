import PlaydateKit

// MARK: - Game

final class Game: PlaydateGame {
    // MARK: Lifecycle

    init() {
        logo.addToDisplayList()
    }

    // MARK: Internal

    let logo = Logo()

    func update() -> Bool {
        Sprite.updateAndDrawDisplayListSprites()
        System.drawFPS()
        return true
    }

    func gameWillPause() {
        print("Paused!")
    }
}

// MARK: - Logo

class Logo: Sprite.Sprite {
    // MARK: Lifecycle

    override init() {
        super.init()
        image = try! Graphics.Bitmap(path: "logo.png")
        bounds = .init(x: 0, y: 0, width: 400, height: 240)
    }

    // MARK: Internal

    override func update() {
        moveBy(dx: 0, dy: sinf(System.elapsedTime * 4))
    }
}
