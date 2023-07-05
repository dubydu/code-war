//: [Previous](@previous)

import Foundation
import Darwin

/// [WIP] - https://www.codewars.com/kata/573992c724fc289553000e95/train/swift

func smallest(_ n: Int) -> (Int, Int, Int) {
    let nList = "\(n)".compactMap(\.wholeNumberValue)
    let tempList = nList

    func rotate(_ n: [Int]) -> (Int, [Int]) {
        var nList = n
        var indexTaking = 0
        var minNumber = nList[0]

        for (index, value) in nList.enumerated() {
            if minNumber >= value {
                minNumber = value
                indexTaking = index
            }
        }
        if minNumber != 0 {
            nList.remove(at: indexTaking)
            nList.insert(minNumber, at: 0)
        } else {
            print("=== \(indexTaking)")
            nList.insert(nList.first!, at: indexTaking + 1)
            nList.remove(at: indexTaking)
            nList.remove(at: 0)
            nList.insert(0, at: 0)
        }
        return (indexTaking, nList)
    }

    var result: (Int, [Int])
    result = rotate(nList)

    if result.0 == 0 {
        let first = result.1.first!
        var res = rotate(Array(result.1[1...]))
        res.1.insert(first, at: 0)
        result = res
    }

    var dif1: Int!
    var dif2: Int!
    var index = 0
    for (val1, val2) in zip(result.1, tempList) {
        if val1 != val2 {
            if dif1 == nil {
                dif1 = index
            } else if dif2 == nil {
                dif2 = index
            }
        }
        index += 1
    }

    if result.1.first == 0 {
        if let index = nList.firstIndex(of: 0), index <= 1 {
            dif1 = dif2 + dif1
            dif2 = dif1 - dif2
            dif1 = dif1 - dif2
        }
    }

    if result.0 != 0 && result.1.first == 0 && dif1 != 1 {
       let first = result.1.first!
       var res = rotate(Array(result.1[1...]))
       res.1.insert(first, at: 0)
       result = res
   }

    let linked = Int(result.1
        .map { "\($0)" }
        .joined())!

    return (linked, dif2, dif1)
}

// smallest(209917)

//: [Next](@next)
