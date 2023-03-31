//
//  Maximum Profit in Job Scheduling.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 31.03.2023.
//

import Foundation

/// time: O(nLog n)
/// space: O(n)
func jobScheduling(_ startTime: [Int], _ endTime: [Int], _ profit: [Int]) -> Int {
    let indices = startTime.indices

    let jobs = indices
        .map { i in
            return [startTime[i], endTime[i], profit[i]]
        }
        .sorted { $0[1] < $1[1] }

    let prev = indices
        .map { i -> Int in
            var l = 0
            var r = startTime.count - 1

            while l < r {
                let m = (l + r) / 2
                if jobs[m][1] <= jobs[i][0] {
                    l = m + 1
                } else {
                    r = m
                }
            }

            return l
        }

    var dp = Array(repeating: 0, count: startTime.count + 1)

    for i in 1..<dp.count {
        dp[i] = max(dp[i - 1], jobs[i - 1][2] + dp[prev[i - 1]])
    }

    return dp.last!
}
