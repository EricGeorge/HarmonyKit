import Foundation

public struct Note: CustomStringConvertible {
    let noteType: NoteType
    let accidental: Accidental
    
    public init(_ noteType: NoteType, _ accidental: Accidental) {
        self.noteType = noteType
        self.accidental = accidental
    }
    
    var value: Int {
        switch (noteType, accidental) {
        case (.B, .sharp): return 0
        case (.C, .natural): return 0
        case (.C, .sharp): return 1
        case (.D, .flat): return 1
        case (.D, .natural): return 2
        case (.D, .sharp): return 3
        case (.E, .flat): return 3
        case (.E, .natural): return 4
        case (.F, .flat): return 4
        case (.E, .sharp): return 5
        case (.F, .natural): return 5
        case (.F, .sharp): return 6
        case (.G, .flat): return 6
        case (.G, .natural): return 7
        case (.G, .sharp): return 8
        case (.A, .flat): return 8
        case (.A, .natural): return 9
        case (.A, .sharp): return 10
        case (.B, .flat): return 10
        case (.B, .natural): return 11
        case (.C, .flat): return 11
        }
    }
    
    static func -(lhs: Note, rhs: Note) -> Interval {
        var lhs = lhs.value
        if lhs < rhs.value {
            lhs += 12
        }
        return Interval(rawValue: lhs - rhs.value)!
    }
    
    public var description: String {
        return "\(noteType.description)\(accidental.description(true))"
    }
}


