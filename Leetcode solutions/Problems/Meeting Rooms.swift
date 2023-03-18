//
//  Meeting Rooms.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 18.03.2023.
//

import Foundation

// time: O(nLog n)
// space: O(n)
func canAttendMeetings(_ intervals:[[Int]]) -> Bool {
    let intervals = intervals.sorted{ $0[0] < $1[0]}
    var prevEnd = intervals[0][1]

    for i in 1..<intervals.count {
        if intervals[i][0] < prevEnd {
            return false
        } else {
            prevEnd = intervals[i][0]
        }
    }

    return true
}
