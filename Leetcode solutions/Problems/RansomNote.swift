//
//  RansomNote.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 18.07.2024.
//

import Foundation

/// time: O(n)
/// space: O(n)
func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
    var remain: [Character: Int] = magazine
        .reduce(into: [Character:Int]()) {
            $0[$1, default: 0] += 1
        }

    for c in ransomNote {
        remain[c, default: 0] -= 1
        if remain[c, default: -1] < 0 {
            return false
        }
    }

    return true
}
