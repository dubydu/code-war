//: [Previous](@previous)

import Foundation
import Darwin

/// https://www.codewars.com/kata/55aa075506463dac6600010d/swift

func sumOfDivisors(n: Double) -> Int {
    var i: Double = 1.0
    var r: [Int] = []
    while i <= sqrt(Double(n)) {
        if (n.truncatingRemainder(dividingBy: i) == 0) {
            let s = n / i
            if (s == i) {
                r.append(Int(pow(i, 2)))
            } else {
                r.append(contentsOf: [Int(pow(i, 2)), Int(pow(s, 2))])
            }
        }
        i += 1
    }
    return r.reduce(0, +)
}

func listSquared(_ m: Int, _ n: Int) -> [(Int, Int)] {
    var r: [(Int, Int)] = []
    Array(m...n).forEach { v in
        let sum = sumOfDivisors(n: Double(v))
        if v == 1 {
            r.append((1, 1))
        }
        if (sqrt(Double(sum)).truncatingRemainder(dividingBy: 2.0) == 0) {
            r.append((v, sum))
        }
    }
    return r
}

listSquared(1, 250)

/*
func sumOfDivisors(n: Int) -> Int {
    func divisors() -> [Int] {
        var r: [Int] = []
        Array(1...n).forEach { v in
            if (n % v == 0) {
                r.append(Int(pow(Double(v), 2.0)))
            }
        }
        return r
    }
    let sum: Int = divisors()
        .reduce(0, +)
    return sum
}
*/

//: [Next](@next)
