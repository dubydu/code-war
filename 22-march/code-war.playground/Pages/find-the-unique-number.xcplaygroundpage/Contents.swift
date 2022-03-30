//: [Previous](@previous)

import Foundation

/// https://www.codewars.com/kata/585d7d5adb20cf33cb000235/swift

func findUniq(_ arr: [Int]) -> Int {
    var temp: [Int] = []
    var notUniqueNunber: Int = 0
    arr[...2].forEach { value in
        if !temp.contains(value) {
            temp.append(value)
        } else {
            notUniqueNunber = value
        }
    }
    return arr.filter { $0 != notUniqueNunber }.first!
}

findUniq([ 0, 0, 1, 0, 0 ])

//: [Next](@next)
