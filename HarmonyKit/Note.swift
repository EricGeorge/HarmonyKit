import Foundation

/** A note is abstract and does not have any octave/midi context.  It is for descriptions of scales and chords and represents one of the 12 chromatic notes
 */
public struct Note {
    let name: LetterName
    let accidental: Accidental
    
    public init(_ name: LetterName, _ accidental: Accidental) {
        self.name = name
        self.accidental = accidental
    }
    
    var value: Int {
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
    public static func -(lhs: Note, rhs: Note) -> Interval {
        var lhs = lhs.value
        if lhs < rhs.value {
            lhs += 12
        }
        return Interval(rawValue: lhs - rhs.value)!
    }
}

extension Note: CustomStringConvertible {
    public var description: String {
        return "\(name.description)\(accidental.description(true))"
    }
}

