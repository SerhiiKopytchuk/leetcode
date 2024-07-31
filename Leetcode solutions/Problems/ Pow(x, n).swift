//
//   Pow(x, n).swift
//  Problems
//
//  Created by Serhii Kopytchuk on 09.03.2023.
//

import Foundation

// time: O(log(n))
// space: O(1)
func myPow(_ x: Double, _ n: Int) -> Double {
    guard n != 0, x != 1 else { return 1.0 }
    guard x != 0 else { return 0.0 }

    var x = x, n = n, res = 1.0

    if n < 0 {
        x = 1.0/x
        n = -n
    }

    while n > 0 {
        if n%2 != 0 {
            res *= x
        }
        x *= x
        n /= 2
    }

    return res
}
