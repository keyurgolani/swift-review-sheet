//stored properties are constant/variable values as part of an instance, 
//computed properties are ... computed 
//class structs and enums all have computed properties; only classes and structs have stored proprties


// ***** Stored Properties *****
//obviously by now you know the difference between assigning to var and assigning to let; a var can be changed
//however, if you assign a struct instance to a let, any stored properties, variable or constant, cannot be changed 
//- a constant value type has ALL CONSTANT properties
//- you can still change a constant class instance's variable properties 
//lazy variables - must always be variables and not constants because lazy variables can be 
//initialized after the instance to which it belongs is initialized but constants must be initialized 
//before instance initialization is complete
	//main idea: lazy variables can be initialized after instance initialization

class A { 
	var name = "A"
	init() {
		println("A instance has been initialized")
	}
}
class B {
	lazy var a = A()
	var name = "B"
}

var b = B() 
b.name = "Jack"
println(b.name)
b.a.name = "Homey"
println(b.a.name)


// ***** Computed Properties *****
//dont actually store anything, just provide a getter and an optional setter
struct Point {
	var x =  0.0
	var y = 0.0
}

struct Size {
	var width = 0.0, height = 0.0
}

struct Rect {
	var origin = Point()
	var size = Size()
	var center: Point {
		get {
			let xCoor = origin.x + size.width / 2
			let yCoor = origin.y + size.height / 2
			return Point(x: xCoor, y: yCoor)
		}
		set(newCenter) { //couldve omitted newCenter and swift would automatically provide newValue as the name for the paramter
			origin.x = newCenter.x - size.width / 2
			origin.y = newCenter.y - size.height / 2
		}
	}
}

var myRect = Rect(origin: Point(x: 0, y: 0), size: Size(width: 10.0, height: 10.0))
println("\(myRect.center.x), \(myRect.center.y)")
myRect.center = Point(x: 20, y: 20)
println("\(myRect.origin.x), \(myRect.origin.y)")
//if you have a read only computed property, you dont need to include the get or its brackets. 
//itll just look like this:
//var center: Point { ... }
//and of course, you can only var computed properties because if they werent variable they wouldnt need to be computed



// ***** Property Observers *****
//observe and respond whenever a property is set - you can observe any stored property so long as it isnt lazy
//willSet & didSet
class Example {
	var number: Int = 0 {
		willSet {
			println("\(newValue) from \(number)")
		}
		didSet {
			if oldValue > number {
				number = oldValue + 1
				println("Had to veto")
			}
		}
	}
}
let ex = Example()
ex.number = 5
ex.number = 10
ex.number = 7
ex.number = 12


// ***** Global and Local Variables *****
//basically we can observe and compute stored variables - note the difference between variable and property



// ***** Type Properties *****
//variables universal to all instances
//value types: stored AND computed type properties
//class types: computed type properties only
//stored type properties need to be given a default value
//for structs, keyword is static that preceeds var/let
//for classes, preceeding keyword is class

struct SomeStruct { //can have both computed type properties and stored type properties but we're only showing stored
	static var someTypeProperty = "someValue"
}

println(SomeStruct.someTypeProperty)
SomeStruct.someTypeProperty = "yeoo"
println(SomeStruct.someTypeProperty)

class SomeClass { //can only have computed type properties
	class var whatsGood: Int {
		return 5 * 12
	}
}

println(SomeClass.whatsGood)

