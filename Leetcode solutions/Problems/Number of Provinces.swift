//
//  Number of Provinces.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 22.03.2023.
//

import Foundation

/// time: O(n)
/// space: O(n)
func findCircleNum(_ matrix: [[Int]]) -> Int {
    let n = matrix[0].count
    var rank = Array(repeating: 1, count: n)
    var par:[Int] = []

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
        let p1 = find(n1), p2 = find(n2)
        if p1 == p2 {
            return 0
        }

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
    for r in 0..<matrix.count {
        for c in 0..<matrix[0].count where r != c && matrix[r][c] == 1 {
            res -= union(r, c)
        }
    }

    return res
}
