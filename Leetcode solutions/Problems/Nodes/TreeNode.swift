//
//  File.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 08.03.2023.
//

import Foundation

class TreeNode{

    var val: Int
    var left: TreeNode? = nil
    var right: TreeNode? = nil

    init(_ val: Int = 0) {
        self.val = val
    }

    init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }

}
