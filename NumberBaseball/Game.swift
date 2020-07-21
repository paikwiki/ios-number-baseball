//
//  Game.swift
//  NumberBaseball
//
//  Created by Changhyun Paik on 2020/07/06.
//  Copyright © 2020 Changhyun Baek. All rights reserved.
//

class Game {
    weak var delegate: GameDelegate?
    private(set) var inning: Inning
    private(set) var answer: Answer
    private(set) var totalInning: Int = 9
    private(set) var inningCount: Int = 1
    private(set) var gameResult: Bool = false
    private var inningResult: (strikeCount: Int, ballCount: Int) = (strikeCount: 0, ballCount: 0)
    var inningResultString: String {
        "\(inningResult.strikeCount)S \(inningResult.ballCount)B"
    }
    var isOver: Bool {
         inningResult.strikeCount == 3 || (inningCount == totalInning && inning.isEnded)
    }

    init() {
        self.inning = Inning()
        self.answer = Answer()
    }

    func gameDidPitch(pitchString: String) {
        delegate?.gameDidPitch(pitchString: inning.description)
    }

    func gameShouldEndInning(inningResultString: String) {
        delegate?.gameShouldEndInning(inningResultString: inningResultString)
    }

    func gameShoudRestart() {
        delegate?.gameShouldRestart()
    }

    func gameShouldEnd(gameResult: Bool, answerString: String) {
        delegate?.gameShouldEnd(gameResult: gameResult, answerString: answer.description)
    }

    func pitchABall(pitchNumber: Int) {
        guard
            inning.pitching.contains(pitchNumber) == false,
            isOver == false
            else { return }
        inning.pitching.append(pitchNumber)
        gameDidPitch(pitchString: inning.description)
        if inning.isEnded {
            inningResult = answer.judgePitching(inning: inning)
            gameShouldEndInning(inningResultString: inningResultString)
            if inningResult.strikeCount == 3 {
                gameResult = true
            }
            isOver == true ?
                gameShouldEnd(gameResult: gameResult, answerString: answer.description) :
                startNextInning()
        }
    }

    func startNextInning() {
        inningCount += 1
        inning = Inning()
    }

    func reset() {
        inningCount = 1
        inningResult = (strikeCount: 0, ballCount: 0)
        gameResult = false
        inning = Inning()
        answer = Answer()
        gameShoudRestart()
    }

}
