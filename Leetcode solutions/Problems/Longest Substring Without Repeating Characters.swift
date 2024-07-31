//
//  Longest Substring Without Repeating Characters.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 22.07.2024.
//

import Foundation

/// time: O(n)
/// space: O(n)
func lengthOfLongestSubstring(_ s: String) -> Int {
    let s = Array(s)
    var res = 0
    var dict:[Character:Int] = [:]
    var l = 0
    var r = 0
    
    while r < s.count {
        dict[s[r], default: 0] += 1
        
        while dict[s[r], default: 0] >= 2 {
            dict[s[l], default: 0] -= 1
            l += 1
        }
        
        r += 1
        res = max(res, r - l)
    }
    
    return res
}
