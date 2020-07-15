//
//  Game.swift
//  NumberBaseball
//
//  Created by Changhyun Paik on 2020/07/06.
//  Copyright © 2020 Changhyun Baek. All rights reserved.
//

class Game {

    private(set) var inning: Inning
    private(set) var umpire: Umpire
    private(set) var totalInning: Int = 9
    private(set) var isOver: Bool  = false
    private(set) var inningCount: Int = 1
    private(set) var gameResult: GameResult = .lose
    private var inningResult: (strikeCount: Int, ballCount: Int) = (strikeCount: 0, ballCount: 0)
    var inningResultString: String {
        "\(inningResult.strikeCount)S \(inningResult.ballCount)B"
    }

    init() {
        self.inning = Inning()
        self.umpire = Umpire()
    }

    func pitchABall(pitchNumber: Int) {
        guard
            inning.pitching.contains(pitchNumber) == false,
            isOver == false
            else { return }
        inning.pitching.append(pitchNumber)
        if inning.isEnded {
            inningResult = umpire.judgePitching(inning: inning)
            if inningResult.strikeCount == 3 {
                gameResult = .win
                isOver = true
            }
        }

    }

    func startNextInning() {
        inningCount += 1
        inning = Inning()
    }

    func showAnswer() {
        return
    }

    func gameOver() {
        isOver = true
    }

    func reset() {
        isOver = false
        inningCount = 1
        gameResult = .lose
        inning = Inning()
        umpire = Umpire()
    }

}
