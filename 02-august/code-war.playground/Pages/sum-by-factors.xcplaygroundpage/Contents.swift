//: [Previous](@previous)

import Foundation

/// [WIP]

func isPrime(n: Int) -> Bool {
    if (n == 1 || n == 0) {
        return false
    }
    for i in 2..<n {
        if (n % i == 0) {
            return false
        }
    }
    return true
}

//: [Next](@next)
