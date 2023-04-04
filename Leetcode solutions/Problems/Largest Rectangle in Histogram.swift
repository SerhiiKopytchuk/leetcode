//
//  Largest Rectangle in Histogram.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 04.04.2023.
//

import Foundation

/// time: O(n)
/// space: O(n)
func largestRectangleArea(_ heights: [Int]) -> Int {
    guard heights.count > 1 else { return heights[0] }

    var res = 0
    var stack:[(Int, Int)] = []

    for (i, h) in heights.enumerated() {
        var start = i
        while !stack.isEmpty && stack.last!.1 > h {
            let (index, height) = stack.removeLast()
            res = max(res, height * (i - index))
            start = index
        }
        stack.append((start, h))
    }

    for (i, h) in stack {
        res = max(res, h * (heights.count - i))
    }

    return res
}
