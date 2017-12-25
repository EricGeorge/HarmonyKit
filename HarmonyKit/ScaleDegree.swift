import Foundation

public enum ScaleDegree {
    case tonic
    case supertonic
    case mediant
    case subdominant
    case dominant
    case submedian
    case leading
    
    var triads: [Int] {
        switch self {
        case .tonic: return [0,2,4]
        case .supertonic: return [1,3,5]
        case .mediant: return [2,4,6]
        case .subdominant: return [3,5,7]
        case .dominant: return [4,6,8]
        case .submedian: return [5,7,9]
        case .leading: return [6,8,10]
        }
    }
    
    public func appliedTo(_ scale: Scale) -> [Note] {
        return self.triads.map { scale.notes(for: 2)[$0] }
    }
}

