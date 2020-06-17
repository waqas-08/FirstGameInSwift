class Character {
    
    static var allCharacterName : [String] = []
    var lifePoint : Int
    var heals : Int
    var nom : String
    var weapon : Weapon
    
    init(nom : String, weapon : Weapon) {
        self.nom = nom
        self.weapon = weapon
        lifePoint = 10
        heals = 5
    }
    
   
    // This function indicates the name of the character who attacks and who he attacks
    // It reduces the opponent's hit points
    // Then it indicates that the opponent has received damage
    func attack(character : Character) {
        print(" \(nom) attack \(character.nom)")
        character.lifePoint -= weapon.attackPoint
        print(" \(character.nom) receives dammages")
        
    }
    
    // This function indicates the name of the character who heals and who he heals
        // It increases the life of the character you choose to heal
        // Then it indicates that the character's hit points have increased
    func heals(character : Character) {
        print(" \(nom) heal \(character.nom)")
        character.lifePoint += heals
        print(" \(character.nom) lifePoint increas")
    }
    
    
    func display(character : Character) {
        print(" Nom: \(character.nom)"
            + "\n LifePoint: \(character.lifePoint)"
            + "\n AttackPoint: \(character.weapon.attackPoint)"
            + "\n Weapon: \(character.weapon)")
    }
    
    
    func display2() {
        print(" Nom: \(nom)"
            + "\n LifePoint: \(lifePoint)"
            + "\n AttackPoint: \(weapon.attackPoint)"
            + "\n Weapon: \(weapon)")
    }
}




