import HarmonyKit

let root = Note(.E, .flat , 5)
print("\(root) is MIDI value: \(root.midi)")

let scale = Scale(root, .major)
print("The \(scale) scale is \(scale.notes)")

print("")

for degree in ScaleDegree.all {
    let triad = scale.diatonicTriad(for: degree)
    print("The \(degree) chord for \(scale) is \(triad): \(triad.notes) which is the \(triad.romanName!) chord")
}

print("")

for extendedChordType in ChordType.all {
    let chord = Chord(root, extendedChordType)
    print("\(chord) is \(chord.notes)")
    print("--- 2nd inversion is \(chord.notes(invertedBy: 2))")
    print("")
}
