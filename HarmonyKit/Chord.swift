import Foundation

public struct Chord {
    public let notes: [Note]
    let type: ChordType
    let root: Note
    
//    public init(_ root: Note, _ type: ChordType) {
//        self.root = root
//        self.type = type
//        
//        // Todo:  Notes
//        self.notes = []
//    }
    
    public init(_ notes: [Note]) {
        self.notes = notes
        self.root = notes.first!
        
        var type: ChordType = .unknown
        
        var intervals: [Interval] = []
        for index in 1...notes.count - 1 {
            intervals = intervals + [notes[index] - notes[index - 1]]
        }
        
        for chordType in ChordType.all {
            if chordType.intervals == intervals {
                type = chordType
                break
            }
        }
        
        self.type = type
    }
}

extension Chord: CustomStringConvertible {
    public var description: String {
        return "\(self.notes.first!)\(self.type.description)"
    }
}

// MARK: Helpers
public func diatonicChord(for scale: Scale, at degree: Int) -> Chord {
    let indexOfRoot = degree - 1
    
    let extendedScale = extend(for: scale, by: 7)
    
    var triad = [extendedScale[indexOfRoot]]
    
    let third = indexOfRoot + 2
    triad = triad + [extendedScale[third]]
    
    let fifth = indexOfRoot + 4
    triad = triad + [extendedScale[fifth]]
    
    return Chord(triad)
}
