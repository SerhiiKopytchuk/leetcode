//
//  Binary Tree Zigzag Level Order Traversal.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 08.03.2023.
//

import Foundation

// time: O(n)
// space: O(n)
func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
    guard root != nil else { return [] }
    var res: [[Int]] = []
    var q:[TreeNode?] = [root]

    while !q.isEmpty {
        let count = q.count
        var level:[Int] = []

        for _ in 0..<count {
            let cur = q.removeFirst()
            if let left = cur?.left {
                q.append(left)
            }
            if let right = cur?.right {
                q.append(right)
            }
            level.append(cur!.val)
        }

        res.append((res.count % 2) == 1 ? level.reversed() : level)
    }

    return res
}
