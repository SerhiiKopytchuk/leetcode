//
//  Two Sum II - Input Array Is Sorted.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 23.07.2024.
//

import Foundation

/// time: O(n)
/// space: O(1)
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var l = 0
    var r = nums.count - 1
    
    while l < r {
        if nums[l] + nums[r] > target {
            r -= 1
        } else if  nums[l] + nums[r] < target {
            l += 1
        } else {
            return [l + 1, r + 1]
        }
    }
    
    return []
}
