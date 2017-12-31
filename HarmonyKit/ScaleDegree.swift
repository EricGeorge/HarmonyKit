import Foundation

public enum ScaleDegree: Int {
    case tonic = 0
    case supertonic
    case mediant
    case subdominant
    case dominant
    case submediant
    case subtonic

    public static let all: [ScaleDegree] = [.tonic, .supertonic, .mediant, .subdominant, .dominant, .submediant, .subtonic]
}

extension ScaleDegree: CustomStringConvertible {
    public var description: String {
        switch self {
        case .tonic: return "tonic"
        case .supertonic: return "supertonic"
        case .mediant: return "mediant"
        case .subdominant: return "subdominant"
        case .dominant: return "dominant"
        case .submediant: return "submediant"
        case .subtonic: return "subtonic"
        }
    }
}

