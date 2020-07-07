//
//  Answer.swift
//  NumberBaseball
//
//  Created by Changhyun Paik on 2020/07/05.
//  Copyright © 2020 Changhyun Baek. All rights reserved.
//

import UIKit

class Answer {
    
    private(set) var answer = [Character]()
    
    init() {
        answer = createAnswer()
    }
    
    func getAnswerString() -> String {
        var formatString = ""
        for index in 0..<answer.count {
            formatString = formatString + String(answer[index])
            if index < (answer.count - 1) {
                formatString = formatString + "   "
            }
        }
        return (formatString)
    }
    private func createAnswer() -> [Character] {
        var answerSet = Set<Character>()
        while answerSet.count < 3 {
            answerSet.insert( Character(String(Int(arc4random_uniform(10)))) )
        }
        print(Array(answerSet))
        return Array(answerSet)
    }
    
    func resetAnswer() {
        answer.removeAll()
        answer = createAnswer()
    }

}
