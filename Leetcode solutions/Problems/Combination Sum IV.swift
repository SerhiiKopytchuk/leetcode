//
//  Combination Sum IV.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 17.03.2023.
//

import Foundation

// time: O(n * m)
// space: O(target + 1)
func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
    var dp: [Int: Double] = [0: 1]

    for total in (1...target) {
        dp[total] = 0.0
        for n in nums {
            dp[total, default: 0.0] += dp[total - n, default: 0.0]
        }
    }

    return Int(dp[target, default: 0.0])
}
