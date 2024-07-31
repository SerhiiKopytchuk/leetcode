//
//  Contains Duplicate II.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 22.07.2024.
//

import Foundation

// time: O(n)
 // space: O(k)
 func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
     var l = 0
     var r = min(nums.count - 1, k)
     var dict: [Int:Int] = [:]

     for i in 0...r {
         dict[nums[i], default: 0] += 1
         if dict[nums[i], default: 0] >= 2 {
             return true
         }
     }


     while r < nums.count - 1 {
         dict[nums[l], default: 1] -= 1

         l += 1
         r += 1

         dict[nums[r], default: 0] += 1

         if dict[nums[r], default: 0] >= 2 {
             return true
         }
     }

     return false
 }
