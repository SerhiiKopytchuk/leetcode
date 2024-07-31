//
//  Binary Search Tree Iterator.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 23.07.2024.
//

import Foundation

/// time: O(n)
/// space: O(n)
class BSTIterator {

    var q: [Int]

    init(_ root: TreeNode?) {
        q = []
        setup(root)
    }

    /// time: O(1)
    /// space: O(1)
    func next() -> Int {
        q.removeLast()
    }

    /// time: O(1)
    /// space: O(1)
    func hasNext() -> Bool {
        q.isEmpty == false
    }

    /// time: O(n)
    /// space: O(n)
    private func setup(_ root: TreeNode?) {
        func dfs(_ node: TreeNode?) {
            guard let node else { return }
            dfs(node.left)
            q.append(node.val)
            dfs(node.right)
        }
        dfs(root)
        q = q.reversed()
    }
}
