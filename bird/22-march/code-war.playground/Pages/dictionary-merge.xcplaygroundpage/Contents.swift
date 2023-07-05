//: [Previous](@previous)

import Foundation

/// https://www.codewars.com/kata/5ae840b8783bb4ef79000094/train/swift

func merge<Key, Value>(_ dicts: [[Key: Value]]) -> [Key: [Value]] {
    var result = [Key: [Value]]()
    let keys = dicts.flatMap { $0.keys }
    let values = dicts.flatMap { $0.values }
    for (index, key) in keys.enumerated() {
        if result.keys.contains(key) {
            result[key]?.append(values[index])
        } else {
            result[key] = [values[index]]
        }
    }
    return result
}

merge([["A": 1, "B": 2, "C": 3], ["A": 4, "D": 5], [:], ["E": 6, "D": 7]])

//: [Next](@next)
