//
//  Maximum Depth of Binary Tree.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 22.07.2024.
//

import Foundation
/// time: O(n)
/// space: O(n)
func maxDepth(_ root: TreeNode?) -> Int {
    guard let root else { return 0 }
    var q = [root]
    var res = 0

    while q.isEmpty == false {
        for _ in 0..<q.count {
            let f = q.removeFirst()
            if let left = f.left {
                q.append(left)
            }
            if let right = f.right {
                q.append(right)
            }
        }
        res += 1
    }

    return res
}
