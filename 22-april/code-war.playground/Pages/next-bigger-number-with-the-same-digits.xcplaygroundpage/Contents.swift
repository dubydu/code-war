//: [Previous](@previous)

import Foundation

/// https://www.codewars.com/kata/55983863da40caa2c900004e/train/swift
/// https://velog.io/@hansangjin96/Swift-Factorial-Combination-Permutation

func nextBigger(num: Int) -> Int? {
    var numList = "\(num)".compactMap(\.wholeNumberValue)

    if numList.count == 1 {
        return -1
    } else if numList.count == 2 {
        numList.swapAt(0, 1)
        return Int("\(numList[0])\(numList[1])")
    }

    var permutationList = [[Int]]()
    func permute(_ a: [Int], _ n: Int) {
        if n == 0 {
            permutationList.append(a)
        } else {
            var a = a
            permute(a, n - 1)
            for i in 0..<n {
                a.swapAt(i, n)
                permute(a, n - 1)
                a.swapAt(i, n)
            }
        }
    }

    permute(numList, numList.count - 1)

    print(permutationList)

    return nil
}

nextBigger(num: 1464)


//var letters = ["1", "1"]
//permute(letters, letters.count - 1)


//: [Next](@next)
