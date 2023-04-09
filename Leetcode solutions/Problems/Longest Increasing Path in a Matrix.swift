//
//  Longest Increasing Path in a Matrix.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 09.04.2023.
//

import Foundation

/// time: O(n)
/// space: O(n)
func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
    let rows = matrix.count, cols = matrix[0].count
    var dp = Array(repeating: Array(repeating: -1, count: cols), count: rows)

    func dfs(_ r: Int,_ c: Int, _ prev: Int) -> Int {
        guard 0 <= r && r < rows,
              0 <= c && c < cols,
              prev < matrix[r][c] else { return 0 }

        if dp[r][c] != -1 {
            return dp[r][c]
        }

        var res = 1
        res = max(res, 1 + dfs(r + 1, c, matrix[r][c]))
        res = max(res, 1 + dfs(r - 1, c, matrix[r][c]))
        res = max(res, 1 + dfs(r, c + 1, matrix[r][c]))
        res = max(res, 1 + dfs(r, c - 1, matrix[r][c]))
        dp[r][c] = res
        return res

    }

    for i in 0..<rows {
        for j in 0..<cols {
            _ = dfs(i, j, -1)
        }
    }

    return dp.reduce(into: 0) {res, cur in
        res = max(res, cur.max() ?? 1)
    }
}
