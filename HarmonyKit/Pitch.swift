import Foundation

/** A pitch is a note that has octave and midi context and can be played via midi
 */
public struct Pitch {
    let note: Note
    
    public init(_ name: LetterName, _ accidental: Accidental) {
        self.note = Note(name, accidental)
    }
}

extension Pitch {
    var name: LetterName {
        return note.name
    }
}

extension Pitch {
    public static func -(lhs: Pitch, rhs: Pitch) -> Interval {
        var lhs = lhs.note.value
        if lhs < rhs.note.value {
            lhs += 12
        }
        return Interval(rawValue: lhs - rhs.note.value)!
    }
}

extension Pitch: CustomStringConvertible {
    public var description: String {
        return note.description
    }
}


