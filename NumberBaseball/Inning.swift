//
//  Inning.swift
//  NumberBaseball
//
//  Created by Changhyun Paik on 2020/07/05.
//  Copyright © 2020 Changhyun Baek. All rights reserved.
//

// TODO: Change class keyword to struct
class Inning {

    private(set) var pitching = [Int]()

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

    func resetPitches() {
        pitching.removeAll()
    }

    func pitchABall(pitchNumber: Int) {
        pitching.append(pitchNumber)
    }

}
