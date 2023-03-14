//
//  ListNode.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 14.03.2023.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?

    public init() {
        self.val = 0
        self.next = nil; }

    public init(_ val: Int) {
        self.val = val
        self.next = nil }

    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

extension Array where Element == Int {
    func toListNodes() -> ListNode? {
        let head = ListNode()
        var tmp = head
        self.forEach { element in
            tmp.next = ListNode(element)
            tmp = tmp.next ?? ListNode()
        }
        return head.next
    }
}
