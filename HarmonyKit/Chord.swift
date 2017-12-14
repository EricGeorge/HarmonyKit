import Foundation

public struct DiatonicChord {
    let scale: Scale
    let indexOfRoot: Int
    
    public init(_ scale: Scale, _ degree: Int) {
        self.scale = scale
        self.indexOfRoot = degree - 1
    }
    
    public var notes: [Note] {
        
        let extendedScale = extend(for: scale, by: 7)
        
        var triad = [extendedScale[indexOfRoot]]
        
        let third = indexOfRoot + 2
        triad = triad + [extendedScale[third]]
        
        let fifth = indexOfRoot + 4
        triad = triad + [extendedScale[fifth]]
        
        return triad
    }
}
