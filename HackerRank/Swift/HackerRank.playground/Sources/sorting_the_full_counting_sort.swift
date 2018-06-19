import Foundation

// Full Counting Sort
// https://www.hackerrank.com/challenges/countingsort4/problem
// Date: 2018.06.17

public func fullCountingSort(arr: [(Int,String)]) -> [(Int,String)] {
    var countArr = [(Int,Int)](repeating: (0,0), count: 100)
    //print(arr)
    for e in arr {
        countArr[e.0].0 += 1
        countArr[e.0].1 += 1
    }
    //print(countArr)
    for index in 1..<countArr.count {
        let sum = countArr[index].0 + countArr[index-1].0
        countArr[index] = (sum,countArr[index].1)
    }
    //print(countArr)
    var sortedArr = [(Int,String)](repeating: (0,""), count: arr.count)
    for index in 0..<arr.count {
        let e = arr[index]
        let insertIndex = countArr[e.0].0 - countArr[e.0].1
        sortedArr[insertIndex] = (e.0, index < arr.count/2 ? "-" : e.1)
        countArr[e.0].1 -= 1
    }
    //    print("-----")
    //    print(sortedArr)
    return sortedArr
}

/* 연화님 풀이 :D
import Foundation

let string = """
0 ab
6 cd
0 ef
6 gh
4 ij
0 ab
6 cd
0 ef
6 gh
0 ij
4 that
3 be
0 to
1 be
5 question
1 or
2 not
4 is
2 to
4 the
"""

let n = 20
let array = string.split(separator: "\n").map{ String($0) }

print(array)

var sorted = [[String]](repeating: [], count: 3)
var dashIndex = n / 2

for nItr: Int in 0 ..< array.count {
    let item = array[nItr]
    let xs = item.split(separator: " ").map{ String($0) }
    
    let x: String = xs[0]
    let s: String
    
    if nItr < dashIndex {
        s = "-"
    } else {
        s = xs[1]
    }
    
    print("x : \(x) s : \(s)")
    
    if let idx = Int(x), idx - sorted.count + 1 > 0 {
        let appendArray = [[String]](repeating: [], count: idx - sorted.count + 1)
        sorted += appendArray
    }
    
    if let idx = Int(x) {
        sorted[idx].append(s)
    }
}

print(sorted)

print(Array(sorted.joined()).joined(separator: " "))

//: [Next](@next)
*/
