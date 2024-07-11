//
//  Course Schedule.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 11.07.2024.
//

import Foundation

/// time: O(V+E)
/// space: O(3n)
func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {

        var pointers: [Int: Int] = [:]
        var graph: [Int: [Int]] = [:]
        var q: [Int] = []

        for pre in prerequisites {
            pointers[pre[0], default: 0] += 1
            graph[pre[1], default: []].append(pre[0])
        }

        for i in 0..<numCourses where pointers[i] == nil {
            q.append(i)
        }

        while q.isEmpty == false {

            let first = q.removeFirst()
            for n in graph[first] ?? [] {
                pointers[n, default: 1] -= 1

                if pointers[n] == 0 {
                    q.append(n)
                }
            }

            graph[first] = nil
        }

        return graph.isEmpty
    }
