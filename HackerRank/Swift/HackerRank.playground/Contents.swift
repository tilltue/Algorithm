//: Playground - noun: a place where people can play

import UIKit
// 문제를 읽은뒤 12시 37분 시작
//t: 아이스크림 가계 방문 횟수
//m: 가진 돈
//n: 제공되는 맛의 수
//n: 아이스 크림 맛 각각의 가격
//m: 가진 돈
//n: 제공되는 맛의 수
//n: 아이스 크림 맛 각각의 가격

import Foundation
/*
// Complete the icecreamParlor function below.
func icecreamParlor(m: Int, arr: [Int]) -> [Int] {
    var temp1 = (0,0)
    var temp2 = (0,0)
    var index = 0
    print("---")
    for price in arr {
        index += 1
        if price >= m {
            continue
        }
        var index2 = 0
        for price2 in arr {
            index2 += 1
            if price2 >= m {
                continue
            }
            if price + price2 <= m && index != index2 && temp1.0 + temp2.0 < price + price2 {
                temp1.0 = price
                temp1.1 = index
                temp2.0 = price2
                temp2.1 = index2
            }
        }
    }
    print(temp1.0+temp2.0)
    print(temp1,temp2)
    return [temp1.1,temp2.1]
}
let arr = Array("230 863 916 585 981 404 316 785 88 12 70 435 384 778 887 755 740 337 86 92 325 422 815 650 920 125 277 336 221 847 168 23 677 61 400 136 874 363 394 199 863 997 794 587 124 323 212 957 764 173 314 422 927 783 930 282 306 506 44 926 691 568 68 730 933 737 531 180 414 751 28 546 60 371 493 370 527 387 43 541 13 457 328 227 652 365 430 803 59 858 538 427 583 368 375 173 809 896 370 789".split(separator: " ")).map{ Int($0)! }
print(icecreamParlor(m: 542, arr: arr))
print(icecreamParlor(m: 4, arr: [1,4,5,3,2]))
print(icecreamParlor(m: 4, arr: [2,2,4,3]))
*/
/*
func missingNumbers(arr: [Int], brr: [Int]) -> [Int] {
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
}*/
func missingNumbers(arr: [Int], brr: [Int]) -> [Int] {
    let count = brr.count
    var pivot = 0
    var ret = [Int]()
    for index in 0..<count {
        if brr[index] == arr[pivot] {
            print(brr[index],arr[pivot])
            pivot += 1
        }else {
            print("missing \(brr[index])")
            ret.append(brr[index])
        }
    }
    return ret
}
let arr  = Array("203 204 205 206 207 208 203 204 205 206".split(separator: " ")).map{ Int($0)! }
let arr2 = Array("203 204 204 205 206 207 205 208 203 206 205 206 204".split(separator: " ")).map{ Int($0)! }
let ret = missingNumbers(arr: arr, brr: arr2)
print(ret)
