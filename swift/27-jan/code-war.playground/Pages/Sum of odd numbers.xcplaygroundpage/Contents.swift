import Foundation

/// https://www.codewars.com/kata/557e8a141ca1f4caa70000a6/train/swift

func isTriangleNumber(_ number: Int) -> Bool {
    if (number == 0 || number == 1) {
        return true
    }
    var sum = 0
    for i in 0..<number {
        sum += i
        if (sum == number) {
            return true
        }
    }
    return false
}

/// https://www.codewars.com/kata/55fd2d567d94ac3bc9000064/train/swift

func rowSumOddNumbers(_ row: Int) -> Int {
    let sum = (row * (row + 1)) / 2
    var condition = true
    var oddNumbers: [Int] = []
    var number = 1
    
    while condition {
        if (number % 2 != 0) {
            oddNumbers.append(number)
        }
        number += 1
        if (oddNumbers.count == sum) {
            condition = false
        }
    }
    
    var result = 0
    for (index, value) in oddNumbers.enumerated() {
        if (index >= oddNumbers.count - row) {
            result += value
        }
    }
    return result
}

rowSumOddNumbers(4)
