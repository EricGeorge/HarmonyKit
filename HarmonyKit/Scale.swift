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

public extension Scale {
    public var tonic: Chord {
        return Chord([notes[0], notes[2], notes[4]])
    }
    
    public var supertonic: Chord {
        return Chord([notes[1], notes[3], notes[5]])
    }
    
    public var mediant: Chord {
        return Chord([notes[2], notes[4], notes[6]])
    }
    
    public var subdominant: Chord {
        let notes = extend(for: self, by: 7)
        return Chord([notes[3], notes[5], notes[7]])
    }

    public var dominant: Chord {
        let notes = extend(for: self, by: 7)
        return Chord([notes[4], notes[6], notes[8]])
    }
    
    public var submedian: Chord {
        let notes = extend(for: self, by: 7)
        return Chord([notes[5], notes[7], notes[9]])
    }
    
    public var leading: Chord {
        let notes = extend(for: self, by: 7)
        return Chord([notes[6], notes[8], notes[10]])
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
