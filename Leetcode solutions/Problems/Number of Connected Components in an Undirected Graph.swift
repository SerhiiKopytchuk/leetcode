//
//  Number of Connected Components in an Undirected Graph.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 21.03.2023.
//

import Foundation

// time: O(n)
// space: O(n)
func countComponents(n: Int, edges:[[Int]]) -> Int {
    guard n > 0 else { return 0 }
    var par:[Int] = []
    var rank = Array(repeating: 1, count: n)
    for i in 0..<n {
        par.append(i)
    }

    func find(_ n1: Int) -> Int {
        var res = n1

        while res != par[res] {
            par[res] = par[par[res]]
            res = par[res]
        }

        return res
    }

    func union(_ n1: Int, _ n2: Int) -> Int {
        var p1 = find(n1), p2 = find(n2)

        guard p1 != p2 else { return 0 }

        if rank[p1] > rank[p2] {
            par[p2] = p1
            rank[p1] += rank[p2]
        } else {
            par[p1] = p2
            rank[p2] += rank[p1]
        }
        return 1
    }

    var res = n
    for edge in edges {
        res -= union(edge[0], edge[1])
    }

    return res
}
