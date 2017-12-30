import HarmonyKit

let root = Note(.E, .flat , 5)
//print("\(root) is MIDI value: \(root.midi)")

let scale = Scale(root, .major)
print("The \(scale) scale is \(scale.notes)")

print("")

// long way
let tonicTriad = scale.tonicTriad
if let tonicTriadRomanName = scale.tonicTriad.romanName {
    print("The tonic chord for \(scale) is \(tonicTriad): \(tonicTriad.notes) which is the \(tonicTriadRomanName) chord")
} else {
    print("The tonic chord for \(scale) is \(tonicTriad): \(tonicTriad.notes)")
}

// shorter way
//print("The tonic chord for \(scale) is \(scale.tonicTriad): \(scale.tonicTriad.notes) which is the \(scale.tonicTriad.romanName!) chord")
print("The supertonic chord for \(scale) is \(scale.supertonicTriad): \(scale.supertonicTriad.notes) which is the \(scale.supertonicTriad.romanName!) chord")
print("The mediant chord for \(scale) is \(scale.mediantTriad): \(scale.mediantTriad.notes) which is the \(scale.mediantTriad.romanName!) chord")
print("The subdominant chord for \(scale) is \(scale.subdominantTriad): \(scale.subdominantTriad.notes) which is the \(scale.subdominantTriad.romanName!) chord")
print("The dominant chord for \(scale) is \(scale.dominantTriad): \(scale.dominantTriad.notes) which is the \(scale.dominantTriad.romanName!) chord")
print("The submedian chord for \(scale) is \(scale.submediantTriad): \(scale.submediantTriad.notes) which is the \(scale.submediantTriad.romanName!) chord")
print("The leading chord for \(scale) is \(scale.subtonicTriad): \(scale.subtonicTriad.notes) which is the \(scale.subtonicTriad.romanName!) chord")

print("")

let cMajorChord = Chord(Note(.C, .natural, 5), .minorSeventh)
print("\(cMajorChord) is \(cMajorChord.notes)")
print("\(cMajorChord) 2nd inversion is \(cMajorChord.notes(invertedBy: 2))")

