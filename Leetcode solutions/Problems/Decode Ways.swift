//
//  Decode Ways.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 11.03.2023.
//

import Foundation

// time: O(n)
// space: O(1)
func numDecodings(_ s: String) -> Int {
    var s = Array(s)
    var cur = 0, plus1 = 1, plus2 = 0

    for i in (0..<s.count).reversed() {
        if s[i] != "0" {
            cur += plus1
        }

        if i + 1 < s.count && (s[i] == "1" ||
        (s[i] == "2" && s[i+1] <= "6")) {
            cur += plus2
        }
        plus2 = plus1
        plus1 = cur
        cur = 0
    }

    return plus1
}
