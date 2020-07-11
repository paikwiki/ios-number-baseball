//
//  Inning.swift
//  NumberBaseball
//
//  Created by Changhyun Paik on 2020/07/05.
//  Copyright © 2020 Changhyun Baek. All rights reserved.
//

struct Inning {

    var pitching = [Int]()

    var pitchesString: String {
        var pitchesCharaterArray = Array("_  _  _")
        for index in 0..<pitching.count {
            guard let pitchesStringIndex = pitchesCharaterArray.firstIndex(of: "_") else { break }
            pitchesCharaterArray[pitchesStringIndex] = String.Element(String(pitching[index]))
        }
        return String(pitchesCharaterArray)
    }
    var isThrowThreeBalls: Bool {
        pitching.count > 2
    }

}
