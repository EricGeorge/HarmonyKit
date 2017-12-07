import Foundation

public enum ScaleType {
    case major
    case minor
    case harmonicMinor
    
    var intervals: [Interval] {
        switch self {
        case .major: return [.M2, .M3, .P4, .P5, .M6, .M7]
        case .minor: return [.M2, .m3, .P4, .P5, .m6, .m7]
        case .harmonicMinor: return [.M2, .m3, .P4, .P5, .m6, .M7]
        }
    }
}

extension ScaleType : CustomStringConvertible {
    public var description: String {
        switch self {
        case .major: return "Major"
        case .minor: return "Minor"
        case .harmonicMinor: return "Harmonic Minor"
        }
    }
}
