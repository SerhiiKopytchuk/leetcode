//
//  Median of Two Sorted Arrays.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 06.04.2023.
//

import Foundation

/// time: O(Log(n+m))
/// space: O(1)
func findMedianSortedArrays(_ A: [Int], _ B: [Int]) -> Double {
        if A.count > B.count {
            return findMedianSortedArrays(B, A)
        }

        let total = A.count + B.count
        var l = 0
        var r = A.count

        while l <= r {
            let aPart = (l + r) / 2
            let bPart = (total + 1) / 2 - aPart

            let Aleft = aPart == 0 ? Int.min : A[aPart - 1]
            let Aright = aPart == A.count ? Int.max : A[aPart]

            let Bleft = bPart == 0 ? Int.min : B[bPart - 1]
            let Bright = bPart == B.count ? Int.max : B[bPart]

            if Bleft <= Aright && Aleft <= Bright {
                if total % 2 == 1 {
                    return Double(max(Aleft, Bleft))
                }
                let sum = max(Aleft, Bleft) + min(Aright, Bright)
                return Double(sum) / 2.0
            }

            if Aleft > Bright {
                r = aPart - 1
            } else {
                l = aPart + 1
            }
        }

        return -1
    }
