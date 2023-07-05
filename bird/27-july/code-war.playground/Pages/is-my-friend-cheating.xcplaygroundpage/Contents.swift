//: [Previous](@previous)

import Foundation

/// https://www.codewars.com/kata/5547cc7dcad755e480000004/swift

func removNb(_ n: Int) -> [(Int,Int)] {
    let arr = Array(1...n)
    let sum = arr.reduce(0, +)
    var r: [(Int, Int)] = []
    // From the instructions, we can form a formula like this:
    //
    // (x * y) + x + y = sum
    // <=> y(x + 1) + x = sum
    // <=> (x + 1)(y + 1) = sum + 1
    // <=> y + 1 = (sum + 1) / (x + 1)
    // <=> y = ((sum + 1) / (x + 1)) - 1
    // or
    // <=> y = (sum + 1 - (x + 1)) / (x + 1)
    for x in arr {
        let y = ((sum + 1) / (x + 1)) - 1
        if y <= n {
            if x * y == sum - x - y {
                r.append((x, y))
            }
        }
    }
    return r.sorted(by: { $0.0 < $1.0 })
}

removNb(325)

//: [Next](@next)
