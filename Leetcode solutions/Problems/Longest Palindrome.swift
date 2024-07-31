//
//  Longest Palindrome.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 18.07.2024.
//

import Foundation

/// time: O(n)
/// space: O(n)
func longestPalindrome(_ s: String) -> Int {
    var map:[Character: Int] = [:]
    var res = 0

    for c in s {
        map[c, default: 0] += 1
    }

    for key in map.keys {
        if map[key, default: 0] % 2 == 0 {
            res += map[key, default: 0]
            map[key] = nil
        } else {
            res += map[key, default: 0] - 1
        }
    }

    return map.isEmpty ? res : res + 1
}
