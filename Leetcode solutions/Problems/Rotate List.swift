//
//  Rotate List.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 15.03.2023.
//

import Foundation
// time: O(n)
// space: O(1)
func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
    guard head != nil else { return nil }
    var length = 1
    var tail = head

    while tail?.next != nil {
        tail = tail?.next
        length += 1
    }

    var k = k % length
    guard k > 0 else { return head }

    var cur = head
    for _ in 0..<(length - k - 1) {
        cur = cur?.next
    }
    var newHead = cur?.next
    cur?.next = nil
    tail?.next = head

    return newHead
}
