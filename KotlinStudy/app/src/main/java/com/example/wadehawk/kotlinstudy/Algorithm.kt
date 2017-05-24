package com.example.wadehawk.kotlinstudy

/**
 * Created by wade.hawk on 2017. 5. 21..
 */

class Algorithm { }

fun MutableList<Int>.swap(index1: Int, index2: Int) {
    val tmp = this[index1] // 'this' corresponds to the list
    this[index1] = this[index2]
    this[index2] = tmp
}

fun Algorithm.insertionSort(array: Array<Int>): Array<Int> {
    var result = array.toMutableList()
    for (x in 1 until array.count()) {
        var y = x
        while (y > 0 && result[y] < result[y - 1]) {
            result.swap(y-1,y)
            y -= 1
        }
    }
    return result.toTypedArray()
}