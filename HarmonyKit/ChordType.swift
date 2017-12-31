import Foundation

public enum ChordType {
    case major
    case minor
    case diminished
    case augmented
    case sus2
    case sus4
    case dominantSeventh
    case majorSeventh
    case minorMajorSeventh
    case minorSeventh
    
    public static let all:[ChordType] = [.major, minor, .diminished, .augmented, sus2, sus4, dominantSeventh, majorSeventh, minorMajorSeventh, minorSeventh]
    
    var intervals: [Interval] {
        switch self {
        case .major: return [.M3, .m3]
        case .minor: return [.m3, .M3]
        case .diminished: return [.m3, .m3]
        case .augmented: return [.M3, .M3]
            
        case .sus2: return [.M2, .P4]
        case .sus4: return [.P4, .M2]
            
        case .dominantSeventh: return [.M3, .m3, .m3]
        case .majorSeventh: return [.M3, .m3, .M3]
        case .minorMajorSeventh: return [.m3, .M3, .M3]
        case .minorSeventh: return [.m3, .M3, .m3]
        }
    }
        
    var parts: [ChordPart] {
        switch self {
        case .major: return [.first, .third, .fifth]
        case .minor: return [.first, .flatThird, .fifth]
        case .diminished: return [.first, .flatThird, .flatFifth]
        case .augmented: return [.first, .third, .sharpFifth]
            
        case .sus2: return [.first, .second, .fifth]
        case .sus4: return [.first, .fourth, .fifth]
        
        case .dominantSeventh: return [.first, .third, .fifth, .flatSeventh]
        case .majorSeventh: return [.first, .third, .fifth, .seventh]
        case .minorMajorSeventh: return [.first, .flatThird, .fifth, .seventh]
        case .minorSeventh: return [.first, .flatThird, .fifth, .flatSeventh]
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
            
        case .sus2: return "sus2"
        case .sus4: return "sus4"
            
        case .dominantSeventh: return "7"
        case .majorSeventh: return "Δ7"
        case .minorMajorSeventh: return "mΔ7"
        case .minorSeventh: return "m7"
        }
    }
}
