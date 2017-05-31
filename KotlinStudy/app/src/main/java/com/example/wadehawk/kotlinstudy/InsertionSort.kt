package com.example.wadehawk.kotlinstudy

/**
 * Created by wade.hawk on 2017. 5. 31..
 * Insertion Sort
 * Big-O : O(n^2)
 * 2개의 중첩루프가 존재하기 때문
 * 작은 크기의 배열에서 quick sort O(n log n)등보다 빠르다.
 */

fun Algorithm.insertionSort(array: Array<Int>): Array<Int> {
    var result = array.toMutableList()
    for (x in 1 until array.count()) {
        var y = x
        val temp = result[y]
        while (y > 0 && temp < result[y - 1]) {
            result[y] = result[y - 1]
            y -= 1
        }
        result[y] = temp
    }
    return result.toTypedArray()
}
