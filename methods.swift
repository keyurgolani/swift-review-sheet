//classes structs and enums can all define instance and type methods. 
//instance methods are called with an instance, type methods are called with a type name
//that structs and enums can define methods is what separates swift from C and Objective C,
//in which only classes can define methods. 

// ***** Instance Methods *****
//instance methods can only be called with instances of the type it belongs to 
//ex you cant call String methods on a Dog instance
//instance methods have implicit access to all other defined instance methods and properties
//local and external parameter names:
//recall that for functions, parameters could have external paramter names but the default behavior 
//was that all parameter names were local and thus function calls did not need parameter names in them
//in the case with methods, the default behavior is different:
//the first parameter name is not external, in fact usually the function name somewhat incorporates a word that 
//would fit in as an external parameter name. The other parameters after the first one do require external parameter names

class Counter {
	var count = 0
	func increment() {
		count++
	}
	func incrementBy(amount: Int) {
		count += amount
	}
	func reset() {
		count = 0
	}
	func incrementBy(amount: Int, andPrint str: String) {
		count += amount
		println(str)
	}

	func incrementBy(#amount: Int, _ blah: String) {
		count += amount 
		println(blah)
	}
	//we can modify default behavior by giving the first paramter an external parameter name 
	//or by giving the external parameter name _ to any subsequent parameter if we wish to 
	//override external parameter naming function calling convention
}
//note that the expressive method defined above couldve been defined as 
//func incrementBy(amount: Int, str: String) in which str is both a local and externally named paramter 

var counter = Counter()
counter.incrementBy(6, andPrint: "Hey")
counter.incrementBy(amount: 10, "Hello")
//for the value types Structs and Enums, you can only change properties by placing the keyword mutating
//in front of the method definition. This allows you to change properties belonging to the instance of 
//the value type and to even change the instance itself by assigning to the self property
struct Point {
	var x = 0.0
	var y = 0.0
	mutating func moveToX(deltaX: Double, y deltaY: Double) {
		x += deltaX
		y += deltaY
	}

	mutating func changeInstance(newX: Double, andNewY y: Double) {
		self = Point(x: newX, y: y)
	}
}
var pointA = Point()
pointA.moveToX(12.5, y: 12.5)
pointA.changeInstance(15, andNewY: 17.8)
println("\(pointA.x) \(pointA.y)")
//for enums, which as you know dont have stored properties, we can change the self property to change 
//self to an instance of a different value defined in the enum
enum TriStateSwitch {
	case Off, Low, High 
	mutating func next() {
		switch self {
			case .Off:
				self = .Low
			case .Low:
				self = .High
			case .High: 
				self = .Off
		}
	}
}



// ***** Type Methods *****
//defined with keyword class for classes and static for structs and enums



