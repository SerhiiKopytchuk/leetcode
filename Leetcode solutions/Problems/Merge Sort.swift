//
//  Merge Sort.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 25.07.2024.
//

import Foundation

/// time: O(nLogn))
/// space: O(n)
func sortArray(_ nums: [Int]) -> [Int] {
    guard nums.count > 1 else { return nums }

    let middle = nums.count / 2
    let left = sortArray(Array(nums[0..<middle]))
    let right = sortArray(Array(nums[middle..<nums.count]))

    return merge(left, right)
}

private func merge(_ left: [Int], _ right: [Int]) -> [Int] {
    var res: [Int] = []
    var l = 0
    var r = 0

    while l < left.count && r < right.count {
        let lValue = left[l]
        let rValue = right[r]

        if lValue < rValue {
            res.append(lValue)
            l += 1
        } else if lValue > rValue {
            res.append(rValue)
            r += 1
        } else {
            res.append(lValue)
            l += 1
            res.append(rValue)
            r += 1
        }

    }

    while l < left.count {
        res.append(left[l])
        l += 1
    }

    while r < right.count {
        res.append(right[r])
        r += 1
    }

    return res
}
