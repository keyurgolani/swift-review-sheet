//used by Swift to automatically manage memory usage
//frees up memory used by class instances when those instances are no longer needed 
//ARC only applies to instances of classes because they are reference types

class A {
	init() {
		println("initialized A")
	}
	deinit {
		println("deinited A")
	}
}
var a: A? = A()
a = nil


// ***** How ARC Works *****
//tracks how many properties/constants/variables refer to a given instance
//ARC automatically deallocates or frees up memory used by an instance when there are no longer any 
//strong references to that instance 


// ***** ARC in Action *****
class Person {
	let name: String 
	init(name: String) {
		self.name = name 
		println("\(name) is being initialized")
	}
	deinit {
		println("\(name) is being deinitialized")
	}
}

var ref1: Person?
var ref2: Person?
var ref3: Person?

ref1 = Person(name: "John") //creates 1 strong reference to this instance
ref2 = ref1 //second reference to that instance 
ref3 = ref1 //third reference to that instance 
//now after we set all THREE to nil, arc deallocates the reference 
ref1 = nil
println("a")
ref2 = nil
println("b")
ref3 = nil 
println("c")
//we're expecting to print "abnameisbeingdeinitializedc" because after ref3 is set to nil there are
//officially 0 strong references to that instance and thus arc knows to deallocate it 