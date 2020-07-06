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
    @IBOutlet var pitchesLabel01: UILabel!
    @IBOutlet var pitchesLabel02: UILabel!
    @IBOutlet var pitchesLabel03: UILabel!
    @IBOutlet var pitchesLabel04: UILabel!
    @IBOutlet var pitchesLabel05: UILabel!
    @IBOutlet var pitchesLabel06: UILabel!
    @IBOutlet var pitchesLabel07: UILabel!
    @IBOutlet var pitchesLabel08: UILabel!
    @IBOutlet var pitchesLabel09: UILabel!
    @IBOutlet var inningResultLabel01: UILabel!
    @IBOutlet var inningResultLabel02: UILabel!
    @IBOutlet var inningResultLabel03: UILabel!
    @IBOutlet var inningResultLabel04: UILabel!
    @IBOutlet var inningResultLabel05: UILabel!
    @IBOutlet var inningResultLabel06: UILabel!
    @IBOutlet var inningResultLabel07: UILabel!
    @IBOutlet var inningResultLabel08: UILabel!
    @IBOutlet var inningResultLabel09: UILabel!
    
    private var inningsData = [Int: LabelsForPitchesAndInningResult]()
    private let answer = Answer()
    private var inning = Inning()
    lazy private var game = Game(answer: answer, inning: inning, inningsData: inningsData)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inningsData = [
            1: LabelsForPitchesAndInningResult(pitchesLabel: pitchesLabel01, inningResultLabel: inningResultLabel01),
            2: LabelsForPitchesAndInningResult(pitchesLabel: pitchesLabel02, inningResultLabel: inningResultLabel02),
            3: LabelsForPitchesAndInningResult(pitchesLabel: pitchesLabel03, inningResultLabel: inningResultLabel03),
            4: LabelsForPitchesAndInningResult(pitchesLabel: pitchesLabel04, inningResultLabel: inningResultLabel04),
            5: LabelsForPitchesAndInningResult(pitchesLabel: pitchesLabel05, inningResultLabel: inningResultLabel05),
            6: LabelsForPitchesAndInningResult(pitchesLabel: pitchesLabel06, inningResultLabel: inningResultLabel06),
            7: LabelsForPitchesAndInningResult(pitchesLabel: pitchesLabel07, inningResultLabel: inningResultLabel07),
            8: LabelsForPitchesAndInningResult(pitchesLabel: pitchesLabel08, inningResultLabel: inningResultLabel08),
            9: LabelsForPitchesAndInningResult(pitchesLabel: pitchesLabel09, inningResultLabel: inningResultLabel09)
        ]
    }
    
    @IBAction func touchKeypad(_ sender: UIButton) {
        let pitchNumber = Character(sender.currentTitle!);
        
        // TODO: 빈 버튼 어떤 걸로 사용할 지 결정
        if pitchNumber == " " {
            return
        }
        
        if pitchNumber == "↺" {
            answerLabel.text = "X   X   X"
            game.reset()
            
            return
        }
        
        if game.isOver() {
            return
        }
        
        if (inning.getPitches().contains(pitchNumber)) {
            return
        }
        
        inning.throwABall(pitchNumber: pitchNumber)
        inning.updatePitchesString(pitchNumber: pitchNumber)
        // UI UPDATE
        inningsData[inning.getInningCount()]?.pitchesLabel.text = inning.getPitchesString()
        
        if inning.isThrowThreeBalls() {
            if game.isThreeStrikes() || (game.getTotalInning() == inning.getInningCount()) {
                let resultMessage =  game.isThreeStrikes() ? "👯‍♀️💃🏻👯‍♀️ 🎉YOU WIN🎉 👯‍♀️🕺🏼👯‍♀️" : "🎭 😭YOU LOSE😭 🎭"
                let resultAlert = UIAlertController(title: "Game Over", message: resultMessage, preferredStyle: .alert)
                let resultAlertAction = UIAlertAction(title: "OK👌🏾", style: .default, handler: nil)
                resultAlert.addAction(resultAlertAction)
                game.gameOver()
                // UI UPDATE
                answerLabel.text = answer.getAnswerString()
                present(resultAlert, animated: true)
            }
            game.generateInningResultString()
            // UI UPDATE
            inningsData[inning.getInningCount()]?.inningResultLabel.text = game.getInningResultString()
            inning.increaseInningCount()
            inning.resetPitches()
        }
    }
    
}
