import Foundation

public struct Scale {
    public let root: Note
    public let type: ScaleType
    
    public init(_ root: Note, _ type: ScaleType) {
        self.root = root
        self.type = type
    }

    func notes(for octaves: Int) -> Notes {
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
    
    public var notes: Notes {
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

extension Scale : CustomStringConvertible {
    public var description: String {
        return "\(self.root) \(self.type)"
    }
}

extension Scale {
    public var tonicTriad: Chord {
        return Chord(self.notes[ScaleDegree.tonic.rawValue], self.type.triads[ScaleDegree.tonic.rawValue])
    }
    
    public var supertonicTriad: Chord {
        return Chord(self.notes[ScaleDegree.supertonic.rawValue], self.type.triads[ScaleDegree.supertonic.rawValue])
    }

    public var mediantTriad: Chord {
        return Chord(self.notes[ScaleDegree.mediant.rawValue], self.type.triads[ScaleDegree.mediant.rawValue])
    }

    public var subdominantTriad: Chord {
        return Chord(self.notes[ScaleDegree.subdominant.rawValue], self.type.triads[ScaleDegree.subdominant.rawValue])
    }

    public var dominantTriad: Chord {
        return Chord(self.notes[ScaleDegree.dominant.rawValue], self.type.triads[ScaleDegree.dominant.rawValue])
    }

    public var submediantTriad: Chord {
        return Chord(self.notes[ScaleDegree.submediant.rawValue], self.type.triads[ScaleDegree.submediant.rawValue])
    }

    public var subtonicTriad: Chord {
        return Chord(self.notes[ScaleDegree.subtonic.rawValue], self.type.triads[ScaleDegree.subtonic.rawValue])
    }
}

