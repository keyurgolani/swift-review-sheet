// Strings and Characters 
//Swift strings are represented by the Swift type, which represents a collection
//of values of Character type

// ***** String Literals *****
let name = "Jerry" //<- name is implicitly typed as a String because it is assigned a String literal


// ***** Initializing Empty String *****
//2 ways: 1) empty string literal 2) string initializer
var foo = ""
var bar = String()
var baz = String("Jerry") //not an empty string, but note how we can pass a string literal
//to the String initalizer thus giving the variable that string value
println(baz)
if bar.isEmpty {
	println("Dat string is emptier than my soul")
}


// ***** String Mutability *****
//var and constant at work again: if we want our string to be mutable, we
//use a var. if not, we use let. ex)
var mutableString = "harry"
mutableString += " potter"
println(mutableString)
let wizard = "Draco "
//wizard += "Malfoy" this gives compile time error


// ***** Strings Are Value Types *****
//Strings are a value type meaning that if you pass strings to functions or
//assign them to other variables, the string value is copied and then used, 
//the original value is not used
func seeIfStringChanges(var testString: String) { //we put var in there because parameters are constants by default
	testString = testStr + " loooooool" 
	println(testString)
}
func seeIfStringChanges2(var testString: String) -> String { //we put var in there because parameters are constants by default
	testString = testStr + " loooooool" 
	println(testString)
	return testString
}
var testStr = "hahaha"
seeIfStringChanges(testStr) //this will print out something else. We modified our testStr 
//within the function but what we actually modified was a copy, so in actuality our original testStr was not modified
println(testStr)
testStr = seeIfStringChanges2(testStr) //this time around we changed testStr because we assigned it
//the value returned by seeIfStringChanges2
println(testStr)


// ***** Working With Characters *****
for character in "anime" {
	println(character)
}
for blahhhh in "barf" {
	println(blahhhh)
}
var d: Character = "D"
println("She doesnt want the \(d) dude")


// ***** Concatenating String and Characters *****
var welcome = "Hello there"
let exclamation: Character = "!"
welcome.append(exclamation) //this is how to concatenate string and character
println(welcome)


// ***** String Interpolation *****
//include non string values in string literals with \() ex)
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
println(message)
var randomAssortmentOfNumbers = [1,3, 34, 546,73,23,1]
println("here is a random assortment of numbers: \(randomAssortmentOfNumbers)")


// ***** Unicode ***** (incomplete)


// ***** Counting Characters *****
//use global function count elements
var randomLetters = "sgfdgddg"
println("\(countElements(randomLetters))")


// ***** Comparing Strings *****
//3 ways: 
//1. String and Character equality
let quotation = "We're alot alike"
let sameQuotation = "We're alot alike"
if quotation == sameQuotation {
	println("These are the same string")
} //if strings as they appear are equal, then comparing them with == will result in true
//even if their grapheme clusters are different
//2. and 3. Prefix equality and Suffix equality
let stringArray = ["fsgdf", "bfc", "xzbfxz", "asdg", "shdz", "asdgz"]
for str in stringArray {
	if str.hasPrefix("a") {
		println(str)
	} else if str.hasSuffix("z") {
		println(str)
	}
}



// ***** Unicode Representations of String ***** (incomplete)