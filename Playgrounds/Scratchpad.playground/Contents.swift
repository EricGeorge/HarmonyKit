import HarmonyKit

let root = Note(.A, .sharp, 5)
print("\(root) is MIDI value: \(root.midi)")

let scale = Scale(root, .dorian)
print("The \(scale.root) \(scale.type) scale is \(scale.notes)")

