//
//  House Robber.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 18.07.2024.
//

import Foundation

/// time: O(n)
/// space: O(1)
func rob(_ nums: [Int]) -> Int {
    var p = 0
    var c = 0

    for n in nums {
        let n = max(n + p, c)
        p = c
        c = n
    }

    return c
}
