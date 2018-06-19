//: Playground - noun: a place where people can play

import UIKit
import Foundation

func searchIcecreamParlor() {
    let arr = Array("230 863 916 585 981 404 316 785 88 12 70 435 384 778 887 755 740 337 86 92 325 422 815 650 920 125 277 336 221 847 168 23 677 61 400 136 874 363 394 199 863 997 794 587 124 323 212 957 764 173 314 422 927 783 930 282 306 506 44 926 691 568 68 730 933 737 531 180 414 751 28 546 60 371 493 370 527 387 43 541 13 457 328 227 652 365 430 803 59 858 538 427 583 368 375 173 809 896 370 789".split(separator: " ")).map{ Int($0)! }
    print(icecreamParlor(m: 542, arr: arr))
    print(icecreamParlor(m: 4, arr: [1,4,5,3,2]))
    print(icecreamParlor(m: 4, arr: [2,2,4,3]))
}
//searchIcecreamParlor()

func searchMissingNumber() {
    let arr  = Array("203 204 205 206 207 208 203 204 205 206".split(separator: " ")).map{ Int($0)! }
    let arr2 = Array("203 204 204 205 206 207 205 208 203 206 205 206 204".split(separator: " ")).map{ Int($0)! }
    let ret = missingNumbers(arr: arr, brr: arr2)
    print(ret)
}
//searchMissingNumber()

func findMedian() {
    let arr = arr10000
    let ret = findMedian2(arr: arr)
    print(ret)
}

//findMedian()

func fullCountingSort(arr: [(Int,String)]) -> [(Int,String)] {
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

func fullCountSort() {
    if let url = Bundle.main.url(forResource: "CountingSort", withExtension: "txt"), let text = try? String(contentsOf: url) {
        let arr = Array(text.split(separator: "\n").map{ $0.split(separator: " ") }.map{ (Int($0[0])!,String($0[1])) })
        let sortedArr = fullCountingSort(arr: arr)
        var ret = ""
        for e in sortedArr {
            ret += "\(e.1) "
        }
        print(ret)
    }
}

fullCountSort()
