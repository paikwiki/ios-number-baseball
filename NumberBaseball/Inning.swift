//
//  Inning.swift
//  NumberBaseball
//
//  Created by Changhyun Paik on 2020/07/05.
//  Copyright © 2020 Changhyun Baek. All rights reserved.
//

class Inning {
    
    private var pitches = [Character]()
    private var inningCount: Int
    
    init(inningCount: Int) {
        self.inningCount = inningCount
    }
    
    func isThrowThreeBalls() -> Bool {
        return (pitches.count > 2)
    }
    
    func getPitches() -> [Character] {
        return pitches
    }
    
    func throwABall(numberCharacter: Character) {
        pitches.append(numberCharacter)
    }
    
    func getInningCount() -> Int {
        return (inningCount)
    }
    
}
