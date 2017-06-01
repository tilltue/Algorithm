package com.example.wadehawk.kotlinstudy

import android.os.Debug
import android.util.Log

/**
 * Created by wade.hawk on 2017. 6. 1..
 * 문자열에서 원하는 패턴을 검색하는 알고리즘이다
 * skip 할수 있는 테이블을 만들고, 문자열과 찾고자 하는 패턴을 정렬 시키고 right - to - left 로 검색한다
 * 'Created by wade.hawk on 2017. 6. 1..' 문자열에서 hawk 를 검색한다고 가정하면
 * skip table 은 아래와 같이 구성된다 찾고자 하는 패턴의 마지막 문자열에서의 offset
 * h 3
 * a 2
 * w 1
 * k 0
 *
 * 동작 과정
 * 01234567890123456789
 * Created by wade.hawk on 2017. 6. 1..
 * hawk
 *    ^ (a:2)
 * 마지막 문자열을 비교해서 매칭되지 않으며 skip table 에 'a' 가 존재 하므로 2만큼 이동한다
 * Created by wade.hawk on 2017. 6. 1..
 *   hawk
 *      ^ (e : 4)
 * Created by wade.hawk on 2017. 6. 1..
 *       hawk
 *          ^ (y:4)
 * Created by wade.hawk on 2017. 6. 1..
 *           hawk
 *              ^ (d:4)
 * e,y,d 는 skip table 에 존재 하지 않으므로 pattern length(4) 만큼 이동한다
 * Created by wade.hawk on 2017. 6. 1..
 *               hawk
 *                  ^ (a:2)
 * 'a' skip table 2 이동
 * Created by wade.hawk on 2017. 6. 1..
 *                 hawk
 *                    ^
 * 매칭
 * 구현을 할때 다음 순서로 하면 쉽게 작성할 수 있다
 * 1. skip table 의 작성 구현
 * 2. 문자열과 패턴을 비교하면서 마지막 char 를 비교하고 skip table 의 값여부에 따라 skip 하는 로직 구현
 *    아래 구현부에서 while 문
 * 3. backword (right - to - left)
 *    pattern match 함수 구현
 */
fun Algorithm.BoyerMooreStringSearch(source: String, pattern: String): Int {
    val range = pattern.indices
    var skipTable = HashMap<Char,Int>()
    for (item in pattern.iterator().withIndex()) {
        skipTable[item.value] = range.last - item.index
    }
    //Log.d("AL","skip table : $skipTable")
    val lastChar = pattern[range.last]
    var i = source.indices.first + range.last
    fun backword(): Int? {
        for (b in range) {
            if (source[i - b] != pattern[range.last - b]) {
                return null
            }
        }
        return i-range.last
    }
    while (i < source.length) {
        if (source[i] == lastChar) {
            val index = backword()
            if (index != null) {
                return index
            }
        }
        i += (skipTable[source[i]] ?: pattern.length)
    }
    return -1
}