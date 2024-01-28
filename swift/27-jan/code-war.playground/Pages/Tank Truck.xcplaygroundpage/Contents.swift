import Foundation

/// https://www.codewars.com/kata/5503013e34137eeeaa001648/swift

func diamond(_ size: Int) -> String? {
    if (size <= 0 || size % 2 == 0) {
        return nil
    }
    if (size == 1) {
        return "*\n"
    }
    var arr = [Int](1...size)
        .filter { $0 % 2 != 0 }
        .map { [Int](1...$0).map { _ in "*" }.joined() }
    
    for (index, value) in arr.enumerated() {
        let space = [Int](0..<((arr.last!.count - value.count) / 2))
        arr[index] = "\(space.map { _ in " " }.joined())\(value)"
    }

    var reversed = arr
    reversed = reversed.dropLast()
    reversed.reverse()

    let up = arr.map { String($0) }
        .joined(separator: "\n")
    let down = reversed.map { String($0) }
        .joined(separator: "\n")
    let res = "\(up)\n\(down)\n"
    return res
}

diamond(1)
