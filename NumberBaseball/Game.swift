//
//  Game.swift
//  NumberBaseball
//
//  Created by Changhyun Paik on 2020/07/06.
//  Copyright © 2020 Changhyun Baek. All rights reserved.
//

class Game {
    
    private let answer: Answer
    private var inning: Inning
    private var totalInning = 9
    private var inningResultString: String = "-- --"
    private var gameEnd = false
    private var inningsData: [Int: LabelsForPitchesAndInningResult]
    
    init(answer: Answer, inning: Inning, inningsData: [Int: LabelsForPitchesAndInningResult]) {
        self.answer = answer
        self.inning = inning
        self.inningsData = inningsData
    }
    
    func getTotalInning() -> Int {
        return (totalInning)
    }
    
    func getInningResultString() -> String {
        return (inningResultString)
    }

    func isThreeStrikes() -> Bool {
        if inning.getPitches() == answer.getAnswer() {
            return (true)
        }
        return (false)
    }
    
    func gameOver() {
        gameEnd = true;
        print("GAME OVER")
    }
    
    func isOver() -> Bool {
        return (gameEnd)
    }
    
    func reset() {
        gameEnd = false
        inningsData.forEach({ inning in
            inning.value.pitchesLabel.text! = "_  _  _"
            inning.value.inningResultLabel.text! = "-- --"
        })
        inning.resetPitches()
        inning.resetInningCount()
        answer.resetAnswer()
    }
    
    func generateInningResultString() {
        var strikeCount = 0
        var ballCount = 0
        let answerNumbers = answer.getAnswer()
        let pitchNumbers = inning.getPitches()
        
        for index in 0..<answerNumbers.count {
            if pitchNumbers.contains(answerNumbers[index]) {
                if pitchNumbers[index] == answerNumbers[index]{
                  strikeCount += 1
                } else {
                    ballCount += 1;
                }
            }
        }
        inningResultString = "\(strikeCount)S \(ballCount)B"
    }
    
}
