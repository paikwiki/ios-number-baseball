//
//  Answer.swift
//  NumberBaseball
//
//  Created by Changhyun Paik on 2020/07/05.
//  Copyright © 2020 Changhyun Baek. All rights reserved.
//

import UIKit

struct Answer: CustomStringConvertible {

    typealias AnswerNumbers = (first: Int, second: Int, third: Int)

    let answer: AnswerNumbers

    init() {
        var numberSet = Set<Int>()
        while numberSet.count < 3 {
            numberSet.insert(Int(arc4random_uniform(10)))
        }
        answer = AnswerNumbers(first: numberSet.popFirst()!,
                               second: numberSet.popFirst()!,
                               third: numberSet.popFirst()!)
        print(answer)
    }

    var description: String {
        "\(answer.first)   \(answer.second)   \(answer.third)"
    }

}
