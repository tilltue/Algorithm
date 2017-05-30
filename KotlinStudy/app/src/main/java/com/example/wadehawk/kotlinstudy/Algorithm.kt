package com.example.wadehawk.kotlinstudy

import android.util.Log
import android.util.Range

/**
 * Created by wade.hawk on 2017. 5. 21..
 */

class Algorithm { }

/**
 * Insertion Sort
 * Big-O : O(n^2)
 * 2개의 중첩루프가 존재하기 때문
 * 작은 크기의 배열에서 quick sort O(n log n)등보다 빠르다
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

/**
 * Binary Search
 * Big-O : O( log n )
 * 1,000,000 개의 요소에서 서칭할때 log_2(1,000,000) = 19.9, 즉 20 단계만 거치면 된다.
 */
//재귀 함수
fun <T: Comparable<T>> Algorithm.binarySearch(array: Array<T>, key: T, range: Range<Int>): Int {
    if (range.lower >= range.upper) {
        return -1
    }
    val middle = range.lower + (range.upper - range.lower)/2
    return when {
        array[middle] == key -> middle
        array[middle] < key -> Algorithm().binarySearch<T>(array,key, Range(middle+1,range.upper))
        else -> Algorithm().binarySearch<T>(array,key,Range(0,middle))
    }
}
//반복문
fun Algorithm.binarySearch2(array: Array<Int>, key: Int): Int {
    var lowerBound = 0
    var upperBound = array.count()
    while (lowerBound < upperBound) {
        val middle = lowerBound + ( upperBound - lowerBound ) / 2
        // used when
        when {
            array[middle] == key -> return middle
            array[middle] < key -> lowerBound = middle +1
            else -> upperBound = middle
        }
        // used if
        /*
        if (array[middle] == key) {
            return middle
        }else if (array[middle] < key) { // right
            lowerBound = middle + 1
        }else { // left
            upperBound = middle
        }
        */
    }
    return -1
}
/**
 * Merge Sort : 폰노이만
 * Big-O : O(n log n)
 * 기준 점을 잡고 <- | -> 로 배열을 더이상 나눌수 없을때 까지 각각 나눈다
 * 각 더미들을 순차적으로 비교하며 병합한다
 * 좌측 요소 0,1,2 인덱싱 하며 우측 요소 0,1,2 인덱싱 하며 각 요소들을 비교하며 병합
 */
fun <T:Comparable<T>> Algorithm.mergeSort(list: List<T>): List<T> {
    fun merge(leftPile: List<T>, rightPile: List<T>): MutableList<T> {
        var leftIndex = 0
        var rightIndex = 0
        var orderedPile = mutableListOf<T>()
        while (leftIndex < leftPile.count() && rightIndex < rightPile.count()) {
            if (leftPile[leftIndex] < rightPile[rightIndex]) {
                orderedPile.add(leftPile[leftIndex])
                leftIndex+=1
            }else if (leftPile[leftIndex] > rightPile[rightIndex]) {
                orderedPile.add(rightPile[rightIndex])
                rightIndex+=1
            }else {
                orderedPile.add(leftPile[leftIndex])
                orderedPile.add(rightPile[rightIndex])
                leftIndex+=1
                rightIndex+=1
            }
        }
        while (leftIndex < leftPile.count()) {
            orderedPile.add(leftPile[leftIndex])
            leftIndex+=1
        }
        while (rightIndex < rightPile.count()) {
            orderedPile.add(rightPile[rightIndex])
            rightIndex+=1
        }
        return orderedPile
    }
    return when {
        list.count() == 1 -> list
        else -> {
            val middleIndex = list.count() / 2
            val leftList = Algorithm().mergeSort(list.slice(IntRange(0, middleIndex - 1)))
            val rightList = Algorithm().mergeSort(list.slice(IntRange(middleIndex, list.count() - 1)))
            return merge(leftList, rightList).map { it as T }
        }
    }
}
/*
    TODO: merge sort
    bottom up implementation 구현 연습
    https://github.com/raywenderlich/swift-algorithm-club/tree/master/Merge%20Sort
 */
