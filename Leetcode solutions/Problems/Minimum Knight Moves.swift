//
//  Minimum Knight Moves.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 22.03.2023.
//

import Foundation

/// time: O(max(x, y)^2)
/// space: O(max(x, y)^2)
func minKnightMoves(x: Int, y: Int) -> Int {
    if x == 0 && y == 0 { return 0 }
    let x = abs(x), y = abs(y)
    let dx = [-1, 1, 2, 2]
    let dy = [2, 2, -1, 1]
    var q = [[1,2], [2, 1]]
    var visited: Set<[Int]> = Set(q)
    var res = 1
    while !q.isEmpty {
        let qCount = q.count
        for _ in 0..<qCount {
            let cur = q.removeFirst()
            visited.insert([cur[0], cur[1]])

            if cur[0] == x && cur[1] == y {
                return res
            }

            for i in 0..<dx.count {
                let curX = cur[0] + dx[i], curY = cur[1] + dy[i]
                if curX < -2 || curY < -y { continue }
                q.append([curX, curY])
            }
        }
        res += 1
    }

    return res
}
