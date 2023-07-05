//: [Previous](@previous)

import Foundation

/// https://www.codewars.com/kata/52e88b39ffb6ac53a400022e/swift

extension UInt32 {
    func toI8Arr() -> [UInt8] {
        return [
            UInt8((self & 0xFF000000) >> 24),
            UInt8((self & 0x00FF0000) >> 16),
            UInt8((self & 0x0000FF00) >> 8),
            UInt8(self & 0x000000FF)
        ]
    }
}

func ipv4(of i32: UInt32) -> String {
    let i8List = i32.toI8Arr()
    return i8List
        .map { "\($0)" }
        .joined(separator: ".")
}

ipv4(of: 2149583361)

//: [Next](@next)
