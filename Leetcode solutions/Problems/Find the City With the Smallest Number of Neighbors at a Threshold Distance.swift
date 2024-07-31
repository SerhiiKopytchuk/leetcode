//
//  Find the City With the Smallest Number of Neighbors at a Threshold Distance.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 26.07.2024.
//

import Foundation

/// time: O(n^3)
/// space: O(n)
func findTheCity(_ n: Int, _ edges: [[Int]], _ th: Int) -> Int {
    var dist = (0..<n).map { r in
        (0..<n).map { c in
            r == c ? 0 : th + 1
        }
    }

    for e in edges {
        let (u, v, d) = (e[0], e[1], e[2])
        dist[u][v] = d
        dist[v][u] = d
    }

    for k in (0..<n) {
        for i in (0..<n) {
            for j in (0..<n) {
                dist[i][j] = min(dist[i][j], dist[i][k] + dist[k][j])
            }
        }
    }

    let cCount = dist.map { $0.filter { $0 <= th }.count }

    return cCount.lastIndex(of: cCount.min() ?? 0) ?? 0
}
