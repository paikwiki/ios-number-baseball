//
//  Game.swift
//  NumberBaseball
//
//  Created by Changhyun Paik on 2020/07/06.
//  Copyright © 2020 Changhyun Baek. All rights reserved.
//

class Game {

    private(set) var inning: Inning
    private(set) var answer: Answer
    private(set) var totalInning: Int = 9
    private(set) var inningCount: Int = 1
    private(set) var gameResult: GameResult = .lose
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

    func pitchABall(pitchNumber: Int) {
        guard
            inning.pitching.contains(pitchNumber) == false,
            isOver == false
            else { return }
        inning.pitching.append(pitchNumber)
        if inning.isEnded {
            inningResult = answer.judgePitching(inning: inning)
            if inningResult.strikeCount == 3 {
                gameResult = .win
            }
        }

    }

    func startNextInning() {
        inningCount += 1
        inning = Inning()
    }

    func reset() {
        inningCount = 1
        inningResult = (strikeCount: 0, ballCount: 0)
        gameResult = .lose
        inning = Inning()
        answer = Answer()
    }

}
