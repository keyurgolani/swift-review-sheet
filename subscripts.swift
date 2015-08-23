// ***** Subscripts Syntax *****
//definition is similar to instance method definition:
//keyword subscript, input parameters and return value 
//difference is that subscripts can be read-write or read only 
class A {
	subscript(index: Int) -> Int {
		get {
			return index * 5
		}
		set(newValue) {
			println("new value is \(newValue)")
		}
	}
}
var inst = A()
inst[10] = 70
//newValue is of the same type as the return value, also newValue could have been named adamCarolla.
//it doesnt matter, but if you omit the paramter name the default name newValue is given to you for free as with computed properties
//similarly, as with computed properties, if your subscript is read only you can get rid of the get/set altogether and just code up your implementation
struct MultiplicationTable {
	var multiplier: Int 
	subscript(index: Int) -> Int {
		return multiplier * index
	}
}

let timesTable = MultiplicationTable(multiplier: 4)
println(timesTable[5])


// ***** Subscript Usage *****
//it should just be noted that dictionary subscripts return an optional to model the fact
//that not every key will have a value 


// ***** Subscript Options *****
//subscripts can use variables and variadic paramters but not default parameters or inout parameters 
//subscript overloading - you can implement many different subscripts for classes and structs and the 
//system will know which one to use based on what's in the brackets.
//Also, it should be noted that parameters and return values can be of ANY type 
