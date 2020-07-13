//
//  Inning.swift
//  NumberBaseball
//
//  Created by Changhyun Paik on 2020/07/05.
//  Copyright © 2020 Changhyun Baek. All rights reserved.
//

struct Inning: CustomStringConvertible {

    var pitching = [Int]()
    var isEnded: Bool {
        pitching.count > 2
    }
    var description: String {
        (0..<3).map({ index in
            pitching.count > index ? String(pitching[index]) : "_"
        }).joined(separator: "  ")
    }

}
