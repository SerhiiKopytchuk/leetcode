//
//  Find Valid Matrix Given Row and Column Sums.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 20.07.2024.
//

import Foundation
import Algorithms

/// solution that I found more elegant but it uses Algorithms library
/// time: O(m*n)
/// space: O(m*n)
func restoreMatrix(_ rowSum: [Int], _ colSum: [Int]) -> [[Int]] {
    var rowSum = rowSum
    var colSum = colSum

    return product(rowSum.indices, colSum.indices)
        .map { x, y in
            let element = min(rowSum[x], colSum[y])
            rowSum[x] -= element
            colSum[y] -= element
            return element
        }
        .chunks(ofCount: colSum.count)
        .map(Array.init)
}


/// solution that first come to my mind
/// time: O(m*n)
/// space: O(m*n)
//func restoreMatrix(_ rowSum: [Int], _ colSum: [Int]) -> [[Int]] {
//    var rowSum = rowSum
//    var colSum = colSum
//    var r = 0
//    var c = 0
//
//    var mat = Array(
//        repeating:
//            Array(
//                repeating: 0,
//                count: colSum.count
//            ),
//        count: rowSum.count
//    )
//
//    while r < rowSum.count && c < colSum.count  {
//        if rowSum[r] < colSum[c] {
//            mat[r][c] = rowSum[r]
//
//            for nextC in (c + 1)..<colSum.count {
//                mat[r][nextC] = 0
//            }
//            colSum[c] -= rowSum[r]
//            rowSum[r] = 0
//            r += 1
//        } else if rowSum[r] > colSum[c] {
//            mat[r][c] = colSum[c]
//
//            for nextR in r + 1..<rowSum.count {
//                mat[nextR][c] = 0
//            }
//
//            rowSum[r] -= colSum[c]
//            colSum[c] = 0
//            c += 1
//        } else {
//            mat[r][c] = colSum[c]
//
//            for nextR in r + 1..<rowSum.count {
//                mat[nextR][c] = 0
//            }
//            for nextC in c + 1..<colSum.count {
//                mat[r][nextC] = 0
//            }
//            r += 1
//            c += 1
//        }
//    }
//
//    return mat
//}
