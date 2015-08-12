class Animal {
	var name: String
	init(name: String) {
		self.name = name
	}
}

class Mammal: Animal {
	var speciesName: String
	init(speciesName: String, andName: String) {
		// WRONG super.init(name: andName)
		self.speciesName = speciesName
		super.init(name: andName)
	}
}

class Fish: Animal {
	var informalSpeciesName: String 
	var hasGills: Bool
	init(speciesName: String, hasGills: Bool, name: String) {
		self.informalSpeciesName = speciesName
		self.hasGills = hasGills
		super.init(name: name)
	}
}

var monkey = Animal(name: "Monkey")
println(monkey.name)

var munkey = Mammal(speciesName: "Homosapian", andName: "mariam")
println("\(munkey.name) \(munkey.speciesName)")

var sharkJerry = Fish(speciesName: "Shark", hasGills: true, name: "Jerry")
println("\(sharkJerry.informalSpeciesName) \(sharkJerry.hasGills) \(sharkJerry.name)")

munkey = munkey as Animal

