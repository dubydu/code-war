//: [Previous](@previous)

import Foundation

/// [WIP]

func lastDigit<S>(_ numbers: S) -> Int where S: Sequence, S.Iterator.Element == Int {
    var total = 1.0
    var numbers = numbers as! [Int]
    for (idx, _) in numbers.enumerated() {
        if (idx < numbers.count - 1) {
            total = pow(Double(numbers[numbers.count - 2 - idx]),
                        total != 1.0 ? total : Double(numbers[numbers.count - 1 - idx]))
        }
    }
    return 1
}

lastDigit([8,21])

//: [Next](@next)
