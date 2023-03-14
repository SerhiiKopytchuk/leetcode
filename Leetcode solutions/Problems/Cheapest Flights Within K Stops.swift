//
//  Cheapest Flights Within K Stops.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 14.03.2023.
//

import Foundation

// time: O(e * k)
// space: O(n)
func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
    var prices = Array(repeating:Int.max, count: n)
    prices[src] = 0

    for _ in 0...k {
        var tmpPrices = prices
        for flight in flights where prices[flight[0]] != Int.max {
            var s = flight[0], d = flight[1], p = flight[2]

            if prices[s] + p < tmpPrices[d] {
                tmpPrices[d] = prices[s] + p
            }
        }
        prices = tmpPrices
    }

    return prices[dst] != Int.max ? prices[dst] : -1
}
