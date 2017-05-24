package com.example.wadehawk.kotlinstudy

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.util.Log

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        val array = arrayOf(8,2,5,3,1)
        val result = Algorithm().insertionSort(array)
        for ( item in result ) {
            Log.d("AL","$item")
        }
    }
}
