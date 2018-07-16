import Foundation

// Candies
// https://www.hackerrank.com/challenges/candies/problem
// Date: 2018.07.15

func candies(n: Int, arr: [Int]) -> Int {
    var candiesCount = [Int].init(repeating: 0, count: arr.count)
    candiesCount[0] = 1
    /* 타임아웃 발생, -> 로 순회하다가 1초기화 됐을때 앞쪽값을 비교해서 업데이트 하는 코드. 모든 값을 -> 로 순회하고 다시 <- 로 업데이트 해도 된다는 생각을 하지 못했을때 짠 코드.
    func backwardUpdate(pivot: Int) {
        guard pivot > 0 else { return }
        var done = true
        var index = 0
        while done {
            guard pivot-index > 0 else {
                return
            }
            let candyCount1 = candiesCount[pivot-index-1]
            let candyCount2 = candiesCount[pivot-index]
            let rank1 = arr[pivot-index-1]
            let rank2 = arr[pivot-index]
            if candyCount1 == candyCount2 && rank1 != rank2 {
                candiesCount[pivot-index-1] = candyCount1 + 1
                index += 1
            }else {
                done = false
            }
        }
    }*/
    //print(arr)
    for index in 0..<arr.count {
        if index > 0 {
            let forwardRank = arr[index-1]
            let rank = arr[index]
            if forwardRank > rank {
                if candiesCount[index-1] == 1 {
                    //backwardUpdate(pivot: index)
                }
                candiesCount[index] = 1
            }else if rank > forwardRank {
                candiesCount[index] = candiesCount[index-1] + 1
            }else {
                candiesCount[index] = 1
            }
            //print(candiesCount)
        }
    }
    //print("---")
    for i in 1...arr.count-1 {
        let index = arr.count - i
        let forwardRank = arr[index-1]
        let rank = arr[index]
        if forwardRank > rank && candiesCount[index-1] <= candiesCount[index] {
            candiesCount[index-1] = candiesCount[index] + 1
        }
        //print(candiesCount)
    }
    //print(candiesCount)
    var count = 0
    for e in candiesCount {
        count += e
    }
    return count
}

func candies() {
    if let url = Bundle.main.url(forResource: "Candies", withExtension: "txt"), let text = try? String(contentsOf: url) {
        let arr = Array(text.split(separator: "\n").compactMap{ Int($0) })
        print(candies(n: arr.count, arr: arr))
    }
}
candies()
