//
//  Trapping Rain Water.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 28.03.2023.
//

import Foundation

/// time: O(n)
/// space: O(1)
func trap(_ height: [Int]) -> Int {
    guard !height.isEmpty else { return 0 }
    var l = 0, r = height.count - 1
    var leftMax = height[l], rightMax = height[r]
    var res = 0

    while l < r {
        if leftMax <= rightMax {
            l += 1
            leftMax = max(leftMax, height[l])
            res += leftMax - height[l]
        } else {
            r -= 1
            rightMax = max(rightMax, height[r])
            res += rightMax - height[r]
        }
    }

    return res
}

