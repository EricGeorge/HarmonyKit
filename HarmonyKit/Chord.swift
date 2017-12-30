import Foundation

public struct Chord {
    public let notes: Notes
    let type: ChordType
    let root: Note
    public var romanName: String?
    
    public init(_ root: Note, _ type: ChordType) {
        self.init(root, type, "")
    }
    
    public init(_ root: Note, _ type: ChordType, _ romanName: String) {
        self.root = root
        self.type = type
        self.romanName = romanName
        
        let scale = Scale(root, .major)
        let scaleNotes = scale.notes(for: 2)
        
        self.notes = type.parts.map{ Note(scaleNotes[$0.index].name,
                                          scaleNotes[$0.index].accidental + $0.accidental,
                                          scaleNotes[$0.index].octave) }
    }
    
    // TODO - how do we deal with negative inversions?
    public func notes(invertedBy index: Int) -> Notes {
        let invertedNotes = notes[0..<index]
        return Array(notes[index..<notes.count] + invertedNotes.map{ Note($0.name, $0.accidental, $0.octave + 1)})
    }
}

extension Chord: CustomStringConvertible {
    public var description: String {
        return "\(self.notes.first!)\(self.type.description)"
    }
}
