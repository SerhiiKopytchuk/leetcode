//
//  Build a Matrix With Conditions.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 22.07.2024.
//

import Foundation

/// time: O(n)
/// space: O(n)
func buildMatrix(_ k: Int, _ rowConditions: [[Int]], _ colConditions: [[Int]]) -> [[Int]] {
    var mat = Array(repeating: Array(repeating: 0, count: k), count: k)
    let sortedRows = sort(Array(1...k), rowConditions)
    let sortedCols = sort(Array(1...k), colConditions)
    guard sortedRows.isEmpty == false, sortedCols.isEmpty == false else { return [] }

    for i in 1...k {
        if let r = sortedRows.firstIndex(of: i), let c = sortedCols.firstIndex(of: i) {
            mat[r][c] = i
        }
    }

    return mat
}


func sort(_ nodes: [Int], _ edges: [[Int]]) -> [Int] {
    var graph: [Int:[Int]] = [:]
    var pointers: [Int: Int] = [:]
    var res: [Int] = []
    var q: [Int] = []

    for n in nodes {
        pointers[n] = 0
        graph[n] = []
    }

    for e in edges {
        graph[e[0], default:[]].append(e[1])
        pointers[e[1], default: 0] += 1
    }

    for (key, value) in pointers where value == 0 {
        q.append(key)
    }

    while !q.isEmpty {
        let first = q.removeFirst()
        res.append(first)

        for n in graph[first] ?? [] {
            pointers[n, default: 1] -= 1
            if pointers[n, default: 1] == 0 {
                q.append(n)
            }
        }

    }

    return res.count == nodes.count ? res :[]
}
