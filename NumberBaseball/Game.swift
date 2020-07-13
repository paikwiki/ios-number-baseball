//
//  Game.swift
//  NumberBaseball
//
//  Created by Changhyun Paik on 2020/07/06.
//  Copyright © 2020 Changhyun Baek. All rights reserved.
//

class Game {

    private(set) var answer: Answer
    private(set) var inning: Inning
    private(set) var totalInning = 9
    private(set) var isOver = false
    private(set) var inningCount = 1
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
    var isThreeStrikes: Bool {
        inning.pitching[0] == answer.first &&
        inning.pitching[1] == answer.second &&
        inning.pitching[2] == answer.third
    }

    init() {
        self.answer = Answer()
        self.inning = Inning()
    }

    func pitchABall(pitchNumber: Int) {
        guard
            inning.pitching.contains(pitchNumber) == false,
            isOver == false
            else { return }
        inning.pitching.append(pitchNumber)
        if inning.endInning && isThreeStrikes {
            isOver = true
        }
    }

    func getNextInning() {
        inningCount += 1
        inning = Inning()
    }

    func gameOver() {
        isOver = true
    }

    func reset() {
        isOver = false
        inningCount = 1
        answer = Answer()
        inning = Inning()
    }

}
