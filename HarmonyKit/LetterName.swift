import Foundation

public enum LetterName: UInt {
    case C
    case D
    case E
    case F
    case G
    case A
    case B
}

extension LetterName {
    static func +(lhs: LetterName, rhs: UInt) -> LetterName {
        let newRawValue = (lhs.rawValue + rhs) % 7
        return LetterName(rawValue: newRawValue)!
    }
}

extension LetterName: CustomStringConvertible {
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
