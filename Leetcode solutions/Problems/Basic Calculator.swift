//
//  Basic Calculator.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 30.03.2023.
//

import Foundation

/// time: O(n)
/// space: O(n)
func calculateBasic(_ s: String) -> Int {
       var res = 0, cur = 0, sign = 1
       var stack:[Int] = []

       for char in s {
           let str  = String(char)

           if let num = Int(str) {
               cur = cur * 10 + num
           } else if str == "-" || str == "+" {
               res += cur * sign
               sign = str == "+" ? 1 : -1
               cur = 0
           } else if str == "(" {
               stack.append(res)
               stack.append(sign)
               sign = 1
               res = 0
           } else if str == ")" {
               res += cur * sign
               res *= stack.removeLast()
               res += stack.removeLast()
               cur = 0
           }
       }

       return res + cur * sign
   }
