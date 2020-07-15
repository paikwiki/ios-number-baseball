//
//  Umpire.swift
//  NumberBaseball
//
//  Created by Changhyun Baek on 2020/07/15.
//  Copyright © 2020 Changhyun Baek. All rights reserved.
//

struct Umpire: CustomStringConvertible {
    private let answer: Answer
    var description: String {
        answer.description
    }

    init() {
        self.answer = Answer()
    }

    func judgePitching(inning: Inning) -> (strikeCount: Int, ballCount: Int) {
        let answerNumbers: [Int] = [answer.first, answer.second, answer.third]
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
