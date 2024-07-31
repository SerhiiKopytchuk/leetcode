//
//  Sort Array by Increasing Frequency.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 23.07.2024.
//

import Foundation

// time: O(nlogn)
// space: O(n)
func frequencySort(_ nums: [Int]) -> [Int] {
    return nums.reduce(into: [:]) {
        $0[$1, default:0] += 1
    }.sorted {
        if $0.value == $1.value {
            $0.key > $1.key
        } else {
            $0.value < $1.value
        }
    }
    .map {
        Array(repeating: $0, count: $1)
    }
    .flatMap { $0 }
}
