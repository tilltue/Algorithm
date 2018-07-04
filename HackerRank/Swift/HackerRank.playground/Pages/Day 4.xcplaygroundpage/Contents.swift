import Foundation

// Sherlock and Anagrams
// https://www.hackerrank.com/challenges/sherlock-and-anagrams/problem
// Date: 2018.07.02

//ifailuhkqq
//kkkk
/*
func sherlockAndAnagrams(s: String) -> Int {
    var string = Array(s)
    var anagrams = [(Int,String)]()
    for len in 1..<string.count {
//        print(len)//123
        for index in 0..<string.count-1 {
            if index + len > string.count - 1 {
                continue
            }
//            print(index,string[index...index+len-1])
            anagrams.append((index,String(string[index...index+len-1])))
        }
//        print("--")
    }
//    print(anagrams)
//    print("----- find anagrams -----")
    var ret = [((Int,String),(Int,String))]()
    for word in anagrams {
        let len = word.1.count
        for index in stride(from: string.count-1, to: word.0, by: -1) {
            if index + len - 1 > string.count - 1 {
                continue
            }
            var arr = Array(string[index...index+len-1])
            var stack = Array(word.1)
            while stack.count != 0 {
                if let char = stack.popLast() {
                    if let index = arr.index(of: char) {
                        arr.remove(at: index)
                    }
                }
            }
            
            if arr.count == 0 {
//                print("\(word.0,word.1) / \(index,String(string[index...index+len-1])))")
                ret.append((word, (index, String(string[index...index+len-1]))))
            }
        }
    }
    return ret.count
}
*/

func sherlockAndAnagrams(s: String) -> Int {
    var string = Array(s)
    var anagrams = [(Int,String)]()
    func findBackward(src: Array<Character>, char: Character) -> [Int] {
        print("findBackward:  \(char),\(src)")
        var searchIndexes = [Int]()
        for searchIndex in stride(from: src.count-1, to: -1, by: -1) {
            if src[searchIndex] == char {
                print("++\(searchIndex,src[searchIndex],char)")
                searchIndexes.append(searchIndex)
            }
        }
        return searchIndexes
    }
    for index in 0..<string.count {
        if index+1 > string.count-1 {
            break
        }
        print(index)
        let split = Array(string[index+1...string.count-1])
        //print(split)
        let findIndexes = findBackward(src: split, char: string[index])
        //첫번째 캐릭터 부터 찾는데 뒤에서부터 인덱스를 찾는다 찾는 순간 비교한다. 애너그램이 되는지. 글자수를 늘려가면서 비교. 중요한건, out of range 를 체크하는 로직. 단순하게 체크하는 것으로도 충분. 그리고, 같은 문자열인지 비교할때
        //ifai 비교시 i / i 비교 -> if / ai 비교 -> ifa / fai 비교.
        // ifa / fai 비교시 index 를 늘려가면서 i,f 가 서로 있는지, f,a 가 서로 있는지, a,i 가 서로 있는지. dictionary 를 사용하면 좋을듯.
        for findIndex in findIndexes {
        }
        /*
        if findIndexes.count > 0 {
            print((index,String(string[index])))
            anagrams.append((index,String(string[index])))
            for findIndex in findIndexes {
                if index != index+findIndex {
                    print(index,index+findIndex,string[index...index+findIndex])
                    anagrams.append((index,String(string[index...index+findIndex])))
                    anagrams.append((index+findIndex,String(split[findIndex])))
                    print((index+findIndex,String(split[findIndex])))
                }else {
                    anagrams.append((index+findIndex,String(string[index+findIndex])))
                    print((index+findIndex,String(string[index+findIndex])))
                }
            }
        }*/
    }
    print(anagrams)
    return 0
}

func sherlockAndAnagrams() {
    if let url = Bundle.main.url(forResource: "Sherlock", withExtension: "txt"), let text = try? String(contentsOf: url) {
        let arr = Array(text.split(separator: "\n").map{ String($0) })
        print(sherlockAndAnagrams(s: "kkkkkk"))
        //ifailuhkqq
    }
}

sherlockAndAnagrams()
