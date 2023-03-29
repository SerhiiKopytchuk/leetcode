//
//  Find Median from Data Stream.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 29.03.2023.
//

import Foundation

class MedianFinder {

    private var small: Heap<Int>
    private var large: Heap<Int>

    init() {
        small = Heap<Int> (sort: >)
        large = Heap<Int> (sort: <)

    }

    /// time: O(log n)
    /// space: O(1)
    func addNum(_ num: Int) {
        small.insert(num)

         if !small.isEmpty,
           !large.isEmpty,
            small.peek()! > large.peek()! {

                let val = small.remove()!
                large.insert(val)
        }

        if small.count > large.count + 1 {
            let val = small.remove()!
            large.insert(val)
        }
        if large.count > small.count + 1 {
            let val = large.remove()!
            small.insert(val)
        }
    }

    /// time: O(1)
    /// space: O(1)
    func findMedian() -> Double {
        if small.count > large.count {
            return Double(small.peek()!)
        } else if small.count < large.count {
            return Double(large.peek()!)
        } else {
            return (Double(small.peek()!) + Double(large.peek()!)) / 2.0
        }
    }
}
