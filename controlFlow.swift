//for and while loops to do things multiple times
//if and switch to execute different branches of code
//also, for-in loop allows iteration over sequences
//switch statement much more powerful than that of C

// ***** For Loops *****
//for in: 
for index in 1...5 { //1...5 denotes a closed range
	println("\(index) times 5 is \(index * 5)")
}
//in each iteration, index is a constant, which makes me wonder what will happen if we 
//iterate through an array of class instances using a for-in loop. Lets find out
class SimpleClass {
	var field: Int
	init(field: Int) {
		self.field = field
	}
}
//note: we can initialize our one instance variable without a label in the initializer because theres only one instance variable
var bunchaInstances = [SimpleClass(field: 4), SimpleClass(field: 10), SimpleClass(field: 2)]
for instance in bunchaInstances {
	instance.field = 5
}
for x in bunchaInstances {
	println(x.field)
}
//so we have our answer: it seems since SimpleClass is a reference type, when we iterate through
//an array of SimpleClass instances, the variable holding the current element is not a constant but 
//a reference to an instance, meaning it can be changed
//if we dont care at all about the for-in loop variable, we just underscore it:
for _ in 1...5 {
	println(7)
}
//we can iterate through an array too to access the (key, value) pairs returned as a tuple
var numberOfLegs = ["spider" : 8, "ant" : 6, "dog" : 4]
for (animalName, legs) in numberOfLegs {
	numberOfLegs[animalName] = 5
}
for ch in "Hello" {
	println(ch)
}
//classic for loop:
for var index = 0; index < 3; index++ {
	println("abc\(index)")
}


// ***** While Loops *****
//2 kinds: classic while loop and do-while loop
//1) while loops evaluate condition at the begining
//2) do-while loops evaluate condition at the end


// ***** Conditional Statements *****
//if statements and switch statements
//if statements: too basic to even code up
//here, we want to check what rating a customer gave, and then print that rating:
var rating = 3
switch rating {
	case 1: println("You gave it *")
	case 2: println("You gave it **")
	case 3: println("You gave it ***")
	case 4: println("You gave it ****")
	case 5: println("You gave it *****")
	default: println("You gave it an invalid rating.")
}
//another example:
var character: Character = "g"
switch character {
	case "a", "e", "i", "o", "u": println("\(character) is a vowel")
	default: println("Character is either a consonant or a number or a symbol")
}
//in C switch statements, control falls through the bottom, thus requiring an explicit break.
//in Swift, as soon as theres a match and that match's code executes, switch moves on past the switch statement
//that being said, you MUST have at least one executable line of code for each case. if your program requires none, a break would suffice
var largeNumber = 1_000
println(largeNumber)
switch largeNumber {
	case 0: break
	case 1...9: break
	case 10...99: break
	case 100...999: break
	default: break
} //this just illustrates that values in switch statements can also be checked for inclusion within a range
//guess what? You can even test tuples with switch statements:
let coordinate = (1, 1)
switch coordinate {
	case (0, 0): println("at the origin")
	case (_, 0): println("on the x axis")
	case (0, _): println("on the y axis")
	case (1, 1): println("binpon") //interesting... with tuples, there may be some overlap between the cases, and the switch that gets toggled is the one that comes first
	case (-2...2, -2...2): println("within the box")
	default: break
}
//yeah, the book just mentioned my note above: there can be multiple matching cases in Swift unlike in C,
//and the way that is handled is the first matching case is executed and nothing more
//value binding: we can assign the values we're testing for to variables/constants to use them within the switch case body
switch coordinate {
	case (let x, 0): println("On the x axis with an x value of \(x)")
	case (0, let y): println("On the y axis with a y value of \(y)")
	case var (x, y): println("coordinates: \(x), \(y)") //note that this acts as a catch all, also 
	//note that we place the keyword var outside of the tuple to indicate that both are variables
}
//where - you can add conditions 
switch coordinate {
	case (var x, let y) where x == y: println("On the line x = y")
	//this only runs when x = y
	case (let x, var y) where x == -y: println("On the line x = -y")
	case let (x,y): println("Is an arbirary point")
}


// ***** Control Transfer Statements *****
//continue: tells loop to continue on to the next iteration without executing any remaining code within the loop 
//break: exits the loop immediately, also for switch statements
//fallthrough: in C, switch statements can fall through to lower cases if a break is explicited 
	//in Swift, we can allow this behavior (default behavior is no falling through)
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
	case 2, 3, 5, 7, 11, 13, 17, 19:
		description += " a prime number, and also"
		fallthrough
	case 5: 
		description += " an even number, and also"
		 //note: this will print even though the value we're checking is 5.
		//this is because fallthrough DOESNT CHECK THE NEXT CONDITION IT FALLS INTO THROUGH
		//instead, it just continues executing statements from the next case
	default: 
		description += " an integer."
}
println(description)
//Labeled statements: something we've never worked with before
//you can label loops and switch statements and use these labels with break or continue
//ex)   myWhileLoopLabel: while *condition* {
			//*statements*
//}



