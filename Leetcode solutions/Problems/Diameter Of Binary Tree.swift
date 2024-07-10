//
//  Diameter Of Binary Tree.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 10.07.2024.
//

import Foundation

func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        guard root != nil else { return 0 }
        var m = 0

        func height(_ node: TreeNode?) -> Int {
            guard node != nil else { return 0 }
            let left = height(node?.left)
            let right = height(node?.right)
            m = max(m, left + right)
            return max(left, right) + 1
        }
        _ = height(root)

        return m
    }
