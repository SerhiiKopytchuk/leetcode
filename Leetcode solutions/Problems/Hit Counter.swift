//
//  Hit Counter.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 22.03.2023.
//

import Foundation

class HitCounter {

    private var q: [Int]

    init() {
        q = []
    }

    /// time: O(1)
    /// space: O(1)
    func hit(_ timestamp: Int) {
        q.append(timestamp)
    }

    /// time: O(log n)
    /// space: O(1)
    func getHits(_ timestamp: Int) -> Int {
        var l = 0
        var r = q.count - 1
        let target = timestamp - 300

        while l <= r {
            let m = (l + r) / 2
            if q[m] <= target {
                l = m + 1
            } else {
                r = m - 1
            }
        }

        return q.count - l
    }

}
