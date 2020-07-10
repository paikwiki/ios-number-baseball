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
        if inning.pitches.firstIndex(of: Character(String(answer.answer.first))) != nil {
            if answer.answer.first == Int(String(inning.pitches[0]))! {
                strikeCount += 1
            } else {
                ballCount += 1
            }
        }
        if inning.pitches.firstIndex(of: Character(String(answer.answer.second))) != nil {
            if answer.answer.second == Int(String(inning.pitches[1]))! {
                strikeCount += 1
            } else {
                ballCount += 1
            }
        }
        if inning.pitches.firstIndex(of: Character(String(answer.answer.third))) != nil {
            if answer.answer.third == Int(String(inning.pitches[2]))! {
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
        Int(String(inning.pitches[0])) == answer.answer.first &&
        Int(String(inning.pitches[1])) == answer.answer.second &&
        Int(String(inning.pitches[2])) == answer.answer.third
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
