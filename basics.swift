//Lets see if this change shows up ~.~

//Swift types: Int, Doublt, Float, Bool, String 
//Collection types: Array, Dictionary
//also has tuples
//also has optionals, which work with all types - either there is a value, and it is x, or there isnt a value at all


// ***** Constants and Variables *****
//constant: 
let maximumNumberOfLoginAttempts = 10 //Cannot be changed in the future
var currentLoginAttempt = 0 //Can be changed as many times as we want so long as value remains an Int
//mental model for variables vs constants: aim to use let whenever you can,
//and only if you need a variable to change should you declare it with var - bottom line: let should be your default variable declaration keyword
var welcomeMessage: String? //if we try printing this when not in optional form, 
//program crashes. Printing variable of type string optional will print nil
welcomeMessage = "yo"
println(welcomeMessage!)
//string interpolation
println("Ging has a welcome message for you: \"\(welcomeMessage!)\"")

// ***** Comments *****
//single line comments start with //
//multi line comments placed between /* */ 

// ***** Semicolons *****
//only necessary where there are 2+ statements on one line example below
var nudes = 5; nudes = 6; println(nudes)


// ***** Integers ***** 
//All types in Swift have capitalized names
//there are signed integers (Int32 for a 32 bit signed int) and unsigned integers (UInt32)
println(UInt8.max, UInt16.max, UInt32.max) //lets us access bounds for our Int values


//  ***** Floating Point Numbers *****
//2 types for flaoting point numbers:
//1) Double 64-bit floats, for when values must be very large or very precise
//2) Float 32-bit floats, for when values dont require 64-bit precision


// ***** Type Safety and Type Inference *****
//why: expects you to be clear about the types of values youre working with
//how: with type inference, you dont need to explicitly specify the values being assigned to variables - Swift will know by the value you are assigning
//Swift always infers Double from floating point numbers


// ***** Numeric Literals ***** 



// ***** Numeric Type Conversion ***** (incomplete)
// ***** Type Aliases ***** (incomplete)


// ***** Booleans *****
//only boolean expressions will be accepted in conditional statements
//ex)
/*var i = 1
if i {       i is not a conditional statement, i = 1, not true or false
	println("This shouldnt run")
}*/ 
//however, if i == 1 { ... } would run because i == 1 is a boolean expression


// ***** Tuples ***** (incomplete)


// ***** Optionals *****
//use when a value might be absent - works for ALL types
var name: String = "123"
var nameToInt = name.toInt()
println(nameToInt)
//example of why optionals are useful: toInt returns an Int? which means 
//it either returns a value, and that value is an Int, or it doesnt return a value (nil)
//nil can only be assigned to optionals.
//if a variable may possibly deal with the absense of a value, declare it as type optional
//if an optional has a value, it != nil <-- for testing purposes
//forced unwrapping: accessing an optional with variableName! <-- the ! forces the unwrapping
//unwrapping a nil value leads to crash, therefore it's important to compare it to nil (if variable != nil) 
//before unwrapping it for use
//we can also use optional binding to check for a value and use it 
var friend: String? = "rnark"
if let friendName = friend { //this line reads: If friend has a value, assign the value to 
	println(friendName) //the constant friendName, and execute the lines of code after
} else { //the nice part is that our new temporary variable doesnt need to be unwrapped - it 
	println("the optional did not have a value") //takes the value that was within the optional, so (i think) it itself is not an optional
}
//sometimes we'll have programs with optionals that we know are always going to have a value
//after one has been set - in these cases we use implicitly unwrapped optionals
//String! vs String? - String! denotes an implicitly unwrapped optional, so we dont need to unwrap the variable upon use
//just think: automatic unwrapping for implicitly unwrapped optionals


// ***** Assertions *****
//used when you dont have a (valid) value in an optional and therefore your program can no longer 
//continue
//use it to check that an essential condition is true before the program goes any further
//	if condition is false, app terminates
let age = 3
assert(age >= 0, "A person's age cannot be less than 0")
//call assert with a global assert function, first argument is a condition that evaluates to true or false
//second argument is a message that displays if condition evaluates to false
//so finally, use assertions when you have a value that has a possibility of being false
//but that should definitely be true before any more of the program has run








