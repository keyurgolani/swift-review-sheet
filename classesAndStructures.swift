// ***** Comparing Classes and Structures *****
//Classes and Structs can: 
//1) define properties     2) define methods     3) define inits      4) provide subscripts        5) be extended to expand their functionality
//6) conform to protocols 

//what classes can do that structs cannot:
//1) inheritance    2) type casting     3) deinitialize an instance to free up resources     4) reference counting allows more than one reference to an instance
//we dont use the term object because both structs and classes have instances that behave very similarly

//structs have memberwise initializers for properties


// ***** Structures and Enumerations are Value Types *****
//value types are copied when assigned to variable or constant


// ***** Classes are Reference Types *****
//references to same instance are used when instances of a class are assigned to a variable or constant 
//identity operators: different from == which we can define to mean whatever in our class 
//=== checks if 2 variables/constants refer to the same instance  (and there is !== too)

class A {
	var name: String?
	init(name: String) {
		self.name = name
	}
}

var a = A(name: "Adam")
var b = A(name: "Beth")
var c = a 
if a === c {
	println("They point to same reference")
} else {
	println("They dont point to same reference")
}


// ***** Choosing Between Classes and Structures *****
//it is usually a good idea to choose a struct when the purpose of the type is to encapsulate a few 
//value types 
//otherwise, most of the time it will be better to just implement the type as a class


// ***** Assignment and Copy Behavior for Strings, Arrays, and Dictionaries *****
//in swift, String Array and Dictionary are implemented as structs so they are value types.
//obviously (if youve been paying attention), this means that they are copied whenever they are assigned to variables or constants 
//however, NSArray, NSString, and NSDictionary are implemented as classes, just in case you ever want 
//reference functionality to these types of containers