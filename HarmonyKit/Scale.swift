import Foundation

public struct Scale {
    public let root: Note
    public let type: ScaleType
    
    public init(_ root: Note, _ type: ScaleType) {
        self.root = root
        self.type = type
    }
    
    public var notes: [Note] {
        var scale = [root]
        for interval in type.intervals {
            // a diatonic scale has one of each note name.
            // first figure out the next note name
            let scaleNote = nextNatural(scale.last!)
            
            // then calculate the interval to the root
            let scaleNoteInterval = scaleNote - root
            
            // compare that interval to the prescribed one in the ScaleType and adjust using an accidental
            let accidental = Accidental(rawValue: interval.halfsteps - scaleNoteInterval.halfsteps)
            let finalNote = Note(scaleNote.name, accidental!, scaleNote.octave)
            
            scale = scale + [finalNote]
        }
        return scale
    }

}

// MARK: Helpers
public func extend(for scale: Scale, by count:Int) -> [Note] {
    var extendedScale = scale.notes
    
    for index in 0...count {
        extendedScale = extendedScale + [Note(extendedScale[index].name, extendedScale[index].accidental, extendedScale[index].octave + 1)]
    }
    
    return extendedScale
}
