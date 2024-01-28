import Foundation

/// https://www.codewars.com/kata/5b4070144d7d8bbfe7000001/swift

func numericals(_ str: String) -> String {
    var char: [String: Int] = [:]
    var res = ""
    for st in str.map { "\($0)" } {
        if let count = (char[st]) {
            char[st] = count + 1
        } else {
            char[st] = 1
        }
        res += "\(char[st]!)"
    }
    return res
}

numericals("Hello, World!")
