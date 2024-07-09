//
//  Task Scheduler.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 09.07.2024.
//

import Foundation

/// time: O(n)
/// space: O(26 * 2)
func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
    var time = 0
    var numCount = Array(tasks.reduce(into: [Character:Int]()) {$0[$1, default: 0] += 1 }.values)

    var heap: Heap<Int> = Heap(array: numCount) { $0 > $1 }
    var q: [[Int]] = [] // [val, timeAvailable]

    while heap.isEmpty == false || q.isEmpty == false {
        time += 1
        if let biggestVal = heap.remove() {
            let value = biggestVal - 1
            if value != 0 {
                q.append([value, time + n])
            }
        }

        if let first = q.first, first[1] == time {
            heap.insert(q.removeFirst()[0])
        }
    }

    return time
}
