import Foundation

public struct Scale {
    let root: Note
    let type: ScaleType
    
    public init(_ root: Note, _ type: ScaleType) {
        self.root = root
        self.type = type
    }
    
    public var notes: [Note] {
        var scale = [root]
        for interval in type.intervals {
            let scaleNote = Note((scale.last?.noteType)! + 1, .natural)
            let scaleNoteInterval = scaleNote - root
            let accidental = Accidental(rawValue: interval.halfsteps - scaleNoteInterval.halfsteps)
            let finalNote = Note(scaleNote.noteType, accidental!)
            scale = scale + [finalNote]
        }
        return scale
    }
}
