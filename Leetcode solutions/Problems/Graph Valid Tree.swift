//
//  Graph Valid Tree.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 20.03.2023.
//

import Foundation

// time: O(E + V)
// memory: O(E + V)
func validTree(_ n: Int, _ edges: Array<Array<Int>>) -> Bool {
    guard !edges.isEmpty else { return true }
    var graph = [Int:Set<Int>]()
    var visited:Set<Int> = []

    for edge in edges {
        graph[edge[0], default: []].insert(edge[1])
        graph[edge[1], default: []].insert(edge[0])
    }

    func dfs(_ node: Int,_ prev: Int) -> Bool {
        if visited.contains(node) { return false }
        visited.insert(node)
        for adj in graph[node, default: []] where adj != prev {
            if !dfs(adj, node) {
                return false
            }
        }
        return true
    }

    return dfs(edges[0][0], -1) && visited.count == n
}
