//
//  Game.swift
//  NumberBaseball
//
//  Created by Changhyun Paik on 2020/07/06.
//  Copyright © 2020 Changhyun Baek. All rights reserved.
//

class Game {

    private var answer: Answer
    private let inning: Inning
    private(set) var totalInning = 9
    private(set) var isOver = false
    var inningResultString: String {
        var strikeCount = 0
        var ballCount = 0
        if inning.pitching.firstIndex(of: answer.first) != nil {
            if answer.first == inning.pitching[0] {
                strikeCount += 1
            } else {
                ballCount += 1
            }
        }
        if inning.pitching.firstIndex(of: answer.second) != nil {
            if answer.second == inning.pitching[1] {
                strikeCount += 1
            } else {
                ballCount += 1
            }
        }
        if inning.pitching.firstIndex(of: answer.third) != nil {
            if answer.third == inning.pitching[2] {
                strikeCount += 1
            } else {
                ballCount += 1
            }
        }

        return "\(strikeCount)S \(ballCount)B"
    }

    init(answer: Answer, inning: Inning) {
        self.answer = answer
        self.inning = inning
    }

    func isThreeStrikes() -> Bool {
        inning.pitching[0] == answer.first &&
        inning.pitching[1] == answer.second &&
        inning.pitching[2] == answer.third
    }

    func gameOver() {
        isOver = true
        print("GAME OVER")
    }

    func reset() {
        isOver = false
        inning.resetPitches()
        inning.resetInningCount()
        answer = Answer()
    }

}
