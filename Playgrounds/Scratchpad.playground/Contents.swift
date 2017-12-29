import HarmonyKit

let root = Note(.E, .flat , 5)
//print("\(root) is MIDI value: \(root.midi)")

let scale = Scale(root, .major)
print("The \(scale) scale is \(scale.notes)")

print("")

print("The tonic chord for \(scale) is \(scale.tonicTriad): \(scale.tonicTriad.notes) which is the \(scale.type.roman[ScaleDegree.tonic.rawValue]) chord")
//print("The supertonic chord for \(scale) is \(scale.supertonicTriad): \(scale.supertonicTriad.notes) which is the \(scale.type.roman[ScaleDegree.supertonic.rawValue]) chord")
//print("The mediant chord for \(scale) is \(scale.mediantTriad): \(scale.mediantTriad.notes) which is the \(scale.type.roman[ScaleDegree.mediant.rawValue]) chord")
//print("The subdominant chord for \(scale) is \(scale.subdominantTriad): \(scale.subdominantTriad.notes) which is the \(scale.type.roman[ScaleDegree.subdominant.rawValue]) chord")
//print("The dominant chord for \(scale) is \(scale.dominantTriad): \(scale.dominantTriad.notes) which is the \(scale.type.roman[ScaleDegree.dominant.rawValue]) chord")
//print("The submedian chord for \(scale) is \(scale.submediantTriad): \(scale.submediantTriad.notes) which is the \(scale.type.roman[ScaleDegree.submediant.rawValue]) chord")
//print("The leading chord for \(scale) is \(scale.subtonicTriad): \(scale.subtonicTriad.notes) which is the \(scale.type.roman[ScaleDegree.subtonic.rawValue]) chord")

//print("")

//let cMajorChord = Chord(Note(.C, .natural, 5), .minorSeventh)
//print("\(cMajorChord) is \(cMajorChord.notes)")

