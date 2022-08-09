//: [Previous](@previous)

import Foundation

/// https://www.codewars.com/kata/54d496788776e49e6b00052f

func sumOfDivided(_ l: [Int]) -> [(Int, Int)] {
    // find prime factors numbers
    func primeFactors(n: Int) -> [Int] {
        var n = n
        var r: [Int] = []
        while (n % 2 == 0) {
            r.append(2)
            n /= 2
        }
        for idx in stride(from: 3, through: n < 0 ? (n * -1) : n, by: 2) {
            while (n % idx == 0) {
                r.append(idx)
                n /= idx
            }
        }
        if (n > 2) {
            r.append(n)
        }
        return r
    }
    // a sum of factor
    func sumOfFactor(n: Int, l: [Int]) -> Int {
        var s = 0
        l.forEach { i in
            if (i % n == 0) {
                s += i
            }
        }
        return s
    }
    // an array sum by factors
    var ar: [(Int, Int)] = []
    l.forEach { l1 in
        primeFactors(n: l1).forEach { fa in
            if !(ar.contains(where: { $0.0 == fa }))  {
                ar.append((fa, sumOfFactor(n: fa, l: l)))
            }
        }
    }
    return ar.sorted(by: { $0.0 < $1.0 })
}

 sumOfDivided([-45])

//: [Next](@next)
