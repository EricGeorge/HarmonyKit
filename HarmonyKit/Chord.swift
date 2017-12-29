import Foundation

public struct Chord {
    public let notes: Notes
    let type: ChordType
    let root: Note
    
    public init(_ root: Note, _ type: ChordType) {
        self.root = root
        self.type = type
        
        let scale = Scale(root, .major)
        let scaleNotes = scale.notes(for: 2)
        
        self.notes = type.parts.map{ Note(scaleNotes[$0.index].name,
                                          scaleNotes[$0.index].accidental + $0.accidental,
                                          scaleNotes[$0.index].octave) }
    }
}

extension Chord: CustomStringConvertible {
    public var description: String {
        return "\(self.notes.first!)\(self.type.description)"
    }
}
