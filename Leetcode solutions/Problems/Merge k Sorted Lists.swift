//
//  Merge k Sorted Lists.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 01.04.2023.
//

import Foundation

/// time: O(k logN)
/// space: O(k)
func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    guard !lists.isEmpty, !lists.allSatisfy({ $0 == nil }) else { return nil }

    func merge(_ l1: inout ListNode?, _ l2: inout ListNode?) -> ListNode? {
        let dummy = ListNode()
        var tail: ListNode? = dummy

        while l1 != nil && l2 != nil {
            if l1!.val < l2!.val {
                tail?.next = l1
                l1 = l1?.next
            } else {
                tail?.next = l2
                l2 = l2?.next
            }
            tail = tail?.next
        }

        tail?.next = l1 == nil ? l2 : l1

        return dummy.next
    }

    var lists = lists

    while lists.count > 1 {
        var mergedLists: [ListNode?] = []

        var i  = 0
        while i < lists.count {
            var l1 = lists[i]
            var l2 = i + 1 < lists.count ? lists[i + 1] : nil
            mergedLists.append(merge(&l1, &l2))
            i += 2
        }

        lists = mergedLists
    }

    return lists[0]
}
