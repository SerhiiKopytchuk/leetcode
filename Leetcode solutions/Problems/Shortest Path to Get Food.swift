//
//  Shortest Path to Get Food.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 18.03.2023.
//

import Foundation

/// time: O(n * m)
/// space:  O(n * m)
func getFood(_ grid:[[String]]) -> Int {
    var visited:Set<[Int]> = []
    var count = 0
    var q:[[Int]] = []

    for i in 0..<grid.count {
        for j in 0..<grid[0].count where grid[i][j] == "*" {
            q.append([i, j])
            break
        }
    }

    while !q.isEmpty {
        let qCount = q.count
        for _ in 0..<qCount {
            let cur = q.removeFirst()
            let r = cur[0]
            let c = cur[1]
            if 0 <= r && r < grid.count,
               0 <= c && c < grid[0].count,
               !visited.contains([r, c]) {
                if grid[r][c] == "#" {
                    return count
                } else if grid[r][c] == "O" || grid[r][c] == "*" {
                    q.append([r + 1, c])
                    q.append([r - 1, c])
                    q.append([r, c + 1])
                    q.append([r, c - 1])
                }
            }
            visited.insert(cur)
        }
        count += 1
    }

    return -1
}
