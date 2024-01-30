import Foundation

/// https://www.codewars.com/kata/5848565e273af816fb000449/train/swift

func encryptThis(text: String) -> String{
    var words = text.split(separator: " ")
    words = words.map { value in
        var chars = value.map { "\($0)" }
        let f = "\(Character(chars[0]).asciiValue!)"
        if (value != " ") {
            if (chars.count == 1) {
                return "\(f)"
            } else if (chars.count == 2) {
                return "\(f)\(chars[1])"
            } else {
                var s = chars[1]
                chars[1] = chars.last!
                chars[chars.count - 1] = s
                chars[0] = f
                return "\(chars.joined())"
            }
        } else {
            return value
        }
    }
    return words.joined(separator: " ")
}

encryptThis(text: "Thank you Piotr for all your help")
