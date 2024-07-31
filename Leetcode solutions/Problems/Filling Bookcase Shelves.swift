//
//  Filling Bookcase Shelves.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 31.07.2024.
//

import Foundation

/// time: O(n*w)
/// space: O(n)
@_optimize(speed)
func minHeightShelves(_ books: [[Int]], _ shelfWidth: Int) -> Int {
    var dp = [0] + Array(repeating: Int.max, count: books.count)

    for i in 1...books.count {
        var (width, height) = (0, 0)

        for j in (0..<i).reversed() {
            width += books[j][0]
            if width > shelfWidth {
                break
            }
            height = max(height, books[j][1])
            dp[i] = min(dp[i], dp[j] + height)
        }
    }

    return dp[books.count]
}
