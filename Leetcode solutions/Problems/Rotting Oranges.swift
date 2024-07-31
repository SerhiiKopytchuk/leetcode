//
//  Rotting Oranges.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 12.07.2024.
//

import Foundation

/// time: O(n)
/// space: O(n)
func orangesRotting(_ grid: [[Int]]) -> Int {
    var time = 0
    var grid = grid
    var q: [[Int]] = [] // [point]
    let dirs = [[0, 1],[1, 0],[-1, 0],[0, -1]]
    var freshOranges = 0

    for i in 0..<grid.count {
        for j in 0..<grid[0].count {
            if grid[i][j] == 2 {
                q.append([i, j])
            } else if grid[i][j] == 1 {
                freshOranges += 1
            }

        }
    }

    if freshOranges == 0 {
        return 0
    }

    while q.isEmpty == false {
        for _ in 0..<q.count {
            let first = q.removeFirst()
            let curX = first[0]
            let curY = first[1]

            for dir in dirs {
                let newX = curX + dir[0]
                let newY = curY + dir[1]
                if newX >= 0, newX < grid.count,
                   newY >= 0, newY < grid[0].count,
                   grid[newX][newY] == 1 {
                    grid[newX][newY] = 2
                    q.append([newX, newY])
                    freshOranges -= 1
                }
            }
        }

        time += 1
    }

    return freshOranges == 0 ? time - 1 : -1
}
