import Foundation

enum Interval: Int {
    case unison = 0
    case m2 = 1
    case M2 = 2
    case m3 = 3
    case M3 = 4
    case P4 = 5
    case D5 = 6
    case P5 = 7
    case m6 = 8
    case M6 = 9
    case m7 = 10
    case M7 = 11
    
    var halfsteps: Int {
        return self.rawValue
    }
}
