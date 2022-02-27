import XCTest
@testable import ShortcutsKit

final class ShortcutsKitTests: XCTestCase {
    /// Test that ShortcutsKit is able to fetch shortcuts, by testing whether it returns a shortcut
    func testUnorderedShortcuts() {
        let shortcuts = Shortcuts.default.shortcuts

        XCTAssertTrue(shortcuts.contains(Shortcut(name: "ShortcutsKit Tester")))
    }
    
    /// Test that ShortcutsKit is able to run shortcuts
    func testRunningShortcut() {
        let testShortcut = Shortcut(name: "ShortcutsKit Testesr")
        
        XCTAssertNoThrow(try Shortcuts.default.runShortcut(testShortcut))
    }
}
