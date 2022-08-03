//: [Previous](@previous)

import Foundation

/// https://www.codewars.com/kata/52742f58faf5485cae000b9a/swift

// 3.154e+7

func formatDuration(_ seconds: Int) -> String {
    if (seconds == 0) {
        return "now"
    }
    let arr = [
        (seconds / 31536000),
        (seconds / 86400) % 365,
        (seconds / 3600) % 24,
        (seconds / 60) % 60,
        (seconds % 3600) % 60
    ]
    enum dArr: Int, CaseIterable {
        case year, day, hour, minute, second
        func gen(value: Int, index: Int) -> String {
            let readable = ["year", "day", "hour", "minute", "second"]
            if value == 0 {
                return ""
            } else {
                return "\(value) \(value > 1 ? "\(readable[index])s" : "\(readable[index])")"
            }
        }
    }
    var r: [String] = []
    for (value, d) in zip(arr, dArr.allCases) {
        r.append(d.gen(value: value, index: d.rawValue))
    }
    r = r.filter { $0 != "" }
    var s = ""
    for (index, value) in r.enumerated() {
        s += "\(value)\(index == r.count - 2 ? " and " : "\(index == r.count - 1 ? "" : ", ")")"
    }
    return s
}

formatDuration(31536000 + 7200)
formatDuration(3662)

//: [Next](@next)
