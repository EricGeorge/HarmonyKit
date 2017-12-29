import HarmonyKit

let root = Note(.E, .flat , 5)
print("\(root) is MIDI value: \(root.midi)")

let scale = Scale(root, .major)
print("The \(scale.root) \(scale.type) scale is \(scale.notes)")

print("\n")

print("The tonic chord for \(scale.root) \(scale.type) is \(scale.tonicTriad): \(scale.tonicTriad.notes) which is the \(scale.type.roman[ScaleDegree.tonic.rawValue]) chord")
print("The supertonic chord for \(scale.root) \(scale.type) is \(scale.supertonicTriad): \(scale.supertonicTriad.notes) which is the \(scale.type.roman[ScaleDegree.supertonic.rawValue]) chord")
print("The mediant chord for \(scale.root) \(scale.type) is \(scale.mediantTriad): \(scale.mediantTriad.notes) which is the \(scale.type.roman[ScaleDegree.mediant.rawValue]) chord")
print("The subdominant chord for \(scale.root) \(scale.type) is \(scale.subdominantTriad): \(scale.subdominantTriad.notes) which is the \(scale.type.roman[ScaleDegree.subdominant.rawValue]) chord")
print("The dominant chord for \(scale.root) \(scale.type) is \(scale.dominantTriad): \(scale.dominantTriad.notes) which is the \(scale.type.roman[ScaleDegree.dominant.rawValue]) chord")
print("The submedian chord for \(scale.root) \(scale.type) is \(scale.submedianTriad): \(scale.submedianTriad.notes) which is the \(scale.type.roman[ScaleDegree.submedian.rawValue]) chord")
print("The leading chord for \(scale.root) \(scale.type) is \(scale.leadingTriad): \(scale.leadingTriad.notes) which is the \(scale.type.roman[ScaleDegree.leading.rawValue]) chord")

print("\n")

let cMajorChord = Chord(Note(.C, .natural, 5), .minorSeventh)
print("\(cMajorChord) is \(cMajorChord.notes)")
