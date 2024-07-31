//
//  Maximal Rectangle.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 26.07.2024.
//

import Foundation

// time: O(m*n)
// time: O(m)
func maximalRectangle(_ matrix: [[Character]]) -> Int {
    var maxArea = 0
    var curHist: [Int] = Array(repeating: 0, count: matrix[0].count)

    for r in matrix.indices {
        for c in matrix[0].indices {
            if matrix[r][c] == "1" {
                curHist[c] += 1
            } else {
                curHist[c] = 0
            }
        }

        maxArea = max(maxArea, largestRectangleArea(curHist))
    }

    return maxArea
}

/// time: O(n)
/// space: O(n)
//func largestRectangleArea(_ heights: [Int]) -> Int {
//    guard heights.count > 1 else { return heights[0] }
//
//    var res = 0
//    var stack:[(Int, Int)] = []
//
//    for (i, h) in heights.enumerated() {
//        var start = i
//        while !stack.isEmpty && stack.last!.1 > h {
//            let (index, height) = stack.removeLast()
//            res = max(res, height * (i - index))
//            start = index
//        }
//        stack.append((start, h))
//    }
//
//    for (i, h) in stack {
//        res = max(res, h * (heights.count - i))
//    }
//
//    return res
//}
