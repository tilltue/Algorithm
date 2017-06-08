package com.example.wadehawk.kotlinstudy

/**
 * Created by wade.hawk on 2017. 6. 8..
 * O (n^2)
 * insertion sort 보다 나쁘지만 bubble sort 보다는 좋다.
 * 배열의 나머지 부분에서 최소값을 찾는 부분이 느리다 모든요소를 비교해야 하기 때문
 * 힙 정렬은 선택 정렬과 같은 원리지만 나머지 부분에서 최소값을 찾는 부분이 더 빨라서 효율이 좋다
 * 힙 정렬의 성능은 O ( n log n )
 * lowest 는 작은값을 찾아내기 위한 기준 점으로 아래 흐름에서 ^ 의 index 값으로 이해
 * | 3 1 5 8 9
 *  ^          ( lowest 는 0으로 시작되어 3의 값을 가르키나 1이 가장 작으므로 lowest 는 1의 위치를 가르키며 이후 스왑된다 )
 * 1 | 3 5 8 9
 *     ^       ( lowest 는 1로 시작되며 3의 값을 가르키며 3보다 작은 값이 없어 lowest 는 변화가 없이 스왑되지 않고 다음 기준점으로 옮겨간다 )
 * 1 3 | 5 8 9
 *             ( 위와 같은 로직이 끝까지 반복 )
 */

//mutable list extension swap function
fun <T>MutableList<T>.swap(index1: Int, index2: Int) {
    val tmp = this[index1] // 'this' corresponds to the list
    this[index1] = this[index2]
    this[index2] = tmp
}

fun <T:Comparable<T>>Algorithm.selectionSort(array: List<T>): List<T> {
    var result = array.toMutableList()
    for (x in 0 until result.count()) {
        var lowest = x
        for (y in x+1 until result.count()) {
            if (result[y] < result[lowest]) {
                lowest = y
            }
        }
        if (x != lowest) {
            result.swap(x,lowest)
        }
    }
    return result.toList()
}