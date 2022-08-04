//: [Previous](@previous)

import Foundation

/// https://www.codewars.com/kata/55983863da40caa2c900004e/swift

func nextBigger(num: Int) -> Int? {
    var r = "\(num)"
        .compactMap(\.wholeNumberValue)
    
    var idx = r.count - 1
    while idx > 0 {
        if (r[idx] > r[idx - 1]) {
            break
        }
        idx -= 1
    }
    
    if idx == 0 {
        return nil
    }
    
    let minVal = r[idx - 1]
    var minIdx = idx
    var nextMinIdx = idx + 1
    
    while nextMinIdx < r.count {
        if (r[nextMinIdx] > minVal && r[nextMinIdx] < r[minIdx]) {
            minIdx = nextMinIdx
        }
        nextMinIdx += 1
    }
    
    r.swapAt(idx - 1, minIdx)
    let rLast = r[0..<idx] + r[idx...r.count-1].sorted(by: <)
    
    return Int(rLast.map { "\($0)" }.joined())!
}

nextBigger(num: 2017)

//: [Next](@next)
