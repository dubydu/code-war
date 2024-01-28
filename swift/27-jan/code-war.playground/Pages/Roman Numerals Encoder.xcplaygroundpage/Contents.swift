import Foundation

/// https://www.codewars.com/kata/51b62bf6a9c58071c600001b/swift

func solution(_ number:Int) -> String {
    let roman = ["M","CM","D","CD","C","XC","L","XL","X","IX","V","IV","I"]
    let arabic =
    [1000,900,500,400,100,90,50,40,10,9,5,4,1]
    var number = number, r = ""
    while number > 0 {
        for (i,v) in arabic.enumerated() {
            if v <= number {
                r += roman[i]
                number -= v
                break
            }
        }
    }
    return r
}

func findIt(_ seq: [Int]) -> Int {
    if (seq.count == 1) {
        return seq[0]
    }
    var res: [[Int]] = []
    for sq in seq {
        if (res.isEmpty) {
            res.append([sq])
        } else {
            if let index = res.firstIndex(where: { $0.contains(where: { $0 == sq }) }) {
                res[index].append(sq)
            } else {
                res.append([sq])
            }
        }
    }
    return res.filter { $0.count % 2 != 0 }[0][0]
}

findIt([20,1,-1,2,-2,3,3,5,5,1,2,4,20,4,-1,-2,5])
