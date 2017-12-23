import Foundation

enum ScaleDegree {
    case tonic
    case supertonic
    case mediant
    case subdominant
    case dominant
    case submedian
    case leading
    
    var indexes: [Int] {
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
}

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
        return Chord(ScaleDegree.tonic.indexes.map { notes[$0] })
    }
    
    public var supertonic: Chord {
        return Chord(ScaleDegree.supertonic.indexes.map { notes[$0] })
    }
    
    public var mediant: Chord {
        return Chord(ScaleDegree.mediant.indexes.map { notes[$0] })
    }
    
    public var subdominant: Chord {
        let notes = extend(for: self, by: 7)
        return Chord(ScaleDegree.subdominant.indexes.map { notes[$0] })
    }
    
    public var dominant: Chord {
        let notes = extend(for: self, by: 7)
        return Chord(ScaleDegree.dominant.indexes.map { notes[$0] })
    }
    
    public var submedian: Chord {
        let notes = extend(for: self, by: 7)
        return Chord(ScaleDegree.submedian.indexes.map { notes[$0] })
    }
    
    public var leading: Chord {
        let notes = extend(for: self, by: 7)
        return Chord(ScaleDegree.leading.indexes.map { notes[$0] })
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
