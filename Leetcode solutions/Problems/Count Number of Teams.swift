//
//  Count Number of Teams.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 29.07.2024.
//

import Foundation

/// time: O(n^2)
/// space: O(1)
func numTeams(_ rating: [Int]) -> Int {
    var res = 0

    for m in 1..<rating.count - 1 {
        var leftSmaller = 0, rightGreater = 0
                
        for l in 0..<m {
            if rating[l] < rating[m] {
                leftSmaller += 1
            }
        }
        for r in m + 1..<rating.count {
            if rating[m] < rating[r] {
                rightGreater += 1
            }
        }

        res += leftSmaller * rightGreater

        let leftGreater = m - leftSmaller
        let rightSmaller = rating.count - m - 1 - rightGreater
        res += leftGreater * rightSmaller
    }

    return res
}
