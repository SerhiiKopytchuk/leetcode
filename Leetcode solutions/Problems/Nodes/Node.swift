//
//  Node.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 14.03.2023.
//

import Foundation

public class Node {
    public var val: Int
    public var neighbors: [Node?]
    public init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
}


extension Node: Identifiable, Hashable {
    var identifier: String {
        return UUID().uuidString
    }

    public func hash(into hasher: inout Hasher) {
        return hasher.combine(identifier)
    }

    public static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}
