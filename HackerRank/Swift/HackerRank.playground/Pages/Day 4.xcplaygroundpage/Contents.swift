import Foundation

// Sherlock and Anagrams
// https://www.hackerrank.com/challenges/sherlock-and-anagrams/problem
// Date: 2018.07.02

//ifailuhkqq
//kkkk

func sherlockAndAnagrams(s: String) -> Int {
    var string = Array(s)
    var ret = 0
    var dict = [String:Int]()
    for index in 0..<string.count {
        for len in 0..<string.count-index {
            let str = String(string[index...index+len].sorted())
            if let value = dict[str] {
                dict[str] = value + 1
            }else {
                dict[str] = 1
            }
        }
    }
    dict = dict.filter{ $0.value > 1 }
    ret = dict.reduce(0) { (result, dict) -> Int in
        let sum = Array(1...(dict.value-1)).reduce(0, { (result, e) -> Int in
            return result + e
        })
        return result + sum
    }
    return ret
}

func sherlockAndAnagrams() {
    if let url = Bundle.main.url(forResource: "Sherlock", withExtension: "txt"), let text = try? String(contentsOf: url) {
        let arr = text.split(separator: "\n").map{ String($0) }
        for string in arr {
            print(sherlockAndAnagrams(s: String(string)))
        }
    }
}
//a,b,c
//a,b b,c a,c
sherlockAndAnagrams()

// New Year Chaos
// https://www.hackerrank.com/challenges/new-year-chaos/problem
// Date: 2018.07.02

struct Person {
    var bribeCount: Int
    var id: Int
    init(id: Int) {
        self.bribeCount = 0
        self.id = id
    }
}

func minimumBribes(q: [Int]) -> Void {
    print(q)
    // 정답은: array 를 순회하면서 자기보다 앞에 있는 값중 높은 값이 있다면 카운트를 증가시키면서 값을 구하면 된다. 이상태에서 to chaotic 만 찾아내면 됨.
    // 풀지는 못함
//    var persons = [Int: Person]()
//    q.sorted().map{ Person(id: $0) }.forEach { (person) in
//        persons.updateValue(person, forKey: person.id)
//    }
//    var pivot = 0
//    var chaotic = false
//    func swap(to: Int, from: Int) {
//        if var toPerson = persons[to], let fromPerson = persons[from] {
//            persons[to] = fromPerson
//            toPerson.bribeCount += 1
//            persons[from] = toPerson
//        }
//    }
//    while chaotic == false && pivot < q.count {
//        for index in 0..<q.count {
//            if q[index] == persons[index]?.id {
//                print(index,q[index])
//                chaotic = true
//            }
//        }
//        chaotic = true
//                print(pivot)
//                pivot += 1
//                break
//            }else {
//
//            }
//            print(pivot,index)
//            if persons[index].bribeCount < 2 {
//                print("---")
//                print(persons.map{ $0.id })
//                print("---")
//            }else {
////                print("chaotic \(persons[index])")
//                print("Too chaotic")
//                chaotic = true
//                break
//            }
//        }
//    }
//    if chaotic == false {
//        var bribeCount = 0
//        for bribePerson in (persons.filter{ $0.bribeCount > 0 }) {
//            bribeCount += bribePerson.bribeCount
//        }
//        print(bribeCount)
//    }
}

func newYearChaos() {
    if let url = Bundle.main.url(forResource: "NewYearChaos", withExtension: "txt"), let text = try? String(contentsOf: url) {
        let arr = Array(text.split(separator: "\n").map{ $0.split(separator: " ").compactMap{ Int($0) }})
        for test in arr {
            minimumBribes(q: test)
        }
    }
}

newYearChaos()
