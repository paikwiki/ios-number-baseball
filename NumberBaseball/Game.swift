//
//  Game.swift
//  NumberBaseball
//
//  Created by Changhyun Paik on 2020/07/06.
//  Copyright © 2020 Changhyun Baek. All rights reserved.
//

class Game {
    
    private let answer: Answer
    private let inning: Inning
    private(set) var totalInning = 9
    private(set) var isOver = false
    var inningResultString: String {
        var strikeCount = 0
        var ballCount = 0
        let answerNumbers = answer.answer
        let pitchNumbers = inning.pitches
        
        for index in 0..<answerNumbers.count {
            if pitchNumbers.contains(answerNumbers[index]) {
                if pitchNumbers[index] == answerNumbers[index]{
                  strikeCount += 1
                } else {
                    ballCount += 1
                }
            }
        }
        return "\(strikeCount)S \(ballCount)B"
    }
    
    init(answer: Answer, inning: Inning) {
        self.answer = answer
        self.inning = inning
    }
    
    func isThreeStrikes() -> Bool {
        if inning.pitches == answer.answer {
            return (true)
        }
        return (false)
    }
    
    func gameOver() {
        isOver = true
        print("GAME OVER")
    }
    
    func reset() {
        isOver = false
        inning.resetPitches()
        inning.resetInningCount()
        answer.resetAnswer()
    }
    
}
