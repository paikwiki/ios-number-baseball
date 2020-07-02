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
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchKeypad(_ sender: UIButton) {
        print(sender.currentTitle!);
    }
}

