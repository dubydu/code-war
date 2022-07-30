//: [Previous](@previous)

import Foundation

/// https://www.codewars.com/kata/55c6126177c9441a570000cc/train/swift

func orderWeight(_ s: String) -> String {
    if s == "" || s.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
        return ""
    }
    var weightList = s
        .components(separatedBy: " ")
        .map { $0.compactMap { "\($0)" } }
        .map { $0.map { Int($0)! } }
    
    weightList = weightList
        .sorted(by: {
            ($0.reduce(0, +) < $1.reduce(0, +))
        })
    
    var isSwap = true
    while isSwap {
        for i in 0..<weightList.count - 1 {
            let value1 = weightList[i + 1]
            let value2 = weightList.last!
            let isFinal = value1 == value2
            
            func swap() {
                let temp = weightList[i + 1]
                weightList[i + 1] = weightList[i]
                weightList[i] = temp
            }
            
            let weight1 = weightList[i].reduce(0, +)
            let weight2 = weightList[i + 1].reduce(0, +)
            
            /*
            if (weight1 > weight2) {
                swap()
                isSwap = true
            }
             */
            
            if (weight1 == weight2) {
                let value1 = weightList[i].map { "\($0)" }.joined()
                let value2 = weightList[i + 1].map { "\($0)" }.joined()
                if value1 > value2 {
                    swap()
                    break
                }
            }
            
            if isFinal {
                isSwap = false
            }
        }
    }
    
    return weightList
        .filter { $0.count != 0 }
        .map { $0.map { "\($0)" }.joined() }
        .joined(separator: " ")
}

print(orderWeight(""))

//: [Next](@next)


