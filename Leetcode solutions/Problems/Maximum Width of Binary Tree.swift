//
//  Maximum Width of Binary Tree.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 11.07.2024.
//

import Foundation

/// time: O(n)
/// space: O(n)
func widthOfBinaryTree(_ root: TreeNode?) -> Int {
       guard let root else { return 0 }
       var res = 0
       var q: [(TreeNode?, Int)] = [(root, 1)]

       while q.isEmpty == false {
           let qSize = q.count
           let lNum = q[0].1
           let rNum = q[qSize - 1].1
           res = max(res, rNum - lNum + 1)

           for i in 0..<qSize {
               let (node, num) = q.removeFirst()
               let curNum = num - lNum

               if let left = node?.left {
                   q.append((left, curNum * 2))
               }
               if let right = node?.right {
                   q.append((right, curNum * 2 + 1))
               }
           }

       }

       return res
   }
