package com.example.wadehawk.kotlinstudy

/**
 * Created by wade.hawk on 2017. 5. 29..
 */

class BinarySearchTree<T: Comparable<T>> constructor(value: T) {
    var value = value
    var parent: BinarySearchTree<T>? = null
    var left: BinarySearchTree<T>? = null
    var right: BinarySearchTree<T>? = null
    val isRoot: Boolean
        get() = parent == null
    val isLeaf: Boolean
        get() = left == null && right == null
    val isLeftChild: Boolean
        get() = parent?.left === this
    val isRightChild: Boolean
        get() = parent?.right === this
    val hasLeftChild: Boolean
        get() = left != null
    val hasRightChild: Boolean
        get() = right != null
    val hasAnyChild: Boolean
        get() = left != null || right != null
    val hasBothChild: Boolean
        get() = left != null && right != null
    val count: Int
        get() = (left?.count ?: 0) + 1 + (right?.count ?: 0)
    fun insert(value: T) {
        if (value < this.value) {
            if (this.left != null) {
                this.left?.insert(value)
            }else {
                this.left = BinarySearchTree<T>(value)
                this.left?.parent = this
            }
        }else if (value > this.value) {
            if (this.right != null) {
                this.right?.insert(value)
            }else {
                this.right = BinarySearchTree<T>(value)
                this.right?.parent = this
            }
        }
    }
    constructor(root: T, array: Array<T>) : this(value = root) {
        for (item: T in array) {
            this.insert(item)
        }
    }
}

val <T:Comparable<T>> BinarySearchTree<T>.description: String get() {
    var s = ""
    left?.let {
        val desc = it.description
        s += "($desc) <- "
    }
    s+= "$value"
    right?.let {
        val desc = it.description
        s += " -> ($desc)"
    }
    return s
}
/*
    재귀 사용
 */
fun <T:Comparable<T>> BinarySearchTree<T>.search(value: T): BinarySearchTree<T>? {
    if (this.value < value) {
        return this.right?.search(value)
    }else if (this.value > value) {
        return this.left?.search(value)
    }else {
        return this
    }
}
/*
    반복문 사용
 */
fun <T:Comparable<T>> BinarySearchTree<T>.search2(value: T): BinarySearchTree<T>? {
    var node: BinarySearchTree<T>? = this
    while (node != null) {
        if (node.value < value) {
            node = node?.right
        }else if (node.value > value) {
            node = node?.left
        }else {
            return node
        }
    }
    return null
}

/*
    이외에 더 연습 거리가 있지만 다른 알고리즘 기본 구현 끝내고 이어서 해보자
    Traversal 부터
    https://github.com/raywenderlich/swift-algorithm-club/tree/master/Binary%20Search%20Tree#traversal
 */