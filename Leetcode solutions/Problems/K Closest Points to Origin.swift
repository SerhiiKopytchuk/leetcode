//
//  K Closest Points to Origin.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 22.07.2024.
//

import Foundation

/// time: O(nlogn)
/// space: O(n)
func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
    var points = points

    for i in points.indices {
        let x = Double(points[i][0])
        let y = Double(points[i][1])
        points[i].append(Int(pow(x, 2) + pow(y, 2)))
    }

    return points
        .sorted { $0[2] <= $1[2] }
        .map {$0[0..<2]} [0..<k]
        .map(Array.init)
}
