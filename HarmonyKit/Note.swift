import Foundation

public typealias Notes = [Note]

public struct Note {
    let name: LetterName
    let accidental: Accidental
    let octave: Int
    
    public var midi: Int {
        return self.chromaticValue + (octave + 2) * 12
    }
    
    public init(_ name: LetterName, _ accidental: Accidental, _ octave: Int) {
        self.name = name
        self.accidental = accidental
        self.octave = octave
    }
    
    var chromaticValue: Int {
        var noteValue = 0
        
        // halfsteps from C which is reference 0
        switch (name) {
        case .C: noteValue = 0
        case .D: noteValue =  2
        case .E: noteValue =  4
        case .F: noteValue =  5
        case .G: noteValue =  7
        case .A: noteValue =  9
        case .B: noteValue =  11
        }
        
        // adjust for accidental
        return noteValue + accidental.rawValue
    }
}

extension Note {
    static func -(lhs: Note, rhs: Note) -> Interval {
        var lhs = lhs.chromaticValue
        if lhs < rhs.chromaticValue {
            lhs += 12
        }
        return Interval(rawValue: lhs - rhs.chromaticValue)!
    }
}

extension Note: CustomStringConvertible {
    public var description: String {
        return "\(name.description)\(accidental.description(true))"
//        return "\(name.description)\(accidental.description(true))\(octave)"
    }
}

// MARK: Helpers
// TODO - Need to generalize the octave math someplace
func nextNatural(_ note: Note) -> Note {
    return Note((note.name + 1), .natural, (note.name == .B) ? (note.octave + 1) : note.octave)
}
