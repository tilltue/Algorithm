import Foundation

// Missing Numbers
// https://www.hackerrank.com/challenges/missing-numbers/problem
// Date: 2018.06.11

public func missingNumbers(arr: [Int], brr: [Int]) -> [Int] {
    var dic1 = [Int:Int]()
    var dic2 = [Int:Int]()
    
    for e in (arr.count > brr.count ? brr : arr) {
        let value = dic1[e] == nil ? 0 : dic1[e]!
        dic1.updateValue(value + 1, forKey: e)
    }
    for e in (arr.count > brr.count ? arr : brr) {
        let value = dic2[e] == nil ? 0 : dic2[e]!
        dic2.updateValue(value + 1, forKey: e)
    }
    print(dic1)
    print(dic2)
    let ret = dic1.filter{ dic2[$0.key] == nil || dic2[$0.key] != $0.value }.map{ $0.key }.sorted{ $0 < $1 }
    return ret
}
