//
//  Reverse Linked List .swift
//  Problems
//
//  Created by Serhii Kopytchuk on 19.07.2024.
//

import Foundation

// time: O(n)
// space: O(1)
func reverseList(_ head: ListNode?) -> ListNode? {
    var p: ListNode? = nil
    var c = head
    var n = head?.next

    while c != nil {
        c?.next = p
        p = c
        c = n
        n = n?.next
    }

    return p
}
