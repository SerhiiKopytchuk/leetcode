//
//  Gas Station.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 19.07.2024.
//

import Foundation

/// time: O(n)
/// space: O(1)
func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
    guard gas.reduce(0, +) >= cost.reduce(0, +) else { return -1 }
    var total = 0
    var res = 0

    for i in 0..<gas.count {
        total += gas[i] - cost[i]

        if total < 0 {
            res = i + 1
            total = 0
        }
    }

    return res
}
