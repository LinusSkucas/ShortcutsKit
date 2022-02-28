# ShortcutsKit

Easily run shortcuts, from your app!

## The `Shortcut` Object
The `Shortcut` object provides all the information ShortcutsKit needs to run it.

```swift
import ShortcutsKit
let shortcut = Shortcut(name: "Shortcut Name!")  // Initialize
print(shortcut.name)  // Access Name
```

## List Shortcuts
Quickly list all the shortcuts on a Mac by accessing the property `shortcuts`. Returns an array of `Shortcut`s.

```swift
import ShortcutsKit
let shortcuts = Shortcuts.default.shortcuts
```

## Run Shortcuts
Finally, the thing you've been waiting for: Running shortcuts.

> 👉 Important note 👈 `runShortcut` blocks until the shortcut is finished running.

```swift
import ShortcutsKit
let shortcut = Shortcut(name: "Name")  // Initialize
Shortcuts.default.runShortcut(shortcut)  // Run the shortcut
```
