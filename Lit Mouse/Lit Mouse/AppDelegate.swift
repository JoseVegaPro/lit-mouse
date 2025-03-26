import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
    var spotlightWindow: SpotlightWindow?

    func applicationDidFinishLaunching(_ notification: Notification) {
        if let screen = NSScreen.main {
            spotlightWindow = SpotlightWindow(screen: screen)
            spotlightWindow?.makeKeyAndOrderFront(nil)

            Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
                let mouseLocation = NSEvent.mouseLocation
                self.spotlightWindow?.updateSpotlight(at: mouseLocation)
            }
        }
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
}
