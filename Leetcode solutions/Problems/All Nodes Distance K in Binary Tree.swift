//
//  All Nodes Distance K in Binary Tree.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 15.03.2023.
//

import Foundation

// time: O(n)
// space: O(n)
func distanceK(_ root: TreeNode?, _ target: TreeNode?, _ k: Int) -> [Int] {
    guard let root = root, let target = target else { return [] }
    var graph = [Int:Set<Int>]()
    var visited: Set<Int> = []

    // fill graph
    func dfs(_ node: TreeNode?, _ parent: Int?) {
        guard node != nil else { return }
        if parent != nil {
            graph[node!.val, default: []].insert(parent!)
            graph[parent!, default: []].insert(node!.val)
        }
        dfs(node?.left, node?.val)
        dfs(node?.right, node?.val)
    }

    dfs(root, nil)

    // find nodes with k distance
    var q:[Int] = [target.val]
    var count = 0

    while !q.isEmpty && count != k {
        var c = q.count
        for _ in 0..<c {
            let cur = q.removeFirst()
            visited.insert(cur)
            for adj in graph[cur] ?? [] where !visited.contains(adj) {
                q.append(adj)
            }
        }
        count += 1
    }



    return q
}
