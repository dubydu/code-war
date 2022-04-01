//: [Previous](@previous)

import Foundation

/// https://www.codewars.com/kata/55e7280b40e1c4a06d0000aa/train/swift

extension Array {
    var combinations: [[Element]] {
        guard !self.isEmpty else {
            return [[]]
        }
        return Array(self[1...])
            .combinations
            .flatMap { [$0, [self[0]] + $0] }
    }
}

func chooseBestSum(_ t: Int, _ k: Int, _ ls: [Int]) -> Int {
    let distances = ls.combinations
        .filter { $0.count == k }
        .map { $0.reduce(0, +) }
        .sorted()
    for (index, value) in distances.enumerated() {
        if t > distances.last! {
            return distances.last!
        } else if value == t {
            return value
        } else if index + 1 < distances.count,
                    value < t && distances[index + 1] > t {
            return value
        }
    }
    return -1
}

let ts: [Int] = [91, 74, 73, 85, 73, 81, 87]
chooseBestSum(331, 2, ts) // 178
chooseBestSum(230, 3, ts) // 228
chooseBestSum(331, 4, ts) // 331



/// Demonstrate

/*
func converter(data: [Int]) -> [[Int]] {
    if data == [] {
        return [[]]
    }
    let ds = Array(arrayLiteral: data[1...]).flatMap { [$0, [data[0]] + $0] }
    return [[]]
}

converter(data: [1, 2,3,4])

let distances = [50, 55, 57, 58, 60].combinations.filter { $0.count == 3 }.map { $0.reduce(0, +) }

for (index, value) in distances.enumerated() {
    // if doesn't icluded the "false" condition then this script will be "index out of range"
    print("\(value <= 174 && (distances[index + 1] != 0))")
    if index + 1 < distances.count, value < 174 && distances[index + 1] > 174 {
        print(value)
    }
}
*/

//: [Next](@next)
