import Foundation

//Protocols define set of methods and/or properties suited for a particular task 
//No implementation is actually provided - just what the implementation should look like
//classes/structs/enums can ADOPT a protocol, meaning that it implements the required
//methods or properties that the protocol lists
//If a class/struct/enum DOES implement these elements defined in protocol, then we say
//the class/struct/enum conforms to the protocol

// ***** Protocol Syntax *****
//defining a protocol syntax:
protocol SomeProtocol {
	//definition goes in here
}
//we state that a custom type conforms to a protocol by listing it after the custom type's
//name, as if it "inherits" from (for classes) or "is type of" for variables/constants
struct SomeStructure: SomeProtocol { //of course, a type can conform to multiple protocols
	//definition goes here
	//
}

class Animal: NSObject, SomeProtocol { //if custom type inherits from a class, list the superclass before the protocols it conforms to
}




// ***** Property Requirements *****
//all protocol does is specify property type and name - doesnt matter 
//if stored or computed, instance or type property
// also specifies whether each property is gettable or (gettable && settable)
//property requirements always declared as variable properties
protocol AnotherProtocol {
	var someRequiredProperty: Int { get set }
	var someOnlyGettableProperty: String { get } 
	//no only settable propertys exist
	class var someTypeProperty: String { get set }
	//difference between type property and instance property:
	//with instance properties, all instances have their own
	//with type (think class) properties, all instances share one, though to access them
	//im pretty sure you dont even need an instance; you just need ClassName.typeProperty ...
}

protocol FullyNamed {
	var fullName: String { get }
	var age: Int { get set }
}
struct Person: FullyNamed, Printable {
	var fullName: String
	var age: Int
	var description: String {
		return "\(fullName): age \(age)"
	}
}

var myself = Person(fullName: "Jerry Herrera", age: 21)
myself.fullName = "Marta" //Note: protocol requires only a gettable fullName property 
//but that doesnt stop us from setting fullName too - we can if our code makes sense for us to
println(myself.description)




// ****** Method Requirements *****
//function definitions written ONLY - no curly braces, no function body
//type (or class) methods prefixed with static (or class?) 
protocol RandomNumberGenerator {
	func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
	var lastRandom = 42.0
	let m = 139968.0
	let a = 3877.0
	let c = 29573.0
	func random() -> Double {
		lastRandom = (lastRandom * a + c) % m 
		return lastRandom / m
	}
}
//Vocabulary flexing:
//class LinearCongruentialGenerator has instance variables lastRandom,
//m, a, c, and has an instance function random() which it implements to conform
//to the protocol RandomNumberGenerator
var lg = LinearCongruentialGenerator()
println(lg.random())
println(lg.random())




//  ***** Mutating Method Requirements *****
//value types - structs and enums
enum Op {
	case Operand, BinaryOperation, UnaryOperation
}
var op = Op.Operand
op = Op.BinaryOperation
if(op == Op.BinaryOperation) {
	println("nooope")
} else {
	println("good girl")
} //this was to show that we can always modify the value that a variable storing an enum holds 
//prefix function definition with mutating to indicate that function is allowed
//to modify the instance it belongs to OR its properties - for value types ONLY
//ex) mutating func printSelf() <-- allows value types (strucs and enums) to implement the method and conform to protocol 
protocol MutatingProtocolExample {
	mutating func changeSomething()
}
struct Building: MutatingProtocolExample {
	var tenants: Int 
	var area: String 
	mutating func changeSomething() {
		self.tenants = 25
	}
}
var build = Building(tenants: 20, area: "Stuyvesant")
build.changeSomething()
println(build.tenants)
//the protocol MutatingProtocolExample and the struct Building illustrate the purpose
//of prefixing a function with mutating when that function is implemented by a value type:
//it allows you to change properties of the struct or enum - go ahead and omit the mutating 
//keyword within the protocol definition: it wont let you change the tenants property of our 
//build instance
//another example: 
protocol  Toggable {
	mutating func toggle()
}
enum OnOffSwitch: Toggable {
	case Off, On 
	mutating func toggle() {
		switch self {
			case Off: self = On
			case On: self = Off 
		}
	}
}




// ***** Initializer Requirements *****
//write function definition exactly the same way you would in a class or struct, except
//without curly braces or a function body
protocol Initializable {
	init(someParamter: Int, anotherParamter param: String)
}
class AbcClass: Initializable {
	var abc: Int 
	var foo: String
	required init(someParamter: Int, anotherParamter param: String) { //must mark your initializer within the class with required if 
		abc = someParamter             //it is being implemented for conformance with the protocol
		foo = param
		println("values are \(someParamter) and \(param)")
	}
}
var abcInstance = AbcClass(someParamter: 123, anotherParamter: "DEF")
println("\(abcInstance.abc) \(abcInstance.foo)")
//note: the required keyword is so that we implement that init on all subclasses of a class that conforms 
//to a given protocol. Obviously this isnt necessary for classes that are marked with final because they 
//cannot be subclasses. Thus required wont be allowed because who cares about subclasses that wont exist implementing those initializers???

//overriding required initializers:
class DefClass: AbcClass, Initializable {
	//required override init(someParamter: Int, anotherParamter param: String) {
	required init(someParamter: Int, anotherParamter param: String) {	
		super.init(someParamter: 45, anotherParamter: "DFSG")
		println("values are \(someParamter) and \(param)")
		println(self.abc)
	}
} //note: the required override init() requires keywords required and override 
var defInstance = DefClass(someParamter: 23, anotherParamter: "Hello Yellow")




// ***** Protocols as Types *****
//Protocols are TYPES just as structs classes and enums are types 
//and we can use them in: 
//1) as a parameter or return type of a method, function, or initializer
func whatDoesThisDo() -> Toggable {
	var switchOO = OnOffSwitch.On 
	return switchOO
}
//2) as type of constant or variable or property
var switch00: Toggable = OnOffSwitch.Off //you could set switch00 to ANY instance of a type that conforms to the protocol Toggable
//nothing else is required of the instance - ONLY that it conforms to the protocol 

//3) as type of items in an Array or Dict or container
var toggables: [Toggable] = []




// ***** Delegation *****
//Design pattern - allows class or struct to hand over responsibilities to instance of another type
//used to respond to an action or to retrieve data from an external source without needing to know 
//the underlying type of that source
//protocol is meant to encapsulate all the responsibilities such that the conforming type (delegate)
//is guaranteed to provide the functionality that has been delegated
class Dice {
	let sides: Int
	let generator: RandomNumberGenerator
	init(sides: Int, generator: RandomNumberGenerator) {
		self.sides = sides 
		self.generator = generator
	}
	func roll() -> Int {
		return Int(generator.random() * Double(sides)) + 1
	}
}
let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
println(dice.roll())
//we'll use 2 protocols to illustrate Delegation
protocol DiceGame {
	var dice: Dice { get }
	func play()
}
protocol DiceGameDelegate {
	func gameDidStart(game: DiceGame)
	func game(game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
	func gameDidEnd(game: DiceGame)
}
class SnakesAndLadders: DiceGame {
	let finalSquare = 25
	let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
	var square = 0
	var board: [Int]
	init() {
		board = [Int](count: finalSquare + 1, repeatedValue: 0)
		board[03] = 8; board[06] = 11; board[09] = 09; board[10] = 2
		board[14] = -10; board[19] = -11; board[22] = -2; board[24] = -8
	}
	func play() {}
}
//game takes form of SnakesAndLadders which conforms to DiceGame protocol seeing
//how it implements dice and play()




// ***** Adding Protocol Conformance with Extension *****
//You can extend an existing type to adopt and conform to a new protocol 
//Extensions can add new properties, methods, and subscripts to any existing type - 
//so we can add any requirements to make a type conform to a protocol 
protocol TextRepresentable {
	func asText() -> String 
}
//we'll now extend our Dice class from earlier but more importantly we'll do so to make it conform to TextRepresentable protocol 
extension Dice: TextRepresentable {
	func asText() -> String {
		return "a \(sides)-sided die"
	}
}

var d1 = Dice(sides: 13, generator: LinearCongruentialGenerator())
println(d1.asText())
//if a type already conforms to a protocol but does not explicitly state its adopting of the protocol, 
//we can simply extend the class and state its adoption:
struct Hamster {
	var name: String
	func asText() -> String {
		return "a hamfster named \(name)"
	}
}
extension  Hamster: TextRepresentable {}
var hammy = Hamster(name: "Hermione") //dont forget that you can initialize a struct 
//by calling its implicit initializer along with all of its properties followed by a colon and a value
let sommatTextRepresentable: TextRepresentable = hammy
println(sommatTextRepresentable.asText())




// ***** Collections of Protocol Types ***** 
let things: [TextRepresentable] = [hammy, sommatTextRepresentable, d1]
for thing in things {
	println(thing.asText())
}




// ***** Protocol Inheritance ***** 
//you can stack requirements needed by an instance by having it adopt a protocol which 
//inherits from 1 or more other protocols ex)
protocol InheritingProtocol: SomeProtocol, AnotherProtocol {
	//more requirements go here
}
protocol PrettyTextRepresentable: TextRepresentable {
	func asPrettyText() -> String
}
extension Hamster: PrettyTextRepresentable {
	func asPrettyText() -> String {
		return asText() + " :) :) :) "
	}
}
println(hammy.asPrettyText())
//If a type adopts a protocol that inherits one or more protocols, that type must implement 
//ALL properties and methods required by all protocols 




// ***** Class Only Protocols ***** 
//you can limit protocols to only being used by classes by including the keyword class before any protocols from which the protocol inherits
protocol someClassOnlyProtocol: class, PrettyTextRepresentable {
	//this protocol can only be adopted by class types - not structs or enums
}




// ***** Protocol Composition ***** 
//naturally, a type can conform to multiple protocols - it might be useful to 
//conglomerate these protocols into a protocol composition with:  protocol<SomeProtocol, AnotherProtocol>
//with all the different adopted protocols going in the brackets
protocol Aged {
	var age: Int { get }
} 
protocol Named {
	var name: String { get set }
}
class Student: Aged, Named { //cant do it in this case - we just list out all superclasses/protocols separated by commas
	var age = 20
	var name = "Jerry"
}
func wishHappyBirthday(student: protocol<Aged, Named>) { //takes a parameter that conforms both to Aged and Named protocols 
	//all that matters is that argument conforms to those protocols - doesnt matter what type argument is
	println("Hey \(student.name), youre really \(student.age) already?!")
}
var meee = Student()
wishHappyBirthday(meee)




// ***** Checking for Protocol Conformance ***** 





// ***** Optional Protocol Requirements ***** 
