import Foundation

public func diatonicChord(for scale: Scale, at degree: Int) -> [Note] {
    let indexOfRoot = degree - 1
    
    let extendedScale = extend(for: scale, by: 7)
    
    var triad = [extendedScale[indexOfRoot]]
    
    let third = indexOfRoot + 2
    triad = triad + [extendedScale[third]]
    
    let fifth = indexOfRoot + 4
    triad = triad + [extendedScale[fifth]]
    
    return triad
}
