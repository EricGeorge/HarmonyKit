import Foundation

enum Interval: Int {
    case unison = 0, m2, M2, m3, M3, P4, D5, P5, m6, M6, m7, M7
    
    var halfsteps: Int {
        return self.rawValue
    }
}
