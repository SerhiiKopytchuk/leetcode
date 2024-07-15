//
//  Balanced Binary Tree.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 15.07.2024.
//

import Foundation

/// time: O(n)
/// space: O(E+V)
func isBalanced(_ root: TreeNode?) -> Bool {

    var isBalansed = true

    func dfs(_ node: TreeNode?) -> Int {
        guard let node else { return 0 }

        let left = dfs(node.left)
        let right = dfs(node.right)

        guard isBalansed else { return 0}

        isBalansed = max(left, right) - min(left, right) < 2
        return max(left, right) + 1
    }
    _ = dfs(root)

    return isBalansed
}
