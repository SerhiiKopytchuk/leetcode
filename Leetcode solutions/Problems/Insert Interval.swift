//
//  Insert Interval.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 16.07.2024.
//

import Foundation

/// time: O(n)
/// space: O(n)
func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
    var res = [[Int]]()
    var cur = newInterval
    
    for i in 0..<intervals.count {
        if cur[0] > intervals[i][1] {
            res.append(intervals[i])
        } else if cur[1] < intervals[i][0] {
            res.append(cur)
            return res + intervals[i..<intervals.count]
        } else {
            cur = [min(cur[0], intervals[i][0]), max(cur[1], intervals[i][1])]
        }
    }
    res.append(cur)
    return res
}
