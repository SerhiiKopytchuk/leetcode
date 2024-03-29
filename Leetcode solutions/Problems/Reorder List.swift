//
//  ReorderList.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 14.03.2023.
//

import Foundation

// time: O(n)
// space: O(1)
func reorderList(_ head: ListNode?) {
    guard let head = head else { return }
    var cur: ListNode? = head
    let secondHalf = getMid(head)
    var second = rotate(secondHalf)


    while second != nil && cur != nil {
        let next: ListNode? = cur?.next
        cur?.next = second
        second = second?.next
        cur = cur?.next
        cur?.next = next
        cur = cur?.next
    }

}

// time: O(n)
// space: O(1)
func getMid(_ head: ListNode?) -> ListNode? {
    var slow = head
    var fast = head?.next
    while fast != nil {
        slow = slow?.next
        fast = fast?.next?.next
    }
    let mid = slow?.next
    slow?.next = nil
    return mid
}

// time: O(n)
// space: O(1)
func rotate(_ head: ListNode?) -> ListNode? {
    var prev: ListNode? = nil
    var cur = head

    while cur != nil {
        let next = cur?.next
        cur?.next = prev
        prev = cur
        cur = next
    }

    return prev
}
