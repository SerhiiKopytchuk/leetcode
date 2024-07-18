//
//  Merge Intervals.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 16.07.2024.
//

import Foundation

// time: O(logN)
// space: O(n)
func merge(_ intervals: [[Int]]) -> [[Int]] {
    guard intervals.count > 1 else { return intervals }
    var intervals = intervals.sorted { $0[01] < $1[0] }

    var i = 1
    while i < intervals.count {
        let prev = intervals[i - 1]
        let cur = intervals[i]

        if prev[1] >= cur[0] && prev[0] <= cur[1] { // 2 intervals overlapping
            intervals[i - 1] = [min(prev[0], cur[0]), max(prev[1], cur[1])]
            intervals.remove(at: i)
            i -= 1
        }
        i += 1
    }

    return intervals
}
