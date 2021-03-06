package com.example.wadehawk.kotlinstudy

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.util.Range

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        //insertSortTest()
        //binarySearchTreeTest()
        //boyerMooreStringSearchTest()
        selectionSortTest()
        mergeSortTest()
    }

    fun insertSortTest() {
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

    fun binarySearchTreeTest() {
        /*
        val tree = BinarySearchTree<Int>(7)
        tree.insert(2)
        tree.insert(5)
        tree.insert(10)
        tree.insert(9)
        tree.insert(1)*/
        //constructor root and insert array
        val tree = BinarySearchTree<Int>(7,arrayOf(2,5,10,9,1))
        val test = tree.description
        Log.d("AL","$test")
        var search = tree.search(9)?.value
        Log.d("AL","binary search tree search result : $search")
        search = tree.search2(10)?.value
        Log.d("AL","binary search tree search result : $search")
    }

    fun selectionSortTest() {
        var list = listOf(11, 59, 3, 2, 53, 17, 31, 7, 19, 67, 47, 13, 37, 61, 29, 43, 5, 41, 23)
        var result = Algorithm().selectionSort(list)
        Log.d("AL","selection sort result : $result")
    }

    fun mergeSortTest() {
        var list = listOf(11, 59, 3, 2, 53, 17, 31, 7, 19, 67, 47, 13, 37, 61, 29, 43, 5, 41, 23)
        var result = Algorithm().mergeSortTD(list)
        Log.d("AL","merge sort top-down result : $result")
        result = Algorithm().mergeSortBU(list)
        Log.d("AL","merge sort bottom-up result : $result")
    }

    fun boyerMooreStringSearchTest() {
        val string = "Created by wade.hawk on 2017. 6. 1.."
        val index = Algorithm().BoyerMooreStringSearch(string,"hawk")
        val check = string[index]
        Log.d("AL","Boyer Moore string search result : $index $check")
    }
}
