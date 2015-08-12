//differences between Swift and C:
//Swift allows modulus % on floats
//Swift has two range operators: a..<b and a...b

// ***** Terminology *****
//Unary: 1 operand
//binary: 2 operands
//ternary: 3 operands - only one:  a ? b : c


// ***** Assignment operator *****
//doesnt return a value (like true or false), so we cant do this:
//if x = y {
	//this helps prevent the accidental use of = in place of ==
//}


// ***** Arithmetic Operators *****
//you can do float modulus as such:
var floatRemainder = 8 % 2.743
println(floatRemainder)
//increment and decrement operator: ++a increments then returns value, a++ returns value then increments
//unary operator +:
var temperature = -16
println(+temperature) //doesnt change value of operand, merely syntactical sugar


// ***** Compound Assignment Operators *****
var b = 1
b += 5 //equivalent to b = b + 5


// ***** Comparison Operators *****
//all return a Bool value (obvious but sort of gets looked over)


// ***** ternary Conditional Operators *****
//question? answer1 : answer2  ex)
func praise() {
	println("Wow thats alot of friends!")
}
func insult() {
	println("lol loser get more friends")
}
var numberOfFriends = 10
(numberOfFriends > 5) ? praise() : insult()
(numberOfFriends < 12) ? insult() : praise()
//another example
var value1 = 5
var value2 = 5.5 
var value = (value2 < Double(value1)) ? 1 : 2
println(value)


// ***** Nil Coalescing Operator ****** (incomplete)


// ***** Range Operator *****
//closed range: (a...b), a and b are included
for index in 100...100 {
	println(index)
}
for index in 1000..<1001 { //second value must be greater than first value
	println(index)
}
//half-open range: (a..<b) a up to but not including b
var names = ["Alex", "Mark", "Raw", "Can"]
var cizzount = names.count
for index in 0..<cizzount {
	println(names[index])
}


// ***** Logical Operators ******
//not: ! 
//and: &&
//or: ||
//swift uses short circuit evaluation, meaning if while evaluating an &&, 
//if the first value is false then the second value is not even evaluated 
//because it wont change the outcome. Similarly, for || if the first value 
//is true, second value wont be evaluated
