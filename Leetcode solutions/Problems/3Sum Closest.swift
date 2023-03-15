//
//  3Sum closest.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 15.03.2023.
//

import Foundation

// time: O(n^2)
// space: O(n)
func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
    var closest = nums[0] + nums[1] + nums[nums.count - 1]
    var nums = nums.sorted()

    for i in 0..<nums.count - 2 {
        var a = i + 1
        var b = nums.count - 1
        var curSum = nums[i] + nums[a] + nums[b]

        while a < b {
            curSum = nums[i] + nums[a] + nums[b]
            if curSum == target {
                return target
            } else if curSum < target {
                a += 1
            } else {
                b -= 1
            }
        }

        if abs(curSum - target) < abs(closest - target) {
            closest = curSum
        }
    }

    return closest
}
