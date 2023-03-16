//
//  Basic Calculator II.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 16.03.2023.
//

import Foundation

// time: O(n)
// space: O(n)
func calculate(_ s: String) -> Int {
    var cur = 0
    var stack:[Int] = []
    var op = "+"

    for char in s+"+" where char != " " {
        if let num = char.wholeNumberValue {
            cur = cur * 10 + num
        } else {
            switch op {
                case "+":
                    stack.append(cur)
                case "-":
                    stack.append(-cur)
                case "*":
                    stack.append(stack.removeLast() * cur)
                case "/":
                    stack.append(stack.removeLast() / cur)
                default:
                    break
            }
            op = String(char)
            cur = 0
        }
    }

    return stack.reduce(0, +)
}
