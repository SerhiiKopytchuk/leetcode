//
//  Sort the Jumbled Numbers.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 24.07.2024.
//

import Foundation

/// time: O(nlogn)
/// space: O(n)
func sortJumbled(_ mapping: [Int], _ nums: [Int]) -> [Int] {
    var res: [[Int]] = []
    for n in nums {
        let digits = toDigits(n)
        var m = 0

        for d in digits {
            m = m * 10 + mapping[d]
        }
        res.append([n, m])
    }

    return res
        .sorted { $0[1] < $1[1] }
        .map { $0[0] }
}

private func toDigits(_ num: Int) -> [Int] {
    guard num != 0 else { return [0] }
    var num = num
    var res: [Int] = []
    
    while num > 0 {
        res.append(num % 10)
        num /= 10
    }

    return res.reversed()
}
