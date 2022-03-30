//: [Previous](@previous)

import Foundation

func revRot(_ s: String, _ c: Int) -> String {
    let sList = s.compactMap(\.wholeNumberValue)
    if c <= 0 || sList.isEmpty || sList.count < c {
        return ""
    }
    /*
    let chunkList = stride(from: 0, to: sList.count, by: c).map { value -> [Int] in
        let result = Array(sList[value..<min((value + c), sList.count)])
        print("====  \(min((value + c), sList.count))")
        return result
    }
    */
    let chunkList = stride(from: 0, to: sList.count, by: c)
        .map { Array(sList[$0..<min($0 + c, sList.count)]) }
        .filter { $0.count == c }
    var result = [[Int]]()
    for (_, chunk) in chunkList.enumerated() {
        let sumOfCubes = chunk
            .map { pow(Decimal($0), 3) }
            .map { Int($0.description)! }
            .reduce(0, +)
        if sumOfCubes % 2 == 0 {
            result.append(chunk.reversed())
        } else {
            let rotateLeftChunk = (chunk[1...] + chunk[..<1])
            result.append(Array(rotateLeftChunk))
        }
    }
    return result
        .flatMap { $0.map { "\($0)" } }
        .joined()
}

revRot("664438769", 8)

//: [Next](@next)
