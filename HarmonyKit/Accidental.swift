import Foundation

public enum Accidental: Int {
    case doubleFlat = -2
    case flat = -1
    case natural = 0
    case sharp = 1
    case doubleSharp = 2
}

// TODO - deal with boundary issues
extension Accidental {
    static func +(lhs: Accidental, rhs: Accidental) -> Accidental {
        return Accidental(rawValue: lhs.rawValue + rhs.rawValue)!
    }
}

extension Accidental: CustomStringConvertible {
    public var description: String {
        switch self {
        case .doubleFlat:
            return "𝄫"
        case .flat:
            return "♭"
        case .natural:
            return "♮"
        case .sharp:
            return "♯"
        case .doubleSharp:
            return "𝄪"
        }
    }
    
    func description(_ stripNatural: Bool) -> String {
        switch self {
        case .natural:
            return stripNatural ? "" : description
        default:
            return description
        }
    }

}

