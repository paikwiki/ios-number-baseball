//
//  Answer.swift
//  NumberBaseball
//
//  Created by Changhyun Paik on 2020/07/05.
//  Copyright © 2020 Changhyun Baek. All rights reserved.
//

import Foundation

struct Answer: CustomStringConvertible {

    let first: Int
    let second: Int
    let third: Int

    init() {
        var numberSet = Set<Int>()
        while numberSet.count < 3 {
            numberSet.insert(Int(arc4random_uniform(10)))
        }
        first = numberSet.popFirst()!
        second = numberSet.popFirst()!
        third = numberSet.popFirst()!
        print(self.description)
    }

    var description: String {
        "\(first)   \(second)   \(third)"
    }

}
