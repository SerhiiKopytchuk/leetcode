//
//  Binary Tree Maximum Path Sum.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 05.04.2023.
//

import Foundation

/// time:O(n)
/// space: O(1)
func maxPathSum(_ root: TreeNode?) -> Int {
    guard root != nil else { return 0 }
    var res = Int.min

    @discardableResult  func bfs(_ node: TreeNode?) -> Int {
        guard let node = node else { return 0 }

        let maxLeft = bfs(node.left)
        let maxRight = bfs(node.right)

        res = max(res, maxLeft + maxRight + node.val)

        if node.val + max(maxLeft, maxRight) > 0 {
             return node.val + max(maxLeft, maxRight)
        } else if node.val > 0 {
            return node.val
        } else {
            return 0
        }
    }

    bfs(root)

    return res
}
