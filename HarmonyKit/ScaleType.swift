import Foundation

public enum ScaleType {
    case major
    case minor
    case harmonicMinor
    case ionian
    case dorian
    case phrygian
    case lydian
    case mixolydian
    case aeolian
    case locrian
    
    var intervals: [Interval] {
        switch self {
        case .major: return [.M2, .M3, .P4, .P5, .M6, .M7]
        case .minor: return [.M2, .m3, .P4, .P5, .m6, .m7]
        case .harmonicMinor: return [.M2, .m3, .P4, .P5, .m6, .M7]
        case .ionian: return [.M2, .M3, .P4, .P5, .M6, .M7]
        case .dorian: return [.M2, .m3, .P4, .P5, .M6, .m7]
        case .phrygian: return [.m2, .m3, .P4, .P5, .m6, .m7]
        case .lydian: return [.M2, .M3, .D5, .P5, .M6, .M7]
        case .mixolydian: return [.M2, .M3, .P4, .P5, .M6, .m7]
        case .aeolian: return [.M2, .m3, .P4, .P5, .m6, .m7]
        case .locrian: return [.m2, .m3, .P4, .D5, .m6, .m7]
        }
    }
    
    var triads: [ChordType] {
        switch self {
        case .major: return [.major, .minor, .minor, .major, .major, .minor, .diminished]
        case .minor: return [.minor, .diminished, .major, .minor, .minor, .major, .major]
        case .harmonicMinor: return [.minor, .diminished, .augmented, .minor, .major, .major, .diminished]
        case .ionian: return [.major, .minor, .minor, .major, .major, .minor, .diminished]
        case .dorian: return [.minor, .minor, .major, .major, .minor, .diminished, .major]
        case .phrygian: return [.minor, .major, .major, .minor, .diminished, .major, .minor]
        case .lydian: return [.major, .major, .minor, .diminished, .major, .minor, .minor]
        case .mixolydian: return [.major, .minor, .diminished, .major, .minor, .minor, .major]
        case .aeolian: return [.minor, .diminished, .major, .minor, .minor, .major, .major]
        case .locrian: return [.diminished, .major, .minor, .minor, .major, .major, .minor]
        }
    }
    
    public var roman: [String] {
        switch self {
        case .major: return ["I", "ii", "iii", "IV", "V", "vi", "vii°"]
        case .minor: return ["i", "ii°", "III", "iv", "v", "VI", "VII"]
        case .harmonicMinor: return ["i", "ii°", "III+", "iv", "V", "VI", "vii°"]
        case .ionian: return ["I", "ii", "iii", "IV", "V", "vi", "vii°"]
        case .dorian: return ["i", "ii", "III", "IV", "v", "vi°", "VII"]
        case .phrygian: return ["i", "II", "III", "iv", "v°", "IV", "vii"]
        case .lydian: return ["I", "II", "iii", "iv°", "V", "vi", "vii"]
        case .mixolydian: return ["I", "ii", "iii°", "IV", "v", "vi", "VII"]
        case .aeolian: return ["i", "ii°", "III", "iv", "v", "VI", "VII"]
        case .locrian: return ["i°", "II", "iii", "iv", "V", "VI", "vii"]
        }
    }
}

extension ScaleType : CustomStringConvertible {
    public var description: String {
        switch self {
        case .major: return "Major"
        case .minor: return "Minor"
        case .harmonicMinor: return "Harmonic Minor"
        case .ionian: return "Ionian (major)"
        case .dorian: return "Dorian"
        case .phrygian: return "Phrygian"
        case .lydian: return "Lydian"
        case .mixolydian: return "Mixolydian"
        case .aeolian: return "Aeolian (natural minor)"
        case .locrian: return "Locrian"
        }
    }
}
