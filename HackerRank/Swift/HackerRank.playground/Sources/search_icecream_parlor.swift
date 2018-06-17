import UIKit
import Foundation

// Ice Cream Parlor
// https://www.hackerrank.com/challenges/icecream-parlor/problem
// Date: 2018.06.11

public func icecreamParlor(m: Int, arr: [Int]) -> [Int] {
    var temp1 = (0,0)
    var temp2 = (0,0)
    var index = 0
    print("---")
    for price in arr {
        index += 1
        if price >= m {
            continue
        }
        var index2 = 0
        for price2 in arr {
            index2 += 1
            if price2 >= m {
                continue
            }
            if price + price2 <= m && index != index2 && temp1.0 + temp2.0 < price + price2 {
                temp1.0 = price
                temp1.1 = index
                temp2.0 = price2
                temp2.1 = index2
            }
        }
    }
    print(temp1.0+temp2.0)
    print(temp1,temp2)
    return [temp1.1,temp2.1]
}
