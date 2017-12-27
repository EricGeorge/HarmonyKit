import Foundation

enum ChordPart {
    case first
    case second
    case flatThird
    case third
    case fourth
    case flatFifth
    case fifth
    case sharpFifth
    case flatSeventh
    case seventh
    
    var index: Int {
        switch self {
        case .first: return 0
        case .second: return 1
        case .flatThird: return 2
        case .third: return 2
        case .fourth: return 3
        case .flatFifth: return 4
        case .fifth: return 4
        case .sharpFifth: return 4
        case .flatSeventh: return 6
        case .seventh: return 6
        }
    }
    
    var accidental: Accidental {
        switch self {
        case .first: return .natural
        case .second: return .natural
        case .flatThird: return .flat
        case .third: return .natural
        case .fourth: return .natural
        case .flatFifth: return .flat
        case .fifth: return .natural
        case .sharpFifth: return .sharp
        case .flatSeventh: return .flat
        case .seventh: return .natural
        }
    }
}

