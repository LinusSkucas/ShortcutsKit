import Foundation

public struct ShortcutFolder: ShortcutItem, Equatable {
	public var name: String
	public var shortcuts: [Shortcut]
}
