//: [Previous](@previous)

import Foundation

func nextBigger(num: Int) -> Int? {
    let arr = "\(num)".compactMap(\.wholeNumberValue)
    var r = [[Int]]()
    func permuting(_ str: [Int]) -> [[Int]] {
        var nums = str
        permute(&nums, left: 0, right: str.count)
        return r
    }
    func permute(_ number: inout [Int], left: Int, right: Int) {
        if left == right {
            let newnum = number
            if Int("\(newnum.map { "\($0)" }.joined())")! > num {
                r.append(number)
            }
        }
        for i in left ..< right {
            number.swapAt(i, left)
            permute(&number, left: left + 1, right: right)
            number.swapAt(i, left)
        }
    }
    let re = permuting(arr)
        .map { $0.map { "\($0)" } }
        .sorted(by: { Int($0.joined())! < Int($1.joined())! })
        .first(where: { Int($0.joined())! > num })
    if let re = re {
        return Int(re.joined())!
    }
    return nil
}

nextBigger1(num: 921122705847142)

//: [Next](@next)
