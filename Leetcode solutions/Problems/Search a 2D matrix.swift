//
//  Search a 2D matrix.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 09.03.2023.
//

import Foundation

// time: O(log(n))
// space: O(1)
func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    let rows = matrix.count
    let cols = matrix[0].count

    var t = 0, b = rows - 1

    while t < b {
        let m = (t + b) / 2
        if matrix[m][0] > target {
            b = m - 1
        } else if matrix[m][cols - 1] < target{
            t = m + 1
        } else {
            t = m
            break
        }
    }


    var l = 0, r = cols - 1

    while l < r {
        let m = (l + r) / 2
        if matrix[t][m] > target {
            r = m - 1
        } else if matrix[t][m] < target {
            l = m + 1
        } else {
            return true
        }
    }

    return matrix[t][l] == target
}
