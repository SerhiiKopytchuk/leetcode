//
//   Number of Good Leaf Nodes Pairs.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 18.07.2024.
//

import Foundation
import Algorithms

// time: O(n^2)
// space: O(n)
//func countPairs(_ root: TreeNode?, _ distance: Int) -> Int {
//    var res = 0
//
//    func dfs(_ node: TreeNode?) -> [Int] {
//        guard let node else { return [] }
//
//        if node.left == nil && node.right == nil {
//            return [1]
//        }
//
//        let leftArr = dfs(node.left)
//        let rightArr = dfs(node.right)
//
//        for l in leftArr {
//            for r in rightArr where l + r <= distance {
//                res += 1
//            }
//        }
//
//        return leftArr.map { $0 + 1 } + rightArr.map { $0 + 1 }
//    }
//    _ = dfs(root)
//
//    return res
//}


// time: O(n^2)
// space: O(n)
func countPairs(_ root: TreeNode?, _ distance: Int) -> Int {
    var res = 0

    func dfs(_ node: TreeNode?) -> [Int] {
        guard let node else { return [] }

        if node.left == nil && node.right == nil {
            return [1]
        }

        let leftArr = dfs(node.left)
        let rightArr = dfs(node.right)

        res += product(leftArr, rightArr).filter { $0 + $1 <= distance }.count

        return chain(leftArr, rightArr).map {$0 + 1}
    }
    _ = dfs(root)

    return res
}
