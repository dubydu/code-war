import Foundation

func smallest(_ n: Int) -> (Int, Int, Int) {
    var arr = "\(n)".map { Int("\($0)")! }
    var sIdx = 0
    for i in 1..<arr.count {
        var j = i
        let currentEle = arr[j]
        while (j > 0 && currentEle <= arr[j - 1]) {
            arr[j] = arr[j - 1]
            j -= 1
            sIdx = i
        }
        arr[j] = currentEle
    }
    let sNum = Int(arr.map { "\($0)" }.joined())!
    return (sNum, sIdx, arr[sIdx])
}


smallest(261235)
