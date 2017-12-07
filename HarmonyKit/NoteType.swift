import Foundation

public enum NoteType: UInt {
    case C
    case D
    case E
    case F
    case G
    case A
    case B
}

extension NoteType {
    static func +(lhs: NoteType, rhs: UInt) -> NoteType {
        let newRawValue = (lhs.rawValue + rhs) % 7
        return NoteType(rawValue: newRawValue)!
    }
    
    static postfix func ++(noteType: inout NoteType) -> NoteType {
        noteType = noteType + 1
        return noteType
    }
}

extension NoteType: CustomStringConvertible {
    public var description: String {
        switch self {
        case .C: return "C"
        case .D: return "D"
        case .E: return "E"
        case .F: return "F"
        case .G: return "G"
        case .A: return "A"
        case .B: return "B"
        }
    }
}
