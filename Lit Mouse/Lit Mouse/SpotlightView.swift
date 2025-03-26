import Cocoa

class SpotlightView: NSView {
    var spotlightCenter: CGPoint = NSEvent.mouseLocation
    let spotlightRadius: CGFloat = 100

    override func draw(_ dirtyRect: NSRect) {
        guard let context = NSGraphicsContext.current?.cgContext else { return }

        // Fill the entire screen with a semi-transparent black
        context.setFillColor(NSColor.black.withAlphaComponent(0.6).cgColor)
        context.fill(bounds)

        // Create spotlight circle
        let spotlightRect = CGRect(
            x: spotlightCenter.x - spotlightRadius,
            y: spotlightCenter.y - spotlightRadius,
            width: spotlightRadius * 2,
            height: spotlightRadius * 2
        )

        context.setBlendMode(.clear)
        context.fillEllipse(in: spotlightRect)
        context.setBlendMode(.normal)
    }

    func updateSpotlightCenter(to point: CGPoint) {
        self.spotlightCenter = convertFromScreenCoordinates(point)
        self.setNeedsDisplay(self.frame)
        self.displayIfNeeded()
    }

    private func convertFromScreenCoordinates(_ point: CGPoint) -> CGPoint {
        guard let window = self.window else { return point }
        let windowPoint = window.convertFromScreen(NSRect(origin: point, size: .zero)).origin
        return self.convert(windowPoint, from: nil)
    }
}
