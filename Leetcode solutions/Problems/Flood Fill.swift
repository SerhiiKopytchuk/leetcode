//
//  Flood Fill.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 11.07.2024.
//

import Foundation

/// time: O(n*m)
/// space: O(1)
func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {
    guard image[sr][sc] != color else { return image }
    var image = image
    let dir = [
        [0, 1],
        [1, 0],
        [-1, 0],
        [0, -1]
    ]

    func dfs(_ row: Int, _ col: Int) {
        let colorToChange = image[row][col]
        image[row][col] = color
        for d in dir {
            let x = row + d[0]
            let y = col + d[1]

            guard
                x >= 0, x < image.count,
                y >= 0, y < image[0].count,
                image[x][y] == colorToChange
            else {
                continue
            }

            dfs(x, y)
        }
    }
    dfs(sr, sc)

    return image
}
