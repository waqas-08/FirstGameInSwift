//
//  Game.swift
//  project 3
//
//  Created by waqas- on 10/12/2019.
//  Copyright © 2019 waqas-. All rights reserved.
//

import Foundation

class Game {
    
    var player1 : Player?
    var player2 : Player?
    var numberTour = 0


    // This function will allow us to start the game
        // We will ask each player to choose 3 characters
        // the characters of each player are placed in a different table
        // we then create the players and initialize them with the table of their own
    func startGame() {
        print("Start Game")
        
        var team1 = [Character]()
        var team2 = [Character]()
        
        
        
        team1.append(chooseCharacter(numberCharacter: 1, numberPlayer: 1))
        team1.append(chooseCharacter(numberCharacter: 2, numberPlayer: 1))
        team1.append(chooseCharacter(numberCharacter: 3, numberPlayer: 1))
        
        player1 = Player(team: team1)
        
        
        team2.append(chooseCharacter(numberCharacter: 1, numberPlayer: 2))
        team2.append(chooseCharacter(numberCharacter: 2, numberPlayer: 2))
        team2.append(chooseCharacter(numberCharacter: 3,    numberPlayer: 2))
        
        player2 = Player(team: team2)
        
    }
    
    // This function tells us to choose a name for the character we choose
        // As long as we laugh, we don't move forward
        // If we drop a name, the function will see in an array that we have created in the Character class if the name is there or not
        // If the name is not found in the array then it is integrated in the array and the function returns the name
        // If the name already exists in the array then we are returned to drop another name
    func chooseName(numberCharacter: Int) -> String{
        print("Choose name for your character \(numberCharacter)")
      
        var chooseName : String?
        while chooseName == nil {
            if let nomcharacter = readLine() {
                let exist = Character.allCharacterName.contains(nomcharacter)
                
                if exist == false {
                    Character.allCharacterName.append(nomcharacter)
                    chooseName = nomcharacter
                } else {
                    print("Choose another Name")
                }
            }
        }
        return chooseName!
        
    }

    // This function tells us to choose a character from the choice indicated
        // Each choice corresponds to a Character type, we initialize the name of the character with chooseName, each type of character has an initialized weapon
    func chooseCharacter(numberCharacter: Int, numberPlayer : Int) -> Character {
        

        // Here we ask the player to choose the type of character, we give him 6 choices.
        print("\nPlayer\(numberPlayer): Choose your type character \(numberCharacter)"
            + "\n 1 Magus"
            + "\n 2 Warrior"
            + "\n 3 Dragon"
            + "\n 4 Beast"
            + "\n 5 Demon"
            + "\n 6 M")
        
        // the player indicates his choice here
        let classCharacter = readLine()

        // In relation to his choice, we create a character
                // we also choose a name
                // Each character has a weapon which is initialized
        switch classCharacter {
            
        case "1" :
            let nomcharacter = chooseName(numberCharacter: numberCharacter)
            let character = Magus(nom: nomcharacter, weapon: MagicWand())
            return character
            
        case "2":
            let nomcharacter = chooseName(numberCharacter: numberCharacter)
            let character = Warrior(nom : nomcharacter, weapon: Sword())
            return  character
            
        case "3":
            let nomcharacter = chooseName(numberCharacter: numberCharacter)
            let character = Dragon(nom : nomcharacter, weapon: Axe())
            return character
            
        case "4":
            let nomcharacter = chooseName(numberCharacter: numberCharacter)
            let character = Beast(nom : nomcharacter, weapon: Axe())
            return character
            
        case "5":
            let nomcharacter = chooseName(numberCharacter: numberCharacter)
            let character = Demon(nom : nomcharacter, weapon: MagicWand())
            return character
            
        case "6":
            let nomcharacter = chooseName(numberCharacter: numberCharacter)
            let character = M(nom : nomcharacter, weapon: Sword())
            return character
            
            
        default: return M(nom : "edddj", weapon: Sword())
            
        }
    }

    // This function allows to launch the fight between the players
    func play() {

        // We can see if there is at least one character in each team who has more than 0 life points
        while isGameRunning() {

            // If this is the case We launch the playerTurn function for player 1 against player 2
            onePlayerTurn(numberPlayer: 1, actifPlayer: player1!, oponentPlayer: player2!)

            // We test again if there is at least one character in each team who has more than 0 life points
            if isGameRunning() {
            
                // If this is the case, the turn of player 2 is launched against player 1
                onePlayerTurn(numberPlayer: 2, actifPlayer: player2!, oponentPlayer: player1!)
            }
        }
    }

    // This function lets you know if at least one character in each team has hit points greater than zero
    func isGameRunning() -> Bool {
        return (player1!.team[0].lifePoint > 0 || player1!.team[1].lifePoint > 0 || player1!.team[2].lifePoint > 0 ) && (player2!.team[0].lifePoint > 0 ||
            player2!.team[1].lifePoint > 0 ||
            player2!.team[2].lifePoint > 0)
    }
    
    // The player chooses a character with whom he will play
    // the character characteristics are displayed
    // We ask the player who plays to choose between attacked or heal
    // If the player chooses to attack he will have a 1 in 4 chance that a chest will appear in front of him
    // He will have to choose his opponent who will suffer damage
    // At the end of the attack if the opponent's hit points are negative, the hit points are reduced to 0
    // If the player chooses to heal, he will have to choose a character from his team and the character to heal will see these life points increased
    // If the player has chosen nothing, we return to it or the program asks him to choose between attack and healing
    // After the action to perform, we increment a counter to have the number of turns
    func onePlayerTurn(numberPlayer: Int, actifPlayer: Player, oponentPlayer: Player) {
        
        print("Player\(numberPlayer) Choose your character")
        
        let character1 = actifPlayer.chooseCharacter()
        character1.display(character: character1)
        
        var action = readLine()
        
        repeat {
            
            print("Player\(numberPlayer) Choose character action"
                + "\n1 attack"
                + "\n2 heal")
            
            action = readLine()
            
            
            if action == "1" {
                randomCoffre(character: character1)
                print("Player\(numberPlayer) choose your oponent")
                let character2 = oponentPlayer.chooseCharacter()
                character2.display(character: character2)
                character1.attack(character: character2)
                if character2.lifePoint <= 0 {
                    character2.lifePoint = 0
                }
                character2.display(character: character2)
            } else if action == "2" {
                print("Player\(numberPlayer) choose your character to heal")
                let character2 = actifPlayer.chooseCharacter()
                character2.display(character: character2)
                character1.heals(character: character2)
            }
            
        } while action != "1" && action != "2"
        numberTour += 1
    }

    // This function brings up a chest in the hazar in which there is in the haszar a weapon among six weapons among which they there are powerful and less powerful
        // It indicates to the player that there is a chest which appeared then indicates the name of the weapon which it contains
    func randomCoffre(character : Character) {
        let random1 = arc4random_uniform(4)
        if random1 == 1 {
            print(" appear")
            if let newWeapon = Chest.randomWeapon.randomElement() {
                character.weapon = newWeapon
                print("You have a new weapon: \(character.weapon)")
            }
        }
    }

    // This function will tell us after the game how many laps there have been
        // Then the name of the player who won and the statistics of these characters and the name of the character who lost and the statistics of these characters
    func Stat() {
        print("End of Game"
            + "\n number of turns: \(numberTour)")
        var winner : String
        var winnerTeam : Player
        var loser : String
        var loserTeam : Player
        
        if player1!.team[0].lifePoint <= 0, player1!.team[1].lifePoint <= 0, player1!.team[2].lifePoint <= 0 {
            winner = "player2"
            winnerTeam = player2!
            loser = "player1"
            loserTeam = player1!
        } else {
            winner = "player1"
            winnerTeam = player1!
            loser = "player2"
            loserTeam = player2!
        }
        print("Winner is \(winner)"
            + "\n \(winnerTeam.team[0].display2())"
            + "\n \(winnerTeam.team[1].display2())"
            + "\n \(winnerTeam.team[2].display2())")
            
        print("Loser is \(loser)"
            + "\n \(loserTeam.team[0].display2())"
            + "\n \(loserTeam.team[1].display2())"
            + "\n \(loserTeam.team[2].display2())")
    }
}










