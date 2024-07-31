//
//   Lucky Numbers in a Matrix.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 19.07.2024.
//

import Foundation

/// time: O(nm)
/// space: O(n+m)
func luckyNumbers (_ matrix: [[Int]]) -> [Int] {
    var minInRow: Set<Int> = []
    var maxInCol: Set<Int> = []
    let rows = matrix.count
    let cols = matrix[0].count

    for c in 0..<cols {
        var maxVal = matrix[0][c]
        for r in 0..<rows {
            maxVal = max(maxVal, matrix[r][c])
        }
        maxInCol.insert(maxVal)
    }

    for r in 0..<rows {
        var minVal = matrix[r][0]
        for c in 0..<cols {
            minVal = min(minVal, matrix[r][c])
        }
        minInRow.insert(minVal)
    }


    return Array(minInRow.intersection(maxInCol))
}
