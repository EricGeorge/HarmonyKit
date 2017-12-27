import HarmonyKit

let root = Note(.F, .natural , 5)
print("\(root) is MIDI value: \(root.midi)")

let scale = Scale(root, .major)
print("The \(scale.root) \(scale.type) scale is \(scale.notes)")

print("\n")

print("The tonic chord for \(scale.root) \(scale.type) is \(scale.tonicTriad): \(scale.tonicTriad.notes)")
print("The supertonic chord for \(scale.root) \(scale.type) is \(scale.supertonicTriad): \(scale.supertonicTriad.notes)")
print("The mediant chord for \(scale.root) \(scale.type) is \(scale.mediantTriad): \(scale.mediantTriad.notes)")
print("The subdominant chord for \(scale.root) \(scale.type) is \(scale.subdominantTriad): \(scale.subdominantTriad.notes)")
print("The dominant chord for \(scale.root) \(scale.type) is \(scale.dominantTriad): \(scale.dominantTriad.notes)")
print("The submedian chord for \(scale.root) \(scale.type) is \(scale.submedianTriad): \(scale.submedianTriad.notes)")
print("The leading chord for \(scale.root) \(scale.type) is \(scale.leadingTriad): \(scale.leadingTriad.notes)")

print("Alternative way of getting scale degree: \(ScaleDegree.dominant.appliedTo(scale))")

print("\n")

let cMajorChord = Chord(Note(.C, .natural, 5), .minorSeventh)
print("\(cMajorChord) is \(cMajorChord.notes)")
