//
//  Set Matrix Zeros.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 13.03.2023.
//

import SwiftUI

// time: O(n*m)
// space: O(1)
func setZeroes(_ matrix: inout [[Int]]) {
    guard matrix.count >= 1, matrix[0].count >= 1 else { return }
    var zeroTop = false
    // read matrix

    for r in 0..<matrix.count {
        for c in 0..<matrix[0].count where matrix[r][c] == 0 {
            matrix[0][c] = 0

            if r > 0 {
                matrix[r][0] = 0
            } else {
                zeroTop = true
            }
        }
    }

    // generate matrix
    for r in 1..<matrix.count {
        for c in 1..<matrix[0].count where matrix[0][c] == 0 || matrix[r][0] == 0 {
               matrix[r][c] = 0
        }
    }

    if matrix[0][0] == 0 {
        for r in 0..<matrix.count {
            matrix[r][0] = 0
        }
    }

    if zeroTop {
        for c in 0..<matrix[0].count {
            matrix[0][c] = 0
        }
    }
}
