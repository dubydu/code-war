//: [Previous](@previous)

import Foundation

/// https://www.codewars.com/kata/56dbe7f113c2f63570000b86/swift

func rot(_ s: String) -> String {
    return s.components(separatedBy: "\n")
        .map { String($0.reversed()) }
        .reversed()
        .joined(separator: "\n")
}

func selfieAndRot(_ s: String) -> String {
    let selfie = s.components(separatedBy: "\n")
        .map { value -> String in
            let dots: String = Array(0..<(value.count))
                .map { _ in "."}
                .joined()
            return value + dots
        }
        .joined(separator: "\n")
    let rots = rot(s).components(separatedBy: "\n")
        .map { value -> String in
            let dots: String = Array(0..<(value.count))
                .map { _ in "."}
                .joined()
            return dots + value
        }
        .joined(separator: "\n")
    return selfie + "\n" + rots
}

func oper(_ function: (String) -> String, _ s: String) -> String {
    return function(s)
}

oper(selfieAndRot, "xZBV\njsbS\nJcpN\nfVnP")

//: [Next](@next)
