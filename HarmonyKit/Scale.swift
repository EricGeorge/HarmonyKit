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
    public func diatonicTriad(for degree: ScaleDegree) -> Chord {
        return Chord(self.notes[degree.rawValue], self.type.triads[degree.rawValue], self.type.roman[degree.rawValue])
    }
}

