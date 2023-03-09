//
//  Longest Repeating Character Replacement.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 09.03.2023.
//

import Foundation

// time: O(n)
// space: O(1)
func characterReplacement(_ s: String, _ k: Int) -> Int {
    var s = Array(s)
    var map:[Character:Int] = [:]
    var res = 0
    var l = 0
    var maxf = 0

    for r in 0..<s.count {
        map[s[r], default: 0] += 1
        maxf = max(maxf, map[s[r], default: 0])

        while (r - l + 1) - maxf > k {
            map[s[l], default: 0] -= 1
            l += 1
        }

        res = max(res, r - l + 1)
    }

    return res
}
