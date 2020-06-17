//
//  Player.swift
//  project 3
//
//  Created by waqas- on 10/12/2019.
//  Copyright © 2019 waqas-. All rights reserved.
//

import Foundation

class Player {

    // variable table of type Character, it contains the characters of the player
    var team = [Character]()
    
    
    init(team : [Character]) {
        self.team = team
        print("\(team)")
    }
    
    // This function allows you to choose a character in the Character table
    // When we laugh we are asked to choose a character
    // If the character has 0 life, then we cannot choose it and we are asked to choose another character
    func chooseCharacter() -> Character {
        print (" 1 \(self.team[0].nom)"
            + "\n 2 \(self.team[1].nom)"
            + "\n 3 \(self.team[2].nom)")
        
        var selectCharacter : Character?
        
        while selectCharacter == nil {
            
            if let character = readLine(), let index = Int(character), index <= team.count, index > 0 {
                let cSCharacter = team[index-1]
                if cSCharacter.lifePoint <= 0 {
                    print("This character have 0 lifePoint"
                        + "\n choose another character")
                    
                } else {
                    selectCharacter = cSCharacter
                    
                }
            }
            
        }
        return selectCharacter!
    }
    
}









