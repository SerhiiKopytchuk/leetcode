//
//  PathSum3.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 08.03.2023.
//

import Foundation

// time: O(n)
// space: O(n)
func pathSum(_ root: TreeNode?, _ targetSum: Int) -> Int {
        var res = 0
        var map:[Int:Int] = [:]

        func findSum(_ root: TreeNode?, _ r: Int) {
            guard let val = root?.val else { return }
            let curSum = val + r
            if curSum == targetSum {
                res += 1
            }
            res += map[curSum - targetSum, default: 0]
            map[curSum, default: 0] += 1
            findSum(root?.left, curSum)
            findSum(root?.right, curSum)
            map[curSum, default: 0] -= 1
        }

        findSum(root, 0)
        return res
}
