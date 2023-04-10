//
//  Longest Valid Parentheses.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 10.04.2023.
//

import Foundation

/// time: O(n)
/// space: O(n)
func longestValidParenthesesUsingStack(_ s: String) -> Int {
    let s = s.map { "\($0)" }
    var stack: [Int] = [-1]
    var res = 0

    for (i, p) in s.enumerated() {
        if p == "(" {
            stack.append(i)
        } else {
            stack.removeLast()

            if stack.isEmpty {
                stack.append(i)
            } else {
                res = max(res, i - stack.last!)
            }
        }
    }

    return res
}

/// time: O(n)
/// space: O(1)
func longestValidParenthesesUsingCounters(_ s: String) -> Int {
    let s = s.map { "\($0)" }
    var o = 0, c = 0
    var res = 0

    for p in s {
        if p == "(" {
            o += 1
        } else {
            c += 1
        }

        if o == c {
           res = max(res, o * 2)
        } else if c > o {
            c = 0
            o = 0
        }
    }

    o = 0
    c = 0

    for p in s.reversed() {
        if p == ")" {
            o += 1
        } else {
            c += 1
        }

        if o == c {
           res = max(res, o * 2)
        } else if c > o {
            c = 0
            o = 0
        }
    }


   return res
}
