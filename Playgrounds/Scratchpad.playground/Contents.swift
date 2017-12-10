import HarmonyKit

let root = Note(.A, .flat, 5)
print("\(root) is MIDI value: \(root.midi)")

let scale = Scale(root, .major)
print("The \(scale.root) \(scale.type) scale is \(scale.notes)")

