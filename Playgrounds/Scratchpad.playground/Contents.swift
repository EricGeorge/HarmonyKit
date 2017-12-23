import HarmonyKit

let root = Note(.F, .natural , 5)
print("\(root) is MIDI value: \(root.midi)")

let scale = Scale(root, .major)
print("The \(scale.root) \(scale.type) scale is \(scale.notes)")

print("\n")

print("The tonic chord for \(scale.root) \(scale.type) is \(scale.tonic): \(scale.tonic.notes)")
print("The supertonic chord for \(scale.root) \(scale.type) is \(scale.supertonic): \(scale.supertonic.notes)")
print("The mediant chord for \(scale.root) \(scale.type) is \(scale.mediant): \(scale.mediant.notes)")
print("The subdominant chord for \(scale.root) \(scale.type) is \(scale.subdominant): \(scale.subdominant.notes)")
print("The dominant chord for \(scale.root) \(scale.type) is \(scale.dominant): \(scale.dominant.notes)")
print("The submedian chord for \(scale.root) \(scale.type) is \(scale.submedian): \(scale.submedian.notes)")
print("The leading chord for \(scale.root) \(scale.type) is \(scale.leading): \(scale.leading.notes)")

