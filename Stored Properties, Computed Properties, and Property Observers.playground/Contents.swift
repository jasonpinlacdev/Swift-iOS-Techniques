import UIKit

enum Color {
    case yellow
    case orange
}

class Pokemon {
    let dexNumber: Int
    let species: String
    
    // property observer
    var isShiny: Bool = false {
        didSet {
            color = isShiny ? .orange : .yellow
        }
    }
    private var color: Color
    
    //computed property
    var isOriginal: Bool {
        get {
            return (dexNumber <= 151) ? true : false
        }
    }
    
    init(dexNumber: Int, species: String, isShiny: Bool = false) {
        self.dexNumber = dexNumber
        self.species = species
        self.isShiny = isShiny
        self.color = self.isShiny ? .orange : .yellow
        print("Creating a pokemon of species: \(self.species) and of dex number: \(self.dexNumber)\n")
    }
    
    func details() {
        print("dexNumber: \(dexNumber)")
        print("species: \(species)")
        print("isOriginal: \(isOriginal)")
        print("isShiny: \(isShiny)")
        print("color: \(color)\n")
    }
}


let myPoke = Pokemon(dexNumber: 25, species: "Pikachu", isShiny: true)
myPoke.details()
myPoke.isShiny = false
myPoke.details()
