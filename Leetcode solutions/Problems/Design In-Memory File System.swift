//
//  Design In-Memory File System.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 10.04.2023.
//

import Foundation

fileprivate class Dir {
    var dirs:[String: Dir] = [:]
    var files:[String: String] = [:]
}

class InMemoryFileSystem {

    private var root: Dir

    init () {
        root = Dir()
    }

    /// time: O(n)
    /// space: O(n)
    func ls(path: String) -> [String] {
        var cur = root
        var res: [String] = []
        if path != "/" {
            let direcitons: [String] = path.components(separatedBy: "/")

            for i in 0..<direcitons.count - 1 {
                if root.dirs[direcitons[i]] == nil {
                    root.dirs[direcitons[i]] = Dir()
                }
                cur = root.dirs[direcitons[i]]!
            }

            if path.last != "/" {
                return [cur.files[direcitons.last!] ?? ""]
            } else {
                cur = root.dirs[direcitons.last!] ?? Dir()
            }

        }

        cur.dirs.keys.forEach({ res.append($0) })
        cur.files.values.forEach({ res.append($0) })

        return res.sorted()
    }


    /// time: O(n)
    /// space: O(n)
    func mkdir(path: String) {
        var cur = root
        if path != "/" {
            let direcitons: [String] = path.components(separatedBy: "/")

            for i in 1..<direcitons.count - 1 {
                if cur.dirs[direcitons[i]] == nil {
                    cur.dirs[direcitons[i]] = Dir()
                }
                cur = cur.dirs[direcitons[i]]!
            }
        }
    }


    /// time: O(n)
    /// space: O(n)
    func  addContentToFile(path: String, content: String) {
        var cur = root
        if path != "/" {
            let direcitons: [String] = path.components(separatedBy: "/")

            for i in 1..<direcitons.count - 1 {
                if cur.dirs[direcitons[i]] == nil {
                    cur.dirs[direcitons[i]] = Dir()
                }
                cur = cur.dirs[direcitons[i]]!
            }

            cur.files[direcitons.last!, default: ""] += content
        }
    }


    /// time: O(n)
    /// space: O(n)
    func readContentFromFile(path: String) -> String {
        var cur = root
        if path != "/" {
            let direcitons: [String] = path.components(separatedBy: "/")

            for i in 1..<direcitons.count - 1 {
                if cur.dirs[direcitons[i]] == nil {
                    cur.dirs[direcitons[i]] = Dir()
                }
                cur = cur.dirs[direcitons[i]]!
            }

            return cur.files[direcitons.last!, default: ""]
        }
        return ""
    }
}
