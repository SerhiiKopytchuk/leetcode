//
//  Word Ladder.swift
//  Problems
//
//  Created by Serhii Kopytchuk on 29.03.2023.
//

import Foundation

/// time: O(n^2 *m)
/// space: O(n)
func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
    guard wordList.contains(endWord) else { return 0 }
    let words = wordList + [beginWord]
    var nei:[String:[String]] = [:]

    for word in words {
        let word = Array(word)
        for j in 0..<word.count {
            let wordWithoutCharacter = word[0..<j] + "*" + word[j + 1..<word.count]
            nei[String(wordWithoutCharacter), default: []] += [String(word)]
        }
    }

    var res = 1
    var visited:Set<String> = [beginWord]
    var q = [beginWord]

    while !q.isEmpty {
        let count = q.count
            for _ in 0..<count {
                let word = Array(q.removeFirst())
                if String(word) == endWord {
                    return res
                }
                for j in 0..<word.count {
                    let wordWithoutCharacter = word[0..<j] + "*" + word[j + 1..<word.count]
                    for n in nei[String(wordWithoutCharacter)] ?? [] {
                        if !visited.contains(n) {
                            visited.insert(n)
                            q.append(n)
                        }
                    }
                }
            }
        res += 1
    }

    return 0
}
