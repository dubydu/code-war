//: [Previous](@previous)

import Foundation

/// https://www.codewars.com/kata/56541980fa08ab47a0000040/swift

func printerError(_ s: String) -> String {
    var er = 0
    for ss in s {
        if (("n"..."z").contains(String(ss))) {
            er += 1
        }
    }
    return "\(er)/\(s.count)"
}

printerError("aaaxbbbbyyhwawiwjjjwwm")

//: [Next](@next)
