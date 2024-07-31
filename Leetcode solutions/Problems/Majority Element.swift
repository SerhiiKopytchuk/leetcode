//
//  Majority Element.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 20.07.2024.
//

import Foundation

/// time: O(n)
/// space: O(1)
func majorityElement(_ nums: [Int]) -> Int {
        var res = nums[0]
        var count = 1

        for n in nums[1...] {
            if n == res {
                count += 1
            } else {
                count -= 1

                if count == -1 {
                    res = n
                    count = 1
                }
            }
        }

        return res
    }
