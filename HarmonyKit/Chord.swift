import Foundation

public func chordName(for chord: [Note]) -> String {
    var intervals: [Interval] = []
    var chordName: String = ""
    
    for index in 1...chord.count - 1 {
        intervals = intervals + [chord[index] - chord[index - 1]]
    }
    
    for chordType in ChordType.all {
        if chordType.intervals == intervals {
            chordName = chordType.description
        }
    }
    
    return chordName
}

public func diatonicChord(for scale: Scale, at degree: Int) -> [Note] {
    let indexOfRoot = degree - 1
    
    let extendedScale = extend(for: scale, by: 7)
    
    var triad = [extendedScale[indexOfRoot]]
    
    let third = indexOfRoot + 2
    triad = triad + [extendedScale[third]]
    
    let fifth = indexOfRoot + 4
    triad = triad + [extendedScale[fifth]]
    
    return triad
}
