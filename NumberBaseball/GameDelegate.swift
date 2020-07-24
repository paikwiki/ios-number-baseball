//
//  GameDelegate.swift
//  NumberBaseball
//
//  Created by Changhyun Baek on 2020/07/16.
//  Copyright © 2020 Changhyun Baek. All rights reserved.
//

protocol GameDelegate: class {
    func gameDidPitch(pitchString: String)
    func gameDidFinish(_ game: Game)
    func game(_ game: Game, didEndInning inning: Inning, inningResultString: String)
}
