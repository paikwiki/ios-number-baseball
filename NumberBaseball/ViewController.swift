//
//  ViewController.swift
//  NumberBaseball
//
//  Created by Changhyun Baek on 2020/04/29.
//  Copyright © 2020 Changhyun Baek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var answerLabel: UILabel!
    @IBOutlet var inningView01: InningView!
    @IBOutlet var inningView02: InningView!
    @IBOutlet var inningView03: InningView!
    @IBOutlet var inningView04: InningView!
    @IBOutlet var inningView05: InningView!
    @IBOutlet var inningView06: InningView!
    @IBOutlet var inningView07: InningView!
    @IBOutlet var inningView08: InningView!
    @IBOutlet var inningView09: InningView!

    private var inningViews = [Int: InningView]()
    private var game = Game()

    override func viewDidLoad() {
        super.viewDidLoad()
        inningViews = [
            1: inningView01!,
            2: inningView02!,
            3: inningView03!,
            4: inningView04!,
            5: inningView05!,
            6: inningView06!,
            7: inningView07!,
            8: inningView08!,
            9: inningView09!
        ]
    }

    @IBAction func didTapNumber(_ sender: UIButton) {

        guard
            let pitchNumber = Int(sender.currentTitle!),
            game.inning.pitching.contains(pitchNumber) == false,
            game.isOver == false
            else { return }

        game.pitchABall(pitchNumber: pitchNumber)
        // UI UPDATE
        inningViews[game.inningCount]?.pitchesLabel.text = game.inning.pitchesString
        if game.inning.isThrowThreeBalls {
            if game.isThreeStrikes() || (game.totalInning == game.inningCount) {
                let resultMessage =  game.isThreeStrikes() ? "👯‍♀️💃🏻👯‍♀️ 🎉YOU WIN🎉 👯‍♀️🕺🏼👯‍♀️" : "🎭 😭YOU LOSE😭 🎭"
                let resultAlert = UIAlertController(title: "Game Over", message: resultMessage, preferredStyle: .alert)
                let resultAlertAction = UIAlertAction(title: "OK👌🏾", style: .default, handler: nil)
                resultAlert.addAction(resultAlertAction)
                game.gameOver()
                // UI UPDATE
                answerLabel.text = game.answer.description
                present(resultAlert, animated: true)
            }
            // UI UPDATE
            inningViews[game.inningCount]?.inningResultLabel.text = game.inningResultString
            game.getNextInning()
        }
    }

    @IBAction func didTapReset(_ sender: UIButton) {
        // UI UPDATE
        answerLabel.text = "X   X   X"
        inningViews.forEach({ inningView in
            // UI UPDATE
            inningView.value.pitchesLabel.text! = "_  _  _"
            inningView.value.inningResultLabel.text! = "-- --"
        })
        game.reset()
    }

}
