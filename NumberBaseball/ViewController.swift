//
//  ViewController.swift
//  NumberBaseball
//
//  Created by Changhyun Baek on 2020/04/29.
//  Copyright © 2020 Changhyun Baek. All rights reserved.
//

import UIKit

struct UserAnswerAndBallCount {
    var userAnswerLabel: UILabel
    var ballCountLabel: UILabel
}

class ViewController: UIViewController {
    
    @IBOutlet var answerLabel: UILabel!
    @IBOutlet var userAnswerLabel01: UILabel!
    @IBOutlet var userAnswerLabel02: UILabel!
    @IBOutlet var userAnswerLabel03: UILabel!
    @IBOutlet var userAnswerLabel04: UILabel!
    @IBOutlet var userAnswerLabel05: UILabel!
    @IBOutlet var userAnswerLabel06: UILabel!
    @IBOutlet var userAnswerLabel07: UILabel!
    @IBOutlet var userAnswerLabel08: UILabel!
    @IBOutlet var userAnswerLabel09: UILabel!
    @IBOutlet var ballCountLabel01: UILabel!
    @IBOutlet var ballCountLabel02: UILabel!
    @IBOutlet var ballCountLabel03: UILabel!
    @IBOutlet var ballCountLabel04: UILabel!
    @IBOutlet var ballCountLabel05: UILabel!
    @IBOutlet var ballCountLabel06: UILabel!
    @IBOutlet var ballCountLabel07: UILabel!
    @IBOutlet var ballCountLabel08: UILabel!
    @IBOutlet var ballCountLabel09: UILabel!
    
    private var isThreeStrikes = false;
    private var inningsCount = 9
    private var inningsData = [Int: UserAnswerAndBallCount]()
    private var inning = Inning(inningCount: 1)
    private let answer = Answer()
    
    private func generateUserAnswerString(inputValue: String) -> String? {
        let currentUserAnswerString = self.inningsData[inning.getInningCount()]!.userAnswerLabel.text!
        var tempCharacterArray = [String.Element]()
        
        tempCharacterArray = Array(currentUserAnswerString)
        for index in 0..<tempCharacterArray.count {
            if tempCharacterArray[index] == "_" {
                tempCharacterArray[index] = String.Element(inputValue)
                break
            }
        }
        
        return String(tempCharacterArray)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        print(answer.getFormattedAnswer())

        inningsData = [1: UserAnswerAndBallCount(userAnswerLabel: userAnswerLabel01, ballCountLabel: ballCountLabel01)]
        
    }
    
    @IBAction func touchKeypad(_ sender: UIButton) {
        print(sender.currentTitle!);
        inning.throwABall(numberCharacter: Character(sender.currentTitle!))
        inningsData[1]?.userAnswerLabel.text = generateUserAnswerString(inputValue: sender.currentTitle!)
        
        if inning.isThrowThreeBalls() {
            inningsData[1]?.ballCountLabel.text = "1S 1B"
            print(inning.getPitches() == answer.getAnswer())
        }
    }
}

