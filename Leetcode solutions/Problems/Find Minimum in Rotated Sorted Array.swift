//
//  Find Minimum in Rotated Sorted Array.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 16.03.2023.
//

import Foundation

// time: O(log n)
// space: O(1)
func findMin(_ nums: [Int]) -> Int {
    var l = 0
    var r = nums.count - 1
    var minVal = nums[0]

    while l <= r {

        if nums[l] <= nums[r] {
            minVal = min(minVal, nums[l])
            break
        }
        let m = (l + r) / 2
        minVal = min(minVal, nums[m])
        if nums[l] <= nums[m] { // left portion
            l = m + 1
        } else { // right portion
            r = m - 1
        }
    }

    return minVal
}
