package com.example.wadehawk.kotlinstudy

import android.util.Log

/**
 * Created by wade.hawk on 2017. 5. 31..
 * Merge Sort : 폰노이만
 * Big-O : O(n log n)
 * 기준 점을 잡고 <- | -> 로 배열을 더이상 나눌수 없을때 까지 각각 나눈다
 * 각 더미들을 순차적으로 비교하며 병합한다
 * 좌측 요소 0,1,2 인덱싱 하며 우측 요소 0,1,2 인덱싱 하며 각 요소들을 비교하며 병합
 * 단점은 병합을 위해서 임시 배열이 필요하다는 점
 */
//Top-down implementation
fun <T:Comparable<T>> Algorithm.mergeSortTD(list: List<T>): List<T> {
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
    //Log.d("AL","split list: $list")
    return when {
        list.count() == 1 -> list
        else -> {
            val middleIndex = list.count() / 2
            val leftList = Algorithm().mergeSortTD(list.slice(IntRange(0, middleIndex - 1)))
            val rightList = Algorithm().mergeSortTD(list.slice(IntRange(middleIndex, list.count() - 1)))
            return merge(leftList, rightList).map { it as T }
        }
    }
}
/**
 * Bottom-up implementation
 * 아래와 같은 흐름으로 정렬됨 더블버퍼링 사용 : z
-- 좌측 배열을 in 우측 배열에 out
-- 우측 배열을 in 좌측 배열에 out
-- 가장 작은 단위를 비교 해서 큰단위로 올라간다 1,2,3... width
-- 반복
 */
fun <T: Comparable<T>>Algorithm.mergeSortBU(list: List<T>): List<T> {
    val listCount = list.count()
    var z: MutableList<MutableList<T>> = mutableListOf(list.toMutableList(),list.toMutableList())
    var switchIndex = 0
    var width = 1
    while (width < listCount) {
        var i = 0 // 0,2,4,8...
        val inListIndex = switchIndex
        val outListIndex = 1-switchIndex
        while (i < listCount) {
            var insertIndex = i
            var leftIndex = i
            var rightIndex = i + width
            val lmax = minOf(leftIndex+width,listCount)
            val rmax = minOf(rightIndex+width,listCount)
            while (leftIndex < lmax && rightIndex < rmax) {
                if (z[inListIndex][leftIndex] < z[inListIndex][rightIndex]) {
                    z[outListIndex][insertIndex] = z[inListIndex][leftIndex]
                    leftIndex+=1
                }else {
                    z[outListIndex][insertIndex] = z[inListIndex][rightIndex]
                    rightIndex+=1
                }
                insertIndex+=1
            }
            //rightIndex,leftIndex 중 먼저 도달해서 위의 조건식이 끝난 경우
            while (leftIndex < lmax) {
                z[outListIndex][insertIndex] = z[inListIndex][leftIndex]
                leftIndex+=1
                insertIndex+=1
            }
            while (rightIndex < rmax) {
                z[outListIndex][insertIndex] = z[inListIndex][rightIndex]
                rightIndex+=1
                insertIndex+=1
            }
            i += width*2
        }
        switchIndex = 1-switchIndex
        width *= 2
    }
    return z[switchIndex].toList()
}