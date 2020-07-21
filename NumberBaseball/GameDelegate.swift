//
//  GameDelegate.swift
//  NumberBaseball
//
//  Created by Changhyun Baek on 2020/07/16.
//  Copyright © 2020 Changhyun Baek. All rights reserved.
//

protocol GameDelegate: class {
    func gameDidPitch(pitchString: String)
    func gameShouldEndInning(inningResultString: String)
    func gameShouldRestart()
    func gameShouldEnd(isThreeStrkes: Bool, answerString: String)
}
