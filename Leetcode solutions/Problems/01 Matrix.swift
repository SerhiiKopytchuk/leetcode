//
//  01 Matrix.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 19.07.2024.
//

import Foundation

/// time: O(m*n)
/// space: O(m*n)
func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
    var mat = mat.map { $0.map { $0 == 0 ? 0 : Int.max }}
    var q: [[Int]] = []
    let dir = [[1,0],[0,1],[-1,0],[0,-1]]
    var visited: Set<[Int]> = []

    for r in mat.indices {
        for c in mat[0].indices where mat[r][c] == 0 {
            q.append([r, c])
            visited.insert([r, c])
        }
    }

    while q.isEmpty == false {
        for _ in 0..<q.count {
            let element = q.removeFirst()
            let r = element[0]
            let c = element[1]

            for d in dir {
                let x = r + d[0]
                let y = c + d[1]

                if x >= 0 && x < mat.count,
                   y >= 0 && y < mat[0].count,
                   visited.contains([x, y]) == false
                {
                    mat[x][y] = min(mat[x][y], mat[r][c] + 1)
                    visited.insert([x, y])
                    q.append([x, y])
                }
            }
        }
    }

    return mat
}

