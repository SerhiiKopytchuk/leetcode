//
//  File.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 20.07.2024.
//

import Foundation

class NextPermutationSolved {
    /// time: O(n)
    /// space: O(1)
    func nextPermutation(_ nums: inout [Int]) {

        let p = getLastPeak(nums)

        if p == 0 {
            rotate(&nums, 0, nums.count - 1)
        } else {
            nums.swapAt(p - 1, smallestGreaterNumber(in: nums, after: p))
            rotate(&nums, p, nums.count - 1)
        }

    }

    func getLastPeak(_ nums: [Int]) -> Int {
        var r = nums.count - 1

        while r > 0, nums[r - 1] >= nums[r] {
            r -= 1
        }

        return r
    }

    func smallestGreaterNumber(in nums: [Int], after p: Int) -> Int {
        var minValue = nums[p]
        var l = p

        for i in p..<nums.count where nums[i] > nums[p - 1] && nums[i] <= minValue {
            l = i
            minValue = nums[i]
        }

        return l
    }

    func rotate(_ nums: inout[Int], _ l: Int, _ r: Int) {
        var l = l
        var r = r

        while l < r {
            nums.swapAt(l, r)
            l += 1
            r -= 1
        }
    }
}
