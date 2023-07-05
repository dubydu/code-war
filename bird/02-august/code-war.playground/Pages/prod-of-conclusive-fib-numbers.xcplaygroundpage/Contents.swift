//: [Previous](@previous)

import Foundation

func isPrime(num: UInt64) -> Bool {
    for idx in 2..<num {
        if (num % idx == 0) {
            return false
        }
    }
    return true
}

func fib(_ n: UInt64) -> UInt64 {
    var a = 1
    var b = 1
    (0...n).forEach { _ in
        (a, b) = (a + b, a)
    }
    return UInt64(exactly: a)!
}

let pr: UInt64 = 5895

for i in 0..<pr {
    let result = fib(i)
    print("\(result)")
}

func productFib(_ prod : UInt64) -> (UInt64, UInt64, Bool) {
    var a: UInt64 = 1
    var b: UInt64 = 1
    while prod > a * b {
        (a, b) = (b, a + b)
    }
    return (a, b, a * b == prod)
}

productFib(5895)

//: [Next](@next)
