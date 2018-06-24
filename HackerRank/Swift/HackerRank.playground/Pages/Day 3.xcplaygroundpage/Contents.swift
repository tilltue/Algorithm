import Foundation

// Closest Numbers
// https://www.hackerrank.com/challenges/closest-numbers/problem
// Date: 2018.06.23

/* timeout testcase 4
func closestNumbers(arr: [Int]) -> [Int] {
    var dict = [Int:Int]()
    var test = 0
    var diff = 0
    while true {
        let pivot = arr[test]
        dict[arr[test]] = arr[test]
        var mininums = [Int]()
        for index in test+1..<arr.count {
            let haha = pivot < arr[index] ? arr[index] - pivot : pivot - arr[index]
            if diff == 0 {
                diff = haha
            }else {
                diff = haha < diff ? haha : diff
            }
            mininums.append(haha)
        }
        if mininums.count == 0 {
            break
        }
        test+=1
    }
    var ret = [Int]()
    arr.forEach { e in
        if let value = dict[e+diff] {
            ret.append(e)
            ret.append(value)
        }
    }
    return ret.sorted()
}*/

// My Solution
func closestNumbers(arr: [Int]) -> [Int] {
    var dict = [Int:Int]()
    arr.forEach { e in
        dict[e] = e
    }
    var ret = [Int]()
    var diff = 1
    while ret.count == 0 {
        for e in arr {
            if let value = dict[e-diff] {
                ret.append(value)
                ret.append(value+diff)
                dict.removeValue(forKey: value+diff)
            }else if let value = dict[e+diff] {
                ret.append(value)
                ret.append(value-diff)
                dict.removeValue(forKey: value-diff)
            }
        }
        diff += 1
    }
    return ret.sorted()
}

// in Discussions (vote 11)
func closestNumbers2(arr: [Int]) -> [Int] {
    let sortedArr = arr.sorted()
    var lowestDiff = sortedArr[1] - sortedArr[0]
    var ret = [sortedArr[0],sortedArr[1]]
    for index in 1..<sortedArr.count-1 {
        let n1 = sortedArr[index]
        let n2 = sortedArr[index+1]
        if n2 - n1 < lowestDiff {
            ret = []
            ret.append(n1)
            ret.append(n2)
            lowestDiff = n2 - n1
        }else if n2 - n1 == lowestDiff {
            ret.append(n1)
            ret.append(n2)
        }
    }
    print(ret)
    return ret
}

func closestNumber() {
    if let url = Bundle.main.url(forResource: "ClosestNumber", withExtension: "txt"), let text = try? String(contentsOf: url) {
        let arr = Array(text.split(separator: " ").compactMap{ Int($0) })
        let sortedArr = closestNumbers(arr: arr).map{ String($0) }
        closestNumbers2(arr: arr).map{ String($0) }
        let ret = sortedArr.joined(separator: " ")
        print(ret)
    }
}
//closestNumber()


// Connected Cell In Grid
// https://www.hackerrank.com/challenges/connected-cell-in-a-grid/problem
// Date: 2018.06.23

//My solution
class Graph {
    var nodes: [Node]
    
    init() {
        self.nodes = []
    }
    
    func addNode(position: (Int,Int), value: Int) -> Node {
        if let node = (self.nodes.filter{ $0 == Node(position: position, value: value) }.first) {
            return node
        }else {
            let node = Node(position: position, value: value)
            self.nodes.append(node)
            return node
        }
    }
    
    func addEdge(source: Node, neighbor: Node) {
        let edge = Edge(node: neighbor)
        source.neighbors.append(edge)
    }
}

class Node: Equatable {
    var position: (Int,Int)
    var value: Int
    var neighbors: [Edge] = []
    var visited: Bool = false
    
    init(position: (Int,Int), value: Int) {
        self.position = position
        self.value = value
    }
    
    static func ==(lhs: Node, rhs: Node) -> Bool {
        return lhs.position.0 == rhs.position.0 && lhs.position.1 == rhs.position.1
    }
}

class Edge: Equatable {
    var neighbor: Node
    
    init(node: Node) {
        self.neighbor = node
    }
    
    static func ==(lhs: Edge, rhs: Edge) -> Bool {
        return lhs.neighbor == rhs.neighbor
    }
}

func connectedCell(matrix: [[Int]]) -> Int {
    var graph = Graph()
    func addEdge(node: Node, n: Int, m: Int) {
        guard (0..<matrix.count).contains(n) && (0..<matrix[n].count).contains(m) else { return }
        let neighbor = graph.addNode(position: (n,m), value: matrix[n][m])
        graph.addEdge(source: node, neighbor: neighbor)
    }
    for n in 0..<matrix.count {
        let row = matrix[n]
        for m in 0..<row.count {
            let node = graph.addNode(position: (n,m), value: matrix[n][m])
            for point in [(-1,-1),(-1,0),(-1,1),(0,-1),(0,1),(1,-1),(1,0),(1,1)] {
                addEdge(node: node, n: n + point.0, m: m + point.1)
            }
        }
    }
    //Depth First Search
    func dfs(_ graph: Graph, source: Node) -> [Int] {
        var nodesExplored = [source.value]
        source.visited = true
        for edge in source.neighbors {
            if edge.neighbor.value == 1 && edge.neighbor.visited == false {
                nodesExplored += dfs(graph, source: edge.neighbor)
            }
        }
        return nodesExplored
    }
    var max = 0
    for node in graph.nodes {
        let ret = dfs(graph, source: node).reduce(0, { (result, value) -> Int in
            return result + value
        })
        max = max > ret ? max : ret
    }
    return max
}

// in Discussions (vote 11)
func connectedCell2(matrix: [[Int]]) -> Int {
    var grid = [[Int]]()
    grid.append([Int](repeating: 0, count: matrix[0].count+2))
    for row in matrix {
        var newRow = [Int]()
        newRow.append(0)
        for e in row {
            newRow.append(e)
        }
        newRow.append(0)
        grid.append(newRow)
    }
    grid.append([Int](repeating: 0, count: matrix[0].count+2))
    for row in grid {
        print(row)
    }
    print("------------------ ↑ add an artificial boundary of 0 around the whole matrix")
    var max = 0
    for n in 1..<matrix.count {
        for m in 1..<matrix[n].count {
            var regionStack = [(Int,Int)]()
            if grid[n][m] == 1 {
                var currentRegionSize = 0
                regionStack.append((n,m))
                grid[n][m] = 0
                while regionStack.count != 0 {
                    print(regionStack)
                    if let region = regionStack.popLast() {
                        currentRegionSize += 1
                        for point in [(1,0),(0,1),(1,1),(-1,0),(0,-1),(-1,-1),(-1,+1),(+1,-1)] {
                            if grid[region.0 + point.0][region.1 + point.1] == 1 {
                                regionStack.append((region.0 + point.0, region.1 + point.1))
                                grid[region.0+point.0][region.1+point.1] = 0
                            }
                        }
                    }
                }
                if currentRegionSize > max {
                    max = currentRegionSize
                }
                print("------------------ ↑ dfs and element change 0 by visit")
                for row in grid {
                    print(row)
                }
                print("------------------ ↑ changed grid")
            }else{
                print("--- skip\(n,m) ---")
            }
        }
    }
    print("------------------")
    print("-----  End \(max) -----")
    print("------------------")
    return max
}

func connectedCellInGrid() {
    if let url = Bundle.main.url(forResource: "ConnectedCellInGrid", withExtension: "txt"), let text = try? String(contentsOf: url) {
        let arr = Array(text.split(separator: "\n").map{ $0.split(separator: " ").compactMap{ Int($0) }})
        let ret = connectedCell(matrix: arr)
        connectedCell2(matrix: arr)
        print(ret)
    }
}

connectedCellInGrid()


// in Discusions


