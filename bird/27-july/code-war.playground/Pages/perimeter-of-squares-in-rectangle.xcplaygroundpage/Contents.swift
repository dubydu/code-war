//: [Previous](@previous)

import Foundation

/// https://www.codewars.com/kata/559a28007caad2ac4e000083/train/swift

func perimeter(_ n: UInt64) -> UInt64 {
    if (n < 2) {
        return n
    }
    var n1: UInt64 = 0
    var n2: UInt64 = 1
    var fibNumbers: [UInt64] = []
    (0...n).forEach { n in
        let total = n1 + n2
        n1 = n2
        n2 = total
        fibNumbers.append(n1)
    }
    return fibNumbers.reduce(0, +) * 4
}

func perimeter2(_ n: UInt64) -> UInt64 {
    if (n < 2) {
        return n
    }
    var arr: [Int] = [1, 1]
    (2...Int(n)).forEach { n in
        arr.append((arr[n - 1] + arr[n - 2]))
    }
    return UInt64(arr.reduce(0, +) * 4)
}

perimeter2(5)
perimeter(20)

//: [Next](@next)
