//
//  Encode and Decode Strings.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 23.03.2023.
//

import Foundation

class StrDecoder {

    /// time: O(n)
    /// space: O(n)
    func encode(strs: [String]) -> String {
        var res = ""
        for str in strs {
            res += "\(str.count)#\(str)"
        }
        return res
    }

    /// time: O(n)
    /// space: O(n)
    func decode(str: String) -> [String] {
        let arr = Array(str)
        var res: [String] = []
        var i = 0

        while i < str.count {
            var j = i

            while arr[j] != "#" {
                j += 1
            }

            let count = Int(String(arr[i..<j]))!

            i = j + 1

            res.append(String(arr[i..<i+count]))

            i = i + count

        }

        return res
    }
}
