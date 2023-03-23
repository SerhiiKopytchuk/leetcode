//
//   Meeting Rooms II.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 23.03.2023.
//

import Foundation

/// time: O(n logn)
/// space: O(n)
func minMeetingRooms(_ intervals: [[Int]]) -> Int {
    guard intervals.count > 1 else { return intervals.count }
    var start: [Int] = []
    var end: [Int] = []
    for interval in intervals {
        start.append(interval[0])
        end.append(interval[1])
    }
    start = start.sorted()
    end = end.sorted()
    var res = 0
    var count = 0
    var s = 0
    var e = 0

    while s < intervals.count {

        if start[s] < end[e] {
            count += 1
            s += 1
        } else {
            count -= 1
            e += 1
        }
        res = max(count, res)
    }
    return res
}
