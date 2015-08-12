func sayHay(name: String, age: Int, planet: String) {
	println("I'm \(name) and I am \(age) and I hail from \(planet)")
}

func sayHay1(name: String, age: Int, andPlanet planet: String) {
	println("I'm \(name) and I am \(age) and I hail from \(planet)")
}

func sayHey(name: String, #age: Int, planet: String) { //shorthand external parameter name
	println("I'm \(name) and I am \(age) and I hail from \(planet)")
}

func sayHoy(name: String, age: Int, planet: String = "Venus") { //default parameter value
	println("I'm \(name) and I am \(age) and I hail from \(planet)")
}
func sayHiy(name: String, age: Int, planet: String = "Venus", country: String = "USA") { //default parameter values
	println("I'm \(name) and I am \(age) and I hail from \(country), \(planet)")
}

func sayHays(name: String, age: Int, planets: String...) { 
	println("I'm \(name) and I am \(age) and I hail from \(planets)")
}
func sayHays1(name: String, age: Int, country: String = "USA", planets: String...) { 
	println("I'm \(name) and I am \(age) and I hail from \(country), \(planets)")
}

func sayHoy1(inout name: String, age: Int) {
	name = "Jack"
	println("I'm \(name) and I am \(age).")
}
func sayHoy2(inout names: [String], age: Int) {
	names.append("Kobe")
	println("We are \(names), and we are \(age)")
}


sayHay("Jerry", 21, "Mars") //no external parameter names, so no need for parameter labels
sayHay1("Jerry", 21, andPlanet: "Saturn")
sayHey("Jerry", age: 21, "Pluto") //shorthand external paramter name used with #, so we include paramter name age
sayHoy("Jerry", 21, planet: "Neptune")
sayHiy("Jerry", 21, country: "France") //func definition with multiple default values. keep them all at the end, and refer to them by their external parameter names to not confuse swift
sayHays("Jerry", 21, "triggerville", "holtsville", "looneytuneville") //function with variadic parameter
sayHays1("Jerry", 21, country: "Japan", "triggerville", "holtsville", "looneytuneville") //function with variadic parameter after default parameter value
var name = "Jerry"
var names = ["James", "LeBron"]
sayHoy1(&name, 21)
println(name)
sayHoy2(&names, 21)
println(names)

