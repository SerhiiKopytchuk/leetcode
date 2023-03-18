//
//  Non-overlapping Intervals.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 18.03.2023.
//

import Foundation

/// time: O(nLogN)
/// space: O(n)
func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
    let intervals = intervals.sorted { $0[0] < $1[0]}
    var prevEnd = intervals[0][1]
    var count = 0

    for i in 1..<intervals.count {
        let start = intervals[i][0]
        let end = intervals[i][1]

        if start >= prevEnd {
            prevEnd = end
        } else {
            count += 1
            prevEnd = min(prevEnd, end)
        }
    }

    return count
}
