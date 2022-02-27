import Foundation
import Commands

public struct Shortcuts {
	/// All shortcuts, unordered
	public var shortcuts: [Shortcut] {
		return getAllShortcuts()
	}

// 	// All shortcuts, ordered in their folders
// 	public var shortcutHierarchy: [ShortcutItem] {
// 		return []
// 	}
//
// 	public func shortcutsForFolder(_ folderName: String) -> [Shortcut] {
// 		return []
// 	}

	public func runShortcut(_ shortcut: Shortcut) throws {
        let result = Commands.Bash.run("/usr/bin/shortcuts run \"\(shortcut.name)\"")

        guard result.isSuccess else {
            throw ShortcutsKitError.shortcutsCLIErrored(error: result.errorOutput)
        }
	}

	/// The default singleton for the Shortcuts Object
	public static var `default` = Shortcuts()

	private func getAllShortcuts() -> [Shortcut] {
		let results = Commands.Bash.run("/usr/bin/shortcuts list").output  // Lists all shortcuts, line by line
        let shortcuts = results.split(whereSeparator: \.isNewline).map { Shortcut(name: String($0)) }
		return shortcuts
	}
}
