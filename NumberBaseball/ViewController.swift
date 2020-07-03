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

    private var answer: [Int] = [-1, -1, -1]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: 세 숫자가 겹치지 않도록 변경
        answer = answer.map({ _ in
            return Int(arc4random_uniform(10))
        })
        print(answer)
    }
    
    @IBAction func touchKeypad(_ sender: UIButton) {
        print(sender.currentTitle!);
    }
}

