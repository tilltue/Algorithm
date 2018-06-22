import Foundation

// Closest Numbers
// https://www.hackerrank.com/challenges/closest-numbers/problem
// Date: 2018.06.23

/* timeout testcase 4
func closestNumbers(arr: [Int]) -> [Int] {
    var dict = [Int:Int]()
    var test = 0
    var diff = 0
    while true {
        let pivot = arr[test]
        dict[arr[test]] = arr[test]
        var mininums = [Int]()
        for index in test+1..<arr.count {
            let haha = pivot < arr[index] ? arr[index] - pivot : pivot - arr[index]
            if diff == 0 {
                diff = haha
            }else {
                diff = haha < diff ? haha : diff
            }
            mininums.append(haha)
        }
        if mininums.count == 0 {
            break
        }
        test+=1
    }
    var ret = [Int]()
    arr.forEach { e in
        if let value = dict[e+diff] {
            ret.append(e)
            ret.append(value)
        }
    }
    return ret.sorted()
}*/

// My Solution
func closestNumbers(arr: [Int]) -> [Int] {
    var dict = [Int:Int]()
    arr.forEach { e in
        dict[e] = e
    }
    var ret = [Int]()
    var diff = 1
    while ret.count == 0 {
        for e in arr {
            if let value = dict[e-diff] {
                ret.append(value)
                ret.append(value+diff)
                dict.removeValue(forKey: value+diff)
            }else if let value = dict[e+diff] {
                ret.append(value)
                ret.append(value-diff)
                dict.removeValue(forKey: value-diff)
            }
        }
        diff += 1
    }
    return ret.sorted()
}

// in Discussions
func closestNumbers2(arr: [Int]) -> [Int] {
    let sortedArr = arr.sorted()
    var lowestDiff = sortedArr[1] - sortedArr[0]
    var ret = [sortedArr[0],sortedArr[1]]
    for index in 1..<sortedArr.count-1 {
        let n1 = sortedArr[index]
        let n2 = sortedArr[index+1]
        if n2 - n1 < lowestDiff {
            ret = []
            ret.append(n1)
            ret.append(n2)
            lowestDiff = n2 - n1
        }else if n2 - n1 == lowestDiff {
            ret.append(n1)
            ret.append(n2)
        }
    }
    print(ret)
    return ret
}


if let url = Bundle.main.url(forResource: "ClosestNumber", withExtension: "txt"), let text = try? String(contentsOf: url) {
    let arr = Array(text.split(separator: " ").compactMap{ Int($0) })
    let sortedArr = closestNumbers(arr: arr).map{ String($0) }
    closestNumbers2(arr: arr).map{ String($0) }
    let ret = sortedArr.joined(separator: " ")
    print(ret)
}
