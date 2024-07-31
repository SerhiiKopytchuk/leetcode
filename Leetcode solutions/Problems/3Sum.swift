//
//  3Sum.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 23.07.2024.
//

import Foundation

/// time: O(n^2)
/// space: O(n)
func threeSum(_ nums: [Int]) -> [[Int]] {
    guard nums.count > 2 else { return [] }
    var res: Set<[Int]> = []
    let nums = nums.sorted()

    for i in nums.indices where nums[i] <= 0 {
        var l = i + 1
        var r = nums.count - 1

        while l < r {
            if nums[i] + nums[l] + nums[r] < 0 {
                l += 1
            } else if nums[i] + nums[l] + nums[r] > 0 {
                r -= 1
            } else {
                res.insert([nums[i],nums[l],nums[r]])
                l += 1
            }
        }
    }

    return Array(res)
}
