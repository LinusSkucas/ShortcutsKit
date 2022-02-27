import Foundation
import Commands

public struct Shortcuts {
	/// All shortcuts, unordered
	public var shortcuts: [Shortcut] {
		return getAllShortcuts()
	}

	// All shortcuts, ordered in their folders
	public var shortcutHierarchy: [ShortcutItem] {
		return []
	}

	public func shortcutsForFolder(_ folderName: String) -> [Shortcut] {
		return []
	}

	/// The default singleton for the Shortcuts Object
	public static var `default` = Shortcuts()

	private func getAllShortcuts() -> [Shortcut] {
		let results = Commands.Bash.run("/usr/bin/shortcuts list").output  // Lists all shortcuts, line by line
        let shortcuts = results.split(whereSeparator: \.isNewline).map { Shortcut(name: String($0)) }
		return shortcuts
	}
}
