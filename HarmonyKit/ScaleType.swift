import Foundation

public enum ScaleType {
    case major
    case minor
    case harmonicMinor
    case dorian
    case phrygian
    case lydian
    case mixolydian
    case locrian
    
    var intervals: [Interval] {
        switch self {
        case .major: return [.M2, .M3, .P4, .P5, .M6, .M7]
        case .minor: return [.M2, .m3, .P4, .P5, .m6, .m7]
        case .harmonicMinor: return [.M2, .m3, .P4, .P5, .m6, .M7]
        case .dorian: return [.M2, .m3, .P4, .P5, .M6, .m7]
        case .phrygian: return [.m2, .m3, .P4, .P5, .m6, .m7]
        case .lydian: return [.M2, .M3, .D5, .P5, .M6, .M7]
        case .mixolydian: return [.M2, .M3, .P4, .P5, .M6, .m7]
        case .locrian: return [.m2, .m3, .P4, .D5, .m6, .m7]
        }
    }
}

extension ScaleType : CustomStringConvertible {
    public var description: String {
        switch self {
        case .major: return "Major"
        case .minor: return "Minor"
        case .harmonicMinor: return "Harmonic Minor"
        case .dorian: return "Dorian"
        case .phrygian: return "Phrygian"
        case .lydian: return "Lydian"
        case .mixolydian: return "Mixolydian"
        case .locrian: return "Locrian"
        }
    }
}
