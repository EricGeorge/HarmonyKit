import HarmonyKit

let root = Note(.F, .natural , 5)
print("\(root) is MIDI value: \(root.midi)")

let scale = Scale(root, .major)
print("The \(scale.root) \(scale.type) scale is \(scale.notes)")

let extendedScale = extend(for: scale, by: 7)

for index in 1...scale.notes.count {
    let triad = diatonicChord(for: scale, at: index)
    print("The degree \(index) diatonic chord for \(scale.root) \(scale.type) is \(triad)")
}

