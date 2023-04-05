//
//  Maximum Frequency Stack.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 05.04.2023.
//

import Foundation

class FreqStack {

    private var maxCount: Int
    private var count: [Int: Int]
    private var stacks: [Int: [Int]]

    init() {
        maxCount = 0
        count = [:]
        stacks = [:]
    }

    /// time: O(1)
    /// space: O(1)
    func push(_ val: Int) {
        count[val, default: 0] += 1
        var c = count[val, default: 0]
        stacks[c, default:[]].append(val)
        maxCount = max(maxCount, c)
    }

    /// time: O(1)
    /// space: O(1)
    func pop() -> Int {
        var res = stacks[maxCount, default: [0]].removeLast()
        count[res, default: 1] -= 1
        if stacks[maxCount, default:[]].isEmpty {
            maxCount -= 1
        }
        return res
    }
}
