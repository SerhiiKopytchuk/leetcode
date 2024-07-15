//
//  Path Sum II.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 15.07.2024.
//

import Foundation

/// time: O(E+V)
/// space: O(n)
func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
    guard let root else { return [] }
    var res: [[Int]] = []

    func dfs(_ path: [Int], _ val: Int, _ node: TreeNode?) {
        guard let node else { return }
        let newPath = path + [node.val]
        let newVal = val + node.val

        if newVal == targetSum && node.left == nil && node.right == nil {
            res.append(newPath)
            return
        }

        dfs(newPath, newVal, node.left)
        dfs(newPath, newVal, node.right)
    }
    dfs([], 0, root)

    return res
}
