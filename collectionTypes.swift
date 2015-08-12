//Swift has 2 collection types: Array and Dictionary. Array - ordered list
//because arrays are ordered, values can be looked up with integer subscripts 
//Dictionary - unordered list of values which can be looked up through keys

// ***** Mutability of Collections *****
var array = [Int]() //mutable array cause we assigned to variable
array.append(3)
array.append(19)
for i in 0..<array.count {
	println(array[i])
}
let arrrrr = [12, 45, 6]
for element in arrrrr {
	println(element)
}
//arrrrr.append(0)  immutable array cause we assigned to constant - size and contents cannot be changed


// ***** Arrays *****
//swift very clear about what elements can be stored in and returned from an Array - unlike NSArrays in Obj C 
//Array<SomeType> or [SomeType], shorthand notation preferred
//you can create an array with an Array Literal:  comma separated list placed within []'s
var numbers: Array<Int> = [1, 2, 3, 10, 20, 30] //this is an array Literal, it initializes numbers
//note: bc of swifts type inference, explicitly stating Array<Int> was unncessary
var shoppingList = ["eggs", "milk"]
println(shoppingList.count)
println(shoppingList.isEmpty)
shoppingList.append("yogurt")
shoppingList += ["steak", "bread"] //appended an Array literal to shopping list. 
//Goes without saying we couldve done this with a variable/constant instead of a literal
var item = shoppingList[2]
//now THIS is neat: we can obviously do something like this:
shoppingList[0] = "organic eggs"
//but take a look at this: we can replace a whole range of items in the list with elements
//even if the respective lengths arent equal
shoppingList[1...4] = ["meat"]
shoppingList.insert("honey", atIndex: 0)
var removedItem = shoppingList.removeAtIndex(2) // removeAtIndex() returns the removed element
//removeLast() also removes and returns
//allows us to iterate through items in an array: for-in loop
for item in shoppingList {
	println(item)
}
println(removedItem)
//note: you WILL get a runtime error if you try to subscript with an index that is out of the arrays index range.
shoppingList.append("milk")
//this next thing is pretty neat: using the global enumerate function:
for (index, value) in enumerate(shoppingList) { //takes an Array as an argument
	println("Item \(index): \(value)")
}
//Initializing an array: we've already seen initializing with literal, we can also do this to initialize an empty array:
var newArray = [Int]() //essentially an Array<Int> constructor, returns an empty array and stores it in newArray
//alternative initializer (im used to constructor): if we want x of the same elements y, we do
var allZeroesBaby = [Int](count: 10, repeatedValue: 0)
//adding arrays:
var finalArray = newArray + allZeroesBaby
for l in finalArray {
	println(l)
}


// ***** Dictionaries ****** (incomplete)