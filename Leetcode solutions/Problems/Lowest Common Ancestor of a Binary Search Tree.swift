//
//  Lowest Common Ancestor of a Binary Search Tree.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 15.07.2024.
//

import Foundation
/// time: O(N)
/// space: O(E +V)
func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        var l = min(p?.val ?? 0, q?.val ?? 0)
        var r = max(p?.val ?? 0, q?.val ?? 0)

        func dfs(_ node: TreeNode?) -> TreeNode? {
            guard let node else { return nil }

            let val = node.val

            if l <= val && val <= r {
                return node
            } else if val > l {
                return dfs(node.left)
            } else if val < r {
                return dfs(node.right)
            }

            return  nil
        }


        return dfs(root)
    }
