//
//  Maximum Subarray.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 18.07.2024.
//

import Foundation

// time: O(n)
// space: O(1)
func maxSubArray(_ nums: [Int]) -> Int {
    var res = nums[0]
    var cur = 0

    for n in nums {

        if cur < 0 {
            cur = 0
        }

        cur += n

        res = max(res, cur)
    }

    return res
}
