import Foundation

public struct Scale {
    public let root: Note
    public let type: ScaleType
    
    public init(_ root: Note, _ type: ScaleType) {
        self.root = root
        self.type = type
    }

    public func notes(for octaves: Int) -> Notes {
        if octaves < 1 {
            return []
        }
        
        var notes = self.notes
        
        if octaves > 1 {
            for index in 0...(octaves - 1) * 7 {
                notes = notes + [Note(notes[index].name, notes[index].accidental, notes[index].octave + 1)]
            }
        }
        return notes
    }
    
    var notes: Notes {
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
        return Chord(ScaleDegree.tonic.indexes.map { notes[$0] })
    }
    
    public var supertonic: Chord {
        return Chord(ScaleDegree.supertonic.indexes.map { notes[$0] })
    }
    
    public var mediant: Chord {
        return Chord(ScaleDegree.mediant.indexes.map { notes[$0] })
    }
    
    public var subdominant: Chord {
        return Chord(ScaleDegree.subdominant.indexes.map { self.notes(for: 2)[$0] })
    }
    
    public var dominant: Chord {
         return Chord(ScaleDegree.dominant.indexes.map { self.notes(for: 2)[$0] })
    }
    
    public var submedian: Chord {
        return Chord(ScaleDegree.submedian.indexes.map { self.notes(for: 2)[$0] })
    }
    
    public var leading: Chord {
        return Chord(ScaleDegree.leading.indexes.map { self.notes(for: 2)[$0] })
    }
}

