//
//  Inorder Successor in BTS.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 21.03.2023.
//

import Foundation

// time: O(N)
// space: O(1)
func inorderSuccessor(root: TreeNode, p: TreeNode) -> TreeNode {
    var s: TreeNode? = nil
    var cur: TreeNode? = root

    while cur != nil {
        if p.val >= cur!.val {
            cur = cur?.right
        } else {
            s = cur!
            cur = cur?.left
        }
    }

    return s!
}
