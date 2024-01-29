import Foundation

/// https://www.codewars.com/kata/59901fb5917839fe41000029/train/swift

func isAlphabet(_ input: String) -> Bool {
    return (input.trimmingCharacters(in: .whitespacesAndNewlines)
        .rangeOfCharacter(from: CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ").inverted) == nil)
}

func numericFormatter(_ template: String, _ numbers: String = "1234567890") -> String {
    var templateChars = template.map { "\($0)" }
    let numberChars = numbers.map { "\($0)" }
    var index = 0
    for (idx, char) in templateChars.enumerated() {
        if (char != " " && isAlphabet(char)) {
            if !(index < numberChars.count) {
                index = 0
            }
            templateChars[idx] = numberChars[index]
            index += 1
        }
    }
    return templateChars.joined()
}

isAlphabet(" ")

numericFormatter("+xxxx yyyy zzzz")
