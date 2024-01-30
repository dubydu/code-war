import Foundation

/// https://www.codewars.com/kata/55466989aeecab5aac00003e/train/swift

func sqInRect(_ lng: Int, _ wdth: Int) -> [Int]? {
    var l = lng
    var w = wdth
    var arr: [Int] = []
    // return nil
    if (l == w) {
        return nil
    }
    // do swap
    if (l < w) {
        l = l + w
        w = l - w
        l = l - w
    }
    while l > 0 {
        if (l > w) {
            arr.append(w)
            l = l - w
            if (l == 0) {
                break
            }
        } else {
            arr.append(l)
            w = w - l
            if (w == 0) {
                break
            }
        }
    }
    return arr
}

sqInRect(14, 20)

/*
 func sqInRect(_ x: Int, _ y: Int) -> [Int]? {
     guard x != y else { return nil }
     let minSide = min(x, y)
     let maxSide = max(x, y)
     return minSide > 0 ? Array([[minSide], sqInRect(maxSide - minSide, minSide) ?? [minSide]].joined()) : []
 }
 */
