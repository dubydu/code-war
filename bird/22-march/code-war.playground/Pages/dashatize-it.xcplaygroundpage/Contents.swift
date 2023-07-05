import Foundation

/// https://www.codewars.com/kata/58223370aef9fc03fd000071/train/swift

func dashatize(_ number: Int) -> String {
    if number < 10 && -(number) < 10 {
        return "\(number < 0 ? -(number) : number)"
    }

    let numberList = "\(number)"
        .compactMap(\.wholeNumberValue)
        .map { $0 < 0 ? -($0) : $0 }
    var arr = [String]()

    for (_, value) in numberList.enumerated() {
        // odd
        func actAppend(value: Int) {
            arr.append("\(value)")
        }
        if value % 2 != 0 {
            actAppend(value: value)
        }
        // even
        else {
            if !arr.isEmpty {
                if Int(arr.last!)! % 2 == 0 {
                    let str = "\(arr.last!)" + "\(value)"
                    arr.removeLast()
                    arr.append(str)
                } else {
                    actAppend(value: value)
                }
            } else {
                actAppend(value: value)
            }
        }
    }

    return arr.map { "\($0)" }.joined(separator: "-")
}

dashatize(974302)

//: [Next](@next)
