//
//  Sort the People.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 22.07.2024.
//

import Foundation

/// time: O(NlogN)
/// space: O(n)
func sortPeople(_ names: [String], _ heights: [Int]) -> [String] {
    return names
        .indices
        .map { (names[$0], heights[$0]) }
        .sorted { $0.1 > $1.1 }
        .map { $0.0 }
}
