//: [Previous](@previous)

import Foundation

/// https://www.codewars.com/kata/513e08acc600c94f01000001/swift

func rgb(_ r: Int, _ g: Int, _ b: Int) -> String {
    var rgb = [r, g, b]
    // Validate RGB
    /*
    rgb = rgb.map { value -> Int in
        if (value < 0) {
            return 0
        }
        if (value > 255) {
            return 255
        }
        return value
    }
    */
    rgb = rgb.map{max(min($0, 255), 0)}
    // Convert to hex
    return rgb.map { String(format: "%02X", $0) }.joined()
}

rgb(255,255,255)
rgb(255,255,300)
rgb(0,0,0)
rgb(148,0,211)
rgb(148,-20,211)
rgb(144,195,212)
rgb(212,53,12)

//: [Next](@next)
