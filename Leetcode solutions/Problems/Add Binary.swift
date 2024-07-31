//
//  Add Binary.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 20.07.2024.
//

import Foundation
/// time: O(n)
/// space: O(n)
func addBinary(_ a: String, _ b: String) -> String {
        let a = Array(a.reversed())
        let b = Array(b.reversed())
        var res = ""
        var rem = 0
        var i = 0

        while i < a.count || i < b.count || rem > 0 {
            let n1: Int = i < a.count ? Int(String(a[i])) ?? 0 : 0
            let n2: Int = i < b.count ? Int(String(b[i])) ?? 0 : 0
            let cur = (n1 + n2 + rem) % 2

            rem = n1 + n2 + rem > 1 ? 1 : 0

            res.append(String(cur))
            i += 1
        }


        return String(res.reversed())
    }
