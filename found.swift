class A {
	var a: Double = 6
	class func printVal(#b: Double, bigC c: Double) { //if this type method were in a struct or an enum, the keyword before func would be static
		println(b)
	}
	func printA() {
		println(a)
	}
}

let ay = A()
ay.printA()
A.printVal(b: 7, bigC: 8) //remember, all parameters after the first within a function defined for a class 
//must be labeled 