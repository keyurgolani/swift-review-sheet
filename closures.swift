// ***** Closure Expressions *****
//if we have very concise functions that we would pass as a paramter for example, we may not even need to
//define the function - we could just implement the functions code in a closure syntax for brevity

//closure expression syntax: 
// { (parameters) -> return type in 
//	closure body }    similar to a function definition except while the brackets would start after the function return type and paramters,
//in a closure the brackets engulf the entire closure 
//secondly, since there ARE no brackets to signal the start of the closure body, we use the key word "in"
//to indicate that the closure body follows
//closure expression syntax can use constants, variables, and inout variables - no default values and only variadic parameters if you name it and 
//include it last on the list
//ex) 
//reverse = sorted(names, { (s1: String, s2: String) -> Bool in return s1 > s2 })
//here, a closure is an argument to the function sorted which also takes an array (names) and returns a new array
//swift can infer type, and since sorted is expected a closure that accepts 2 paramters and returns a bool, we dont need 
//to include that in our closure expression. In other words, we couldve written:  sorted(names, { s1, s2 in return s1 > s2})
//in single expression closures, we dont even need the return keyword because the single expressions value is implicitly returned, 
//so we coulve written ...sorted(names, { s1, s2 in s1 > s2 } )
//swift also provides you with shorthand argument names so you dont even need to provide your own in the closure definition, 
//meaning we can move on straight to the body. And because we can move on straight to the body, the closure ONLY has a body, so the in keyword isnt necessary.
//thus,    sorted(names, { $0 > $1 }) is the most concise possible version 



// ***** Trailing Closures *****
//if you have a relatively long closure, you can make it your functions last argument and include it outside of the parentheses of the function call 
func printerFunc() {
	println("Heyyyyy")
}

func someFunctionThatTakesAClosure(closure: () -> ()) {
	closure()
}
someFunctionThatTakesAClosure(printerFunc)
someFunctionThatTakesAClosure() {
	println("Yooooo")
}
//here we see that since a closure is the last argument to our function, we can call the function with the closure outside of the parentheses 
//and within brackets outside. 



// ***** Capturing Values *****
//closures can capture values from surrounding context
//ex) 
func makeIncrementor(forIncrement amount: Int) -> () -> Int {
	var runningTotal = 0
	func incremetor() -> Int {
		runningTotal += amount
		return runningTotal
	}
	return incremetor
}
//here we see nested function incremetor() captures the local variable runningTotal and the parameter amount
var crementor = makeIncrementor(forIncrement: 7)
println(crementor()) //7
println(crementor()) //14

//SO what this all means: closures are reference types, which means whenever a closure is created, a reference to it is actually created.
//If you assigned an existing closure to a new variable, they would both point to the same reference.
//So when we talk about capture values, we mean that if a closure uses a variable in the scope of the context it created,
//each reference to that closure will contain its own reference to that variable to work with
//so above, a runningTotal variable is in the function that creates a closure. The function adds amount to runningTotal
//and returns it. Thus, the reference to the closure returned will contain its own reference to a variable named runningTotal that will
//increment by amount each time the closure is called.


// ***** Closures are Reference Types *****
//functions and closures are reference types
//setting constant or variable to a function or closure is actually assigning a reference to that closure or function

