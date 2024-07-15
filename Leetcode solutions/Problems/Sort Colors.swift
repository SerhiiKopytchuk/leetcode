//
//  Sort Colors.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 15.07.2024.
//

import Foundation

/// time: O(n)
/// space: O(1)
func sortColors(_ nums: inout [Int]) {
    var l = 0
    var r = nums.count - 1
    var i = l

    while i <= r {
        if nums[i] == 2 && i < r {
            (nums[i], nums[r]) = (nums[r], nums[i])
            r -= 1
        } else if nums[i] == 0 && i > l {
            (nums[l], nums[i]) = (nums[i], nums[l])
            l += 1
        } else {
            i += 1
        }
    }
}
