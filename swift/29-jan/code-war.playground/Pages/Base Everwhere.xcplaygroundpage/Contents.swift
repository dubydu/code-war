import Foundation

func baseFinder(_ seq: [String]) -> Int {
    /*
    var res: [String] = []
    for char in seq.joined().map({ "\($0)" }) {
        if !(res.contains(char)) {
            res.append(char)
        }
    }
    return res.count
     */
    return Set(seq.joined(separator: "")).count
}

baseFinder(["50", "51", "61", "53", "54", "60", "52", "62", "55", "56"])
