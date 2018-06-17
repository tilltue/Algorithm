import Foundation

// Find The Median
// https://www.hackerrank.com/challenges/find-the-median/problem
// Date: 2018.06.17

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
func findMedian(arr: [Int]) -> Int {
    func quickSort(array: inout [Int], left: Int, right: Int) {
        if left < right {
            let pivot = patition(array: &array, left, right)
            quickSort(array: &array, left: left, right: pivot - 1)
            quickSort(array: &array, left: pivot + 1 , right: right)
        }
    }
    var sortedArr = arr
    quickSort(array: &sortedArr, left: 0, right: sortedArr.count-1)
    let middle = sortedArr[sortedArr.count/2]
    return middle
}

public func findMedian2(arr: [Int]) -> Int {
    func quickSort(array: inout [Int], left: Int, right: Int, max: Int) -> Int {
        let pivot = patition(array: &array, left, right)
        if pivot == max {
            return array[pivot]
        }else if pivot > max {
            return quickSort(array: &array, left: left, right: pivot - 1, max: max)
        }else {
            return quickSort(array: &array, left: pivot + 1 , right: right, max: max)
        }
    }
    var sortedArr = arr
    return quickSort(array: &sortedArr, left: 0, right: sortedArr.count-1, max: sortedArr.count/2)
}
