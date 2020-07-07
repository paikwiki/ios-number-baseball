//
//  Inning.swift
//  NumberBaseball
//
//  Created by Changhyun Paik on 2020/07/05.
//  Copyright © 2020 Changhyun Baek. All rights reserved.
//

class Inning {
    
    private(set) var inningCount = 1
    private(set) var pitches = [Character]()
    var pitchesString: String {
        get {
            var pitchesCharaterArray = Array("_  _  _")
            for index in 0..<pitches.count {
                guard let pitchesStringIndex = pitchesCharaterArray.firstIndex(of: "_") else { break }
                pitchesCharaterArray[pitchesStringIndex] = String.Element(String(pitches[index]))
            }
            return (String(pitchesCharaterArray))
        }
    }

    func isThrowThreeBalls() -> Bool {
        return (pitches.count > 2)
    }

    func resetPitches() {
        pitches.removeAll()
    }
    
    func pitchABall(pitchNumber: Character) {
        pitches.append(pitchNumber)
    }
    
    func increaseInningCount() {
        inningCount += 1
    }
    
    func resetInningCount() {
        inningCount = 1
    }
    
}
