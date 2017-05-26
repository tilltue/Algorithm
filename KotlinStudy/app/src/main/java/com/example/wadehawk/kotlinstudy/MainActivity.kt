package com.example.wadehawk.kotlinstudy

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.util.Range

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        var array = arrayOf(11, 59, 3, 2, 53, 17, 31, 7, 19, 67, 47, 13, 37, 61, 29, 43, 5, 41, 23)
        val result = Algorithm().insertionSort(array)
        Log.d("AL","insertion sort result")
        for ( item in result ) {
            Log.d("AL","$item")
        }
        Log.d("AL","binary search start ( recursive implementation )")
        var index = Algorithm().binarySearch<Int>(result,7, Range(0,array.count()-1))
        Log.d("AL","binary search result $index")
        Log.d("AL","binary search start")
        index = Algorithm().binarySearch2(result,7)
        Log.d("AL","binary search result $index")
    }
}
