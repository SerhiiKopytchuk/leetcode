//
//  Course Schedule II.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 15.07.2024.
//

import Foundation

/// time: O(E+V)
/// space: O(n)
func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
    var path:[Int] = []
    var q: [Int] = []
    var graph: [Int: [Int]] = [:]
    var pointers: [Int: Int] = [:]

    for pre in prerequisites {
        graph[pre[1], default: []].append(pre[0])
        pointers[pre[0], default: 0] += 1
    }

    for i in 0..<numCourses where pointers[i] == nil {
        q.append(i)
    }

    while q.isEmpty == false {
        let cur = q.removeFirst()
        path.append(cur)

        for n in graph[cur] ?? [] {
            pointers[n, default: 1] -= 1

            if pointers[n] == 0 {
                q.append(n)
                pointers[n] = nil
            }
        }

    }

    return pointers.isEmpty ? path : []
}
