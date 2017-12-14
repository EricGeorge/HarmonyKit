import Foundation

public enum ChordType {
    case major
    case minor
    case diminished
    case augmented
    case unknown
    
    public static let all:[ChordType] = [.major, minor, .diminished, .augmented]
    
    var intervals: [Interval] {
        switch self {
        case .major: return [.M3, .m3]
        case .minor: return [.m3, .M3]
        case .diminished: return [.m3, .m3]
        case .augmented: return [.M3, .M3]
        case .unknown: return []
        }
    }
}

extension ChordType : CustomStringConvertible {
    public var description: String {
        switch self {
        case .major: return "M"
        case .minor: return "m"
        case .diminished: return "°"
        case .augmented: return "+"
        case .unknown: return "unknown"
        }
    }
}
