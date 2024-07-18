//
//  First Bad Version.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 18.07.2024.
//

import Foundation

/// time: O(logN)
/// space: O(1)
func firstBadVersion(_ n: Int) -> Int {
    var l = 0
    var r = n

    while l <= r {
        let m = (l + r) / 2
        if isBadVersion(m) {
            r = m - 1
        } else {
            l = m + 1
        }
    }

    return l
}

// The knows API is defined in the parent class VersionControl
func isBadVersion(_ version: Int) -> Bool {
    version > 3
}
