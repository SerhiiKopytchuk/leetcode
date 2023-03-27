//
//  Serialize and Deserialize Binary Tree .swift
//  Problems
//
//  Created by Serhii Kopytchuk on 27.03.2023.
//

import Foundation

class Codec {

    /// time: O(n)
    /// space: O(n)
    func serialize(_ root: TreeNode?) -> String {
      var res: [String] = []

      func dfs(_ node: TreeNode?) {
            guard node != nil else {
              res.append("n")
              return
            }

            res.append("\(node?.val ?? 0)")

            dfs(node?.left)
            dfs(node?.right)
      }

      dfs(root)

      return res.joined(separator: ",")
    }

    /// time: O(n)
    /// space: O(n)
    func deserialize(_ data: String) -> TreeNode? {
        guard !data.isEmpty, data != "n" else {return nil }
        let vals = data.components(separatedBy: ",")
        var i = 0

        func dfs() -> TreeNode? {
            if vals[i] == "n" {
              i += 1
              return nil
            }

            let node = TreeNode(Int(vals[i]) ?? 0)
            i += 1
            node.left = dfs()
            node.right = dfs()

            return node
        }


        return dfs()
    }
}
