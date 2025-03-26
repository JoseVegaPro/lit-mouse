import Cocoa

class SpotlightWindow: NSPanel {
    override var canBecomeKey: Bool {
        return false
    }

    init(screen: NSScreen) {
        let screenFrame = screen.frame
        super.init(
            contentRect: screenFrame,
            styleMask: [.borderless, .nonactivatingPanel],
            backing: .buffered,
            defer: false
        )

        self.isOpaque = false
        self.backgroundColor = .clear
        self.level = .screenSaver
        self.ignoresMouseEvents = true
        self.collectionBehavior = [.canJoinAllSpaces, .fullScreenAuxiliary, .stationary, .ignoresCycle]

        self.contentView = SpotlightView(frame: screenFrame)
        self.contentView?.wantsLayer = true
    }

    func updateSpotlight(at point: CGPoint) {
        (self.contentView as? SpotlightView)?.updateSpotlightCenter(to: point)
    }
}
