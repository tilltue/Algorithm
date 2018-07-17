import Foundation

// Candies
// https://www.hackerrank.com/challenges/candies/problem
// Date: 2018.07.15

//[2,4,4,4,3,1,2,6,7,4,5]
//[1,2,1,3,2,1,2,3,4,1,2] = 22
// up  1 -> 1,2     = 2
// same 2 -> 1,1,1  = 3
// down 2 -> 1,2,3  = 5
// up 3 -> 1,2,3,4  = 9
// down 1 -> 1,2    = 2
// up 1 -> 1,2      = 2 = 23 - 1 = 22
// 19
//[2,4,3,5,2,6,4,5]
// up  1 -> 1,2 = 2
//down 1 -> 1,2 = 2
// up  1 -> 1,2 = 2
//down 1 -> 1,2 = 2
//up   1 -> 1,2 = 2
//down 1 -> 1,2 = 2
//up   1 -> 1,2 = 2 = 14-1
//[8,7,6,5,4,3,2,1]
//[8,7,6,5,4,3,2,1]
// down 7 -> 1,2,3,4,5,6,7,8 = 35

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
///candies()

// Encryption
// https://www.hackerrank.com/challenges/encryption/problem
// Date: 2018.07.17
/*
 이 문제의 핵심은 무엇일까? col / row 만 잘 구해주면 쉽게 완료되는 문제인데...
 아래 col 을 구하는 과정을 알고리즘 사용해서 해야하나?
 루트값을 구하는 계산식을 만들고 반올림 함수를 만드는?
*/
func sqrtRoundInt(_ number: Int) -> Int {
    let num = Double(number)
    var temp: Double = 1
    while (-0.01 > temp * temp - num) || (temp * temp - num > 0.01) {
        temp = 0.5 * (temp + num / temp)
    }
    if Int(temp) - Int(temp * 10) > 5 {
        return Int(temp) + 1
    }
    return Int(temp)
}

func encryption(s: String) -> String {
    let text = s.replacingOccurrences(of: " ", with: "")
    //let col = Int(round(sqrt(Double(text.count))))
    let col = sqrtRoundInt(text.count)
    let row = text.count - (col * col) > 0 ? col + 1 : col
//    print(text,sqrt(Double(text.count)))
//    print(col,"x",row)
    let arr = Array(text)
    var ret = ""
    for i in 0..<row {
        for j in 0..<col {
            let index = j*row+i
            if index > text.count + (row-1) {
                return ret
            }
//            print(index)
            if index < arr.count {
                ret += String(arr[j*row+i])
            }
        }
        ret += " "
    }
    return ret
}

func encryption() {
    if let url = Bundle.main.url(forResource: "Encryption", withExtension: "txt"), let text = try? String(contentsOf: url) {
        print(encryption(s: text.replacingOccurrences(of: "\n", with: "")))
    }
}
encryption()

