//
//  Climbing Stairs.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 12.07.2024.
//

import Foundation

/// time: O(n)
/// space: O(1)
func climbStairs(_ n: Int) -> Int {
    guard n > 3 else { return n }
    var last = 3
    var current = 5

    for i in 3..<n {
        let cur = current
        current += last
        last = cur
    }

    return last
}
