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
    private(set) var pitchesString = "_  _  _"

    func isThrowThreeBalls() -> Bool {
        return (pitches.count > 2)
    }

    func resetPitches() {
        pitches.removeAll()
        pitchesString = "_  _  _"
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
    
    func updatePitchesString(pitchNumber: Character) {
        var tempCharacterArray = [String.Element]()
        tempCharacterArray = Array(pitchesString)
        for index in 0..<tempCharacterArray.count {
            if tempCharacterArray[index] == "_" {
                tempCharacterArray[index] = String.Element(String(pitchNumber))
                break
            }
        }
        pitchesString = String(tempCharacterArray)
    }
    
}
