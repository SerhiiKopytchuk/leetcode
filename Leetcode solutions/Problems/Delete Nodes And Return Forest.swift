//
//  Delete Nodes And Return Forest.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 18.07.2024.
//

import Foundation

// time: O(E+V)
// space: O(n)
func delNodes(_ root: TreeNode?, _ to_delete: [Int]) -> [TreeNode?] {
    let delSet = Set(to_delete)
    var res: [TreeNode?] = []

    func dfs(_ node: TreeNode?) -> TreeNode? {
        guard let node else { return nil }

        node.left = dfs(node.left)
        node.right = dfs(node.right)

        if delSet.contains(node.val) {
            res.append(node.left)
            res.append(node.right)
            return nil
        }

        return node
    }
    res.append(dfs(root))

    return res.filter { $0 != nil }
}
