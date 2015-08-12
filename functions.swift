//functions are types too, and the type is described by the parameters the function takes and the values it returns
//this means you can pass functions to functions, return functions from functions, define functions 
//within other functions (like you would define an Int in a function) to encapsulate useful 
//functionality

// ***** Defining and Calling Functions ***** 
//function definition:   func sayHello(personName: String) -> String 
//tells us all we need to know about the function (minus the body): function name, paramter names/types, and return types 
//calling this function, since its a standalone function, would require no paramter names
//ex:  sayHello("Anna")


// ***** Function Parameters and Return Values *****
//functions with multiple return values - we can do this with a tuple
func minMax(array: [Int]) -> (min: Int, max: Int) { //naming the return values allows us to access
	var currentMin = array[0]   //them with dot notation outside of the function
	var currentMax = array[0]
	for n in array[1..<array.count] {
		if(n > currentMax) {
			currentMax = n
		}
		if(n < currentMin) {
			currentMin = n
		}
	}
	return (currentMin, currentMax)
}
var (mn, mx) = minMax([3, 6, 9, 10, 1, 45, -5])
println("\(mn) \(mx)")
var result = minMax([3, 6, 9, 10, 1, 45, -5])
println("\(result.min) \(result.max)")
var toop = (a: 25, b: "Hello")
println(toop.a)
println("\(result.0) \(result.1)")
//println("\(result[0]) \(result[1])")
//returning optional tuples is denoted just like returning return an optional of any type: ? after the type 
// -> (min: Int, max: Int)?   so the function would either return a tuple or nil 
//note that this is different from -> (min: Int?, max: Int?) because in this case, a  tuple is 
//still always returned, it just may be the case that both values within the tuple are nil.
// 8/12/15: so, optional tuples are different from tuples with optional values stored in them



// ***** Function Parameter Names *****
func greetFromCountry(name: String, andCountry country: String) {
	println("Hello \(name), all the way from \(country)!")
}
greetFromCountry("Jery", andCountry: "France")
//to make function calls more descriptive, we can add External paramter names right before the paramter name 
//just like they would appear in a class init() function. It's not an all-or-nothing deal; one or many or all
//of your parameters may have external paramter names, just dont forget to label them in function calls as I did in the above example
//needless to say, regular parameter names dont need to be labeled in function calls, only External paramter names 

//And then there are shorthand external paramter names which act as both an external parameter name and a parameter name by which we 
//refer to parameters in the function body. We treat these like regular paramter names with a # prefixing it to denote the shorthandedness
func say(#name: String, #andAge: Int) {
	println("Hey \(name) at \(andAge) years old")
}

say(name: "Jerry", andAge: 15)
//Default paramter values - we include paramters with default values at the end so as to maintain function parameter order 
//in function calls. 
//if we provide a value for the parameter, then the function uses that value. If not, then the default value is used.
func greetFromCounty(name: String, country: String = "USA") {
	println("Hello \(name), all the way from \(country)!")
}
greetFromCounty("Jerry", country: "France") //interesting: if we include a default value for a non Externally named parameter, we need to label that regular paramter name in the function call 
//this is an automatic external name for a default-valued parameter 
//Variadic parameters: Function accepts variadic parameters when it accepts any number of values of the type of the variadic paramter.
//To denote variadic parameter, include the type of the parameter followed by ...
//only one v. paramter per function, and must come at the end. If function has default valued parameters AND a variadic parameter, include variadic parameter at the end 
func computeAverage(numbers: Double...) -> Double {
	var total: Double = 0
	for number in numbers {
		total += number
	}
	return total / Double(numbers.count)
}

println(computeAverage(3, 4, 2, 9, 100, 57))
//function paramters are constants by default, so you cant modify them. If you want them to be variables, 
//simply write var before the paramter name
//swifts version of passing by reference - inout variables. You can pass a variable (not a constant or a literal because those cant be modified)
//to a function and whatever changes made to it within the function last after the function call. 
//default valued parameters cant be inout nor can variadic parameters 
//denote an inout variable by placing inout before the parameters name, and in the function call prefix variable name with &
func greetPerson(inout name: String) {
	name = "Greg"
	println("Nope, your name is \(name) now")
}
var myName = "Jerry"
greetPerson(&myName)
println(myName)


// ***** Function Types *****
//Functions have a type described by their parameters and return types 
//() -> () is the type of a function with no parameters and no return values - so it just returns an empty tuple
//(Int, Int) -> Int is the type of a function with two Int type parameters and one return value of Int type



// ***** Nested Functions *****
//all the functions we've defined have been global functions
//we can define functions within other functions - nested functions 
//nested functions are hidden from outside world but of course we can return them because functions have types as we just learned
func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
	func stepForward(input: Int) -> Int { return input + 1 }
	func stepBackward(input: Int) -> Int { return input - 1 }
	return backwards ? stepBackward : stepForward
}
var currentVal = 5
let moveCloserToZero = chooseStepFunction(currentVal > 0)
while(currentVal != 0) {
	currentVal = moveCloserToZero(currentVal)
	println(currentVal)
}

