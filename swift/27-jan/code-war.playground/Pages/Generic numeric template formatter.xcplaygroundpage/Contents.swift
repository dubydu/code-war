import Foundation

/// [WIP] : https://www.codewars.com/kata/59901fb5917839fe41000029/train/swift

func numericFormatter(_ template: String, _ numbers: String = "1234567890") -> String {
    let templateChars = template.map { "\($0)" }
    var numberChars = numbers.map { "\($0)" }
    var res = ""
    let characterset = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
    for (i, v) in templateChars.enumerated() {
        if (v == " ") {
            res += " "
            numberChars.insert(" ", at: i)
        } else if (v.trimmingCharacters(in: .whitespacesAndNewlines)
            .rangeOfCharacter(from: characterset.inverted) != nil) {
            // numberChars.insert("", at: i)
            res += v
        } else {
            if (numbers.count <= i) {
                numberChars.append(numberChars[i - numbers.count])
            }
            res += numberChars[i]
        }
    }
    return res
}

// numericFormatter("xxx xxxxx xx", "5465253289")
// numericFormatter("xxx xxxxx xx")
// numericFormatter("+555 aaaa bbbb", "18031978")
numericFormatter("D6jnDviO1banyqy26187920")

// 1623456718901226187920
// 16234567189012326187920
