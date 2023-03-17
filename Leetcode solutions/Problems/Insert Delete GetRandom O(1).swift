//
//  Insert Delete GetRandom O(1).swift
//  Problems
//
//  Created by Serhii Kopytchuk on 17.03.2023.
//

import Foundation

class RandomizedSet {

    var hashMap: [Int:Int]
    var storage:[Int]

    init() {
        hashMap = [:]
        storage = []
    }

    func insert(_ val: Int) -> Bool {
        if hashMap[val] != nil {
            return false
        } else {
            storage.append(val)
            hashMap[val] = storage.count - 1
            return true
        }
    }

    func remove(_ val: Int) -> Bool {
      if let curIndex =  hashMap[val] {
            if curIndex != storage.count - 1{
                let last = storage.removeLast()
                storage[curIndex] = last
                hashMap[last] = curIndex
            } else {
                storage.removeLast()
            }
            hashMap[val] = nil
            return true
        } else {
            return false
        }
    }

    func getRandom() -> Int {
        return storage[Int.random(in: 0..<storage.count)]
    }
}

/**
 * Your RandomizedSet object will be instantiated and called as such:
 * let obj = RandomizedSet()
 * let ret_1: Bool = obj.insert(val)
 * let ret_2: Bool = obj.remove(val)
 * let ret_3: Int = obj.getRandom()
 */
