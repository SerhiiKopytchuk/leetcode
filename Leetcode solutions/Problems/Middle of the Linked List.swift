//
//  Middle of the Linked List.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 22.07.2024.
//

import Foundation

/// time: O(n)
/// space: O(1)
func middleNode(_ head: ListNode?) -> ListNode? {
    var slow = head
    var fast = head?.next

    while fast != nil {
        slow = slow?.next
        fast = fast?.next?.next
    }

    return slow
}
