//
//  Contains Duplicate.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 22.07.2024.
//

import Foundation

/// time: O(n)
/// space: O(n)
/// space: O(n)
func containsDuplicate(_ nums: [Int]) -> Bool {
    return Set(nums).count != nums.count
}
