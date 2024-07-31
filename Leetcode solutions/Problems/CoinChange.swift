//
//  CoinChange.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 31.07.2024.
//

import Foundation

/// time: O(c*a)
/// space: O(amount)
func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    guard amount != 0 else { return 0 }

    var dp = Array(repeating: amount + 1, count: amount + 1)
    dp[0] = 0

    for a in 1...amount {
        for c in coins where a - c >= 0 {
            dp[a] = min(dp[a], 1 + dp[a - c])
        }
    }

    return dp[amount] == (amount + 1) ? -1 : dp[amount]
}

