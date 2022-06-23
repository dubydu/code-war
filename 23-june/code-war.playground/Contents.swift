import Foundation

/// Enum Associated Values

enum Spaceship {
    case usa
    case uk
}

enum Message {
    case a(Int)
    case b(Spaceship)
    case c

    func isEqual(_ mgs: Message) -> Bool {
        switch (self, mgs) {
        case (.a(let value1), .a(let value2)):
            return value1 == value2
        case (.b(let value1), .b(let value2)):
            return value1 == value2
        case (.c, .c):
            return true
        default:
            return false
        }
    }
}

let mgs1: Message = .a(1)
let mgs2: Message = .a(0)

mgs1.isEqual(mgs2)

let mgs3: Message = .b(.usa)
let mgs4: Message = .b(.uk)

mgs3.isEqual(mgs4)

let mgs5: Message = .c
let mgs6: Message = .c

mgs5.isEqual(mgs6)
