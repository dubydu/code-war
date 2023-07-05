//: [Previous](@previous)

import Foundation

/// https://www.codewars.com/kata/56a32dd6e4f4748cc3000006/train/swift

func convertData(_ d : String, _ town: String) -> [Double]? {
    let result: [Double]? = d.components(separatedBy: "\n")
        .filter { $0.contains(town) }
        .first?
        .components(separatedBy: ":")[1]
        .components(separatedBy: ",")
        .map { Double($0.components(separatedBy: " ")[1])! }
    return result
}

func mean(_ d : String, _ town: String) -> Double {
    guard let dList: [Double] = convertData(d, town) else {
        return -1.0
    }
    return dList.reduce(0, +) / Double(dList.count)
}

func variance(_ d : String, _ town: String) -> Double {
    guard let dList: [Double] = convertData(d, town) else {
        return -1.0
    }
    let means = mean(d, town)
    return (dList.map { pow($0 - means, 2) }.reduce(0, +) / Double(dList.count))
}

let data =
     "Rome:Jan 81.2,Feb 63.2,Mar 70.3,Apr 55.7,May 53.0,Jun 36.4,Jul 17.5,Aug 27.5,Sep 60.9,Oct 117.7,Nov 111.0,Dec 97.9" + "\n" +
     "London:Jan 48.0,Feb 38.9,Mar 39.9,Apr 42.2,May 47.3,Jun 52.1,Jul 59.5,Aug 57.2,Sep 55.4,Oct 62.0,Nov 59.0,Dec 52.9"

variance(data, "London")

//: [Next](@next)
