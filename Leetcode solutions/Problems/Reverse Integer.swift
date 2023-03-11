//
//  Reverse Integer.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 11.03.2023.
//

import Foundation

// time: O(1)
// space: O(1)
func reverse(_ x: Int) -> Int {
    var res = 0
    var x = x

    while x != 0 {
        var digit = x % 10
        x = x / 10

        if (res > Int32.max / 10 || (res == Int32.max / 10 && digit >= Int32.max % 10)) {
            return 0
        }
        if (res < Int32.min / 10 || (res == Int32.min / 10 && digit <= Int32.min % 10)) {
            return 0
        }

        res = (res * 10) + digit
    }

    return res
}
