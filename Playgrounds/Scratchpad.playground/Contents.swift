import HarmonyKit

let root = Note(.F, .sharp)
let scale = Scale(root, .major)
print("The \(scale.root) \(scale.type) scale is \(scale.notes)")

