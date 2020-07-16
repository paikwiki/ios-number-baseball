//
//  Answer.swift
//  NumberBaseball
//
//  Created by Changhyun Paik on 2020/07/05.
//  Copyright © 2020 Changhyun Baek. All rights reserved.
//

import Foundation

struct Answer: CustomStringConvertible {

    let first: Int
    let second: Int
    let third: Int

    init() {
        var numberSet: Set<Int> = Set<Int>()
        while numberSet.count < 3 {
            numberSet.insert(Int(arc4random_uniform(10)))
        }
        let answerNumbers: [Int] = Array(numberSet)
        (first, second, third) = (answerNumbers[0], answerNumbers[1], answerNumbers[2])
        print(self.description)
    }

    var description: String {
        "\(first)   \(second)   \(third)"
    }

    func judgePitching(inning: Inning) -> (strikeCount: Int, ballCount: Int) {
        let answerNumbers: [Int] = [first, second, third]
        var strikeCount: Int = 0
        var ballCount: Int = 0
        (0..<3).forEach { index in
            if inning.pitching.contains(answerNumbers[index]) {
                if answerNumbers[index] == inning.pitching[index] {
                    strikeCount += 1
                } else {
                    ballCount += 1
                }
            }
        }
        return (strikeCount: strikeCount, ballCount: ballCount)
    }

}
