//: [Previous](@previous)

import Foundation

func diagonal(_ n: Int, _ p: Int) -> Int {
    if (p == 0 || p == n) {
        return 1
    }
    return diagonal(n - 1, p - 1) + diagonal(n - 1, p)
}

diagonal(20, 3)

//: [Next](@next)
