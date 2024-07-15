//
//  Linked List Cycle.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 15.07.2024.
//

import Foundation

/// time: O(n)
/// space: O(1)
func hasCycle(_ head: ListNode?) -> Bool {
    var slow = head?.next
    var fast = head?.next?.next

    while fast != nil {
        guard fast !== slow else { return true }

        fast = fast?.next?.next
        slow = slow?.next
    }

    return false
}
