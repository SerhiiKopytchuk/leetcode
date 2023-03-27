//
//  Minimum Window Substring.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 27.03.2023.
//

import Foundation

/// time: O(n)
/// space: O(n)
func minWindow(_ s: String, _ t: String) -> String {
       guard s != t else { return t }
       guard s.count >= t.count else { return "" }

       var s = Array(s)
       var tMap = [Character:Int]()
       var window = [Character:Int]()

       for c in t {
           tMap[c, default: 0] += 1
       }

       var have = 0
       var need = tMap.values.count

       var res = [-1, Int.max]

       var l = 0

       for r in 0..<s.count {
           let c = s[r]

           window[c, default: 0] += 1

           if tMap[c] != nil, window[c] == tMap[c] {
               have += 1
           }

           while have == need {
               if (r - l) < res[1] - abs(res[0]) {
                   res = [l, r]
               }

               window[s[l], default:0] -= 1

               if tMap[s[l]] != nil, window[s[l]]! < tMap[s[l]]! {
                   have -= 1
               }

               l += 1
           }
       }

       return res[0] >= 0 ? String(s[res[0]...res[1]]) : ""
}
