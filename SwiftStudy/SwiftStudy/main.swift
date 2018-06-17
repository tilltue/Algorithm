//
//  main.swift
//  SwiftStudy
//
//  Created by tilltue on 2015. 12. 15..
//  Copyright © 2015년 tilltue. All rights reserved.
//

import Foundation

// 순차 탐색 알고리즘
func linearSearch(array: [Int], searchKey: Int) -> Int {
    
    var i = 0
    for obj in array {
        if obj == searchKey {
            return i
        }
        i++
    }
    return -1
}

//    NSArray *sortArr;
//    sortArr = [array sortedArrayUsingComparator:^NSComparisonResult(int s1, int s2) {
//        return s1 < s2;
//    }];

// 이진 탐색 알고리즘 : 오름차순으로 정렬된 리스트에서 특정한 값의 위치를 찾는 알고리즘
func binarySearch(array: [Int], low: Int, high: Int, searchKey: Int) -> Int {
    
    if low > high {
        return -1
    }
    let mid = ( low + high ) / 2
    if array[mid] > searchKey {
        return binarySearch(array, low: low, high: mid-1, searchKey: searchKey)
    }else if array[mid] < searchKey {
        return binarySearch(array, low: mid+1, high: high, searchKey: searchKey)
    }else{
        NSLog("%d", mid)
        return mid
    }
}

// 퀵 정렬 : 하나의 기준값을 정하고 큰값은 우측으로 작은 값은 좌측으로 정렬해 나가는 알고리즘.
func patition(array: inout [Int], _ low: Int, _ high: Int) -> Int {
    let pivot = array[high]
    var i = low
    for j in low..<high {
        if array[j] <= pivot {
            (array[i], array[j]) = (array[j], array[i])
            i += 1
        }
    }
    (array[i], array[high]) = (array[high], array[i])
    return i
}

func quickSort(array: inout [Int], left: Int , right: Int) {
    
    if left < right {
        let pivot = patiton(&array, left: left, right: right)
        quickSort(&array, left: left, right: pivot-1)
        quickSort(&array, left: pivot+1, right: right)
    }
}

func quickSortMid(array: inout [Int], left: Int, right: Int) {
    
    var leftPos = left
    var rightPos = right
    let pivot = array[(left+right)/2]
    
    repeat {
        while( array[leftPos] < pivot ){
            leftPos++
        }
        while( array[rightPos] > pivot ){
            rightPos--
        }
        if leftPos <= rightPos{
            let temp = array[leftPos]
            array[leftPos++] = array[rightPos]
            array[rightPos--] = temp
        }
    }while( leftPos <= rightPos )
    
    if leftPos < right {
        quickSortMid(&array, left: leftPos, right: right)
    }
    if rightPos > left {
        quickSortMid(&array, left: left, right: rightPos)
    }
}

func bubbleSort(array: inout [Int]){
    
    let length = array.count
    
    for i in 0..<array.count {
        for j in 1..<length-i {
            if array[j-1] > array[j] {
                let temp = array[j-1]
                array[j-1] = array[j]
                array[j] = temp
            }
        }
    }
}

let arr = [4,57,2,45,5,7,34,1]
let key = 45
var quickArr = [-67,90,-57,25,84,32,73,54]
var bubbleArr = [55,7,78,12,42]
var test = ["aa",44,55.3]

for obj in test
{
    print(obj.className)
}

func blabla( array: [Int], lessThanCheck:(Int,Int) -> Bool ) -> ( max: Int, min: Int , lessThan: Bool ){
    var max = -1
    var min = -1
    for obj in array {
        if obj > max || max == -1 {
            max = obj
        }
        if obj < min || min == -1 {
            min = obj
        }
    }
    return (max,min,lessThanCheck(max,min))
}

func lessThanCheck( t1: Int , t2: Int) -> Bool {
    return t1 < t2
}

func sayHello(to person: String, and anotherPerson: String) -> String {
    return "Hello \(person) and \(anotherPerson)!"
}

var dataFloat = [Float](count: 10, repeatedValue: 1.0 )
print(dataFloat)

print(sayHello(to: "Bill", and: "Ted"))

print(blabla(quickArr,lessThanCheck: lessThanCheck))

print("linearSearch \(linearSearch(arr, searchKey: key))")
print("\(arr.indexOf({$0==key})!)")
let sortArr = arr.sort( {(s1: Int,s2 :Int) -> Bool in return s1 < s2} )
//print(sortArr)
binarySearch(sortArr, low: 0, high: sortArr.count, searchKey: 7)
//quickSort(&quickArr, left: 0, right: quickArr.count-1)
quickSortMid(&quickArr, left: 0, right: quickArr.count-1)
//print(quickArr)
bubbleSort(&bubbleArr)
print(bubbleArr)
let vegetable = "red pepper"
var vegetableComment = String()
switch vegetable {
    case "celery":
        vegetableComment = "Add some raisins and make ants on a log."
    case "cucumber", "watercress":
        vegetableComment = "That would make a good tea sandwich."
    case let x where x.hasSuffix("pepper"):
        vegetableComment = "Is it a spicy \(x)?"
    default:
        vegetableComment = "Everything tastes good in soup."
}
print(vegetableComment)
