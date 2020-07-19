//
//  GameDelegate.swift
//  NumberBaseball
//
//  Created by Changhyun Baek on 2020/07/16.
//  Copyright © 2020 Changhyun Baek. All rights reserved.
//

protocol GameDelegate: class {
    func updateUILabels()
    func resetUILabels()
    func showResult(gameResult: Bool)
}
