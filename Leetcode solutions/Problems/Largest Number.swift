//
//  Largest Number.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 10.03.2023.
//

import Foundation

// time: O(nLog(n))
// space: O(n)
func largestNumber(_ nums: [Int]) -> String {
    var onlyZeros = true
    nums.forEach {
        if $0 != 0 {
            onlyZeros = false
        }
    }
    guard !onlyZeros else { return "0"}
    return nums
        .map { String($0) }
        .sorted { firstNum, secondNum in
            return firstNum + secondNum > secondNum + firstNum
        }
        .joined(separator: "")
}
