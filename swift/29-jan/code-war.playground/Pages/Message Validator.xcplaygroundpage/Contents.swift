import Foundation

/// https://www.codewars.com/kata/5fc7d2d2682ff3000e1a3fbc/solutions/swift

func isAValidMessage(_ message: String) -> Bool {
    var chars = message.map { "\($0)" }
    if chars.isEmpty {
        return true
    }
    if (!isAlphabet(chars.last!) || isAlphabet(chars.first!)) {
        return false
    }
    var numbers: [[Int]] = []
    for (index, value) in chars.enumerated() {
        if (!isAlphabet(value)) {
            if (index > 0 && !isAlphabet(chars[index - 1])) {
                var conseq = numbers.last ?? []
                conseq.append(Int(value)!)
                numbers[numbers.count - 1] = conseq
            } else {
                numbers.append([Int(value)!])
            }
        }
    }
    var messages = message
    var nums = numbers.map { Int($0.map { "\($0)" }.joined())! }
    for number in nums.sorted(by: >) {
        messages = messages.replacingOccurrences(of: "\(number)", with: "_")
    }
    var mgsList = messages.split(separator: "_")
    if (mgsList.count != nums.count) {
        return false
    }
    for (n, m) in zip(nums, mgsList) {
        if (n != m.count) {
            return false
        }
    }
    return true
}

func isAlphabet(_ input: String) -> Bool {
    return (input.trimmingCharacters(in: .whitespacesAndNewlines)
        .rangeOfCharacter(from: CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ").inverted) == nil)
}

isAValidMessage("1a2bb3ccc4dddd5eeeee")
