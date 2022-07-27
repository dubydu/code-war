//: [Previous](@previous)

import Foundation

/// https://www.codewars.com/kata/5282b48bb70058e4c4000fa7/swift

struct RGB: CustomStringConvertible, Equatable {
    var r:Int
    var g:Int
    var b:Int
    init(_ r: Int, _ g: Int, _ b: Int) {
        self.r = r
        self.g = g
        self.b = b
    }
    static func ==(left: RGB, right: RGB) -> Bool {
        return left.r == right.r && left.g == right.g && left.b == right.b
    }
    var description: String {
        return "{R:\(r), G:\(g), B:\(b)}"
    }
}

func hexStringToRGB(_ str: String) -> RGB {
    let hex = str.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
    var hexNumber = UInt64()
    Scanner(string: hex).scanHexInt64(&hexNumber)
    let r, g, b: UInt64
    (r, g, b) = (hexNumber >> 16, hexNumber >> 8 & 0xFF, hexNumber & 0xFF)
    return RGB(Int(r), Int(g), Int(b))
}

hexStringToRGB("#FF9933")
hexStringToRGB("#beaded")
hexStringToRGB("#000000")
hexStringToRGB("#111111")
hexStringToRGB("#Fa3456")

//: [Next](@next)
