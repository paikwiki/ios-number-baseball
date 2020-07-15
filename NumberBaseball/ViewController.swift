//
//  ViewController.swift
//  NumberBaseball
//
//  Created by Changhyun Baek on 2020/04/29.
//  Copyright © 2020 Changhyun Baek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var inningView01: InningView!
    @IBOutlet weak var inningView02: InningView!
    @IBOutlet weak var inningView03: InningView!
    @IBOutlet weak var inningView04: InningView!
    @IBOutlet weak var inningView05: InningView!
    @IBOutlet weak var inningView06: InningView!
    @IBOutlet weak var inningView07: InningView!
    @IBOutlet weak var inningView08: InningView!
    @IBOutlet weak var inningView09: InningView!

    private var inningViews: [InningView] = [InningView]()
    private var game: Game = Game()

    override func viewDidLoad() {
        super.viewDidLoad()
        inningViews = [
            inningView01,
            inningView02,
            inningView03,
            inningView04,
            inningView05,
            inningView06,
            inningView07,
            inningView08,
            inningView09
        ]
    }

    private func showResult(gameResult: GameResult) {
        let resultMessage: String = gameResult == .win ? "👯‍♀️💃🏻👯‍♀️ 🎉YOU WIN🎉 👯‍♀️🕺🏼👯‍♀️" : "🎭 😭YOU LOSE😭 🎭"
        let resultAlert: UIAlertController = UIAlertController(title: "Game Over",
                                                               message: resultMessage, preferredStyle: .alert)
        let resultAlertAction: UIAlertAction = UIAlertAction(title: "OK👌🏾", style: .default, handler: nil)
        resultAlert.addAction(resultAlertAction)
        present(resultAlert, animated: true)
    }

    @IBAction func didTapNumber(_ sender: UIButton) {
        guard
            let tappedNumber = sender.currentTitle,
            let pitchNumber = Int(tappedNumber),
            game.isOver == false
            else { return }

        game.pitchABall(pitchNumber: pitchNumber)
        // UI UPDATE
        inningViews[game.inningCount - 1].pitchesLabel.text = game.inning.description
        if game.inning.isEnded {
            // UI UPDATE
            inningViews[game.inningCount - 1].inningResultLabel.text = game.inningResultString
            if game.isOver {
                // UI UPDATE
                answerLabel.text = game.umpire.description
                showResult(gameResult: game.gameResult)
            } else {
                game.startNextInning()
            }
        }
    }

    @IBAction func didTapReset(_ sender: UIButton) {
        // UI UPDATE
        answerLabel.text = "X   X   X"
        inningViews.forEach { inningView in
            // UI UPDATE
            inningView.pitchesLabel.text = "_  _  _"
            inningView.inningResultLabel.text = "-- --"
        }
        game.reset()
    }

}
