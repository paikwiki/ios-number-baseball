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
    private var inningResult: (strikeCount: Int, ballCount: Int) = (strikeCount: 0, ballCount: 0)
    var inningResultString: String {
        "\(inningResult.strikeCount)S \(inningResult.ballCount)B"
    }
    var isThreeStrkes: Bool {
         inningResult.strikeCount == 3
    }
    var isOver: Bool {
         isThreeStrkes == true || (inningCount == totalInning && inning.isEnded)
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

    func gameShouldEnd(isThreeStrkes: Bool, answerString: String) {
        delegate?.gameShouldEnd(isThreeStrkes: isThreeStrkes, answerString: answer.description)
    }

    func pitchABall(pitchNumber: Int) {
        guard
            inning.pitching.contains(pitchNumber) == false,
            isOver == false
            else { return }
        inning.pitching.append(pitchNumber)
        gameDidPitch(pitchString: inning.description)
        if inning.isEnded == true {
            finishCurrentInning()
        }
    }

    func finishCurrentInning() {
        inningResult = answer.judgePitching(inning: inning)
        gameShouldEndInning(inningResultString: inningResultString)
        if isOver == true {
            gameShouldEnd(isThreeStrkes: isThreeStrkes, answerString: answer.description)
        } else {
            inningCount += 1
            inning = Inning()
        }
    }

    func reset() {
        inningCount = 1
        inningResult = (strikeCount: 0, ballCount: 0)
        inning = Inning()
        answer = Answer()
        gameShoudRestart()
    }

}
