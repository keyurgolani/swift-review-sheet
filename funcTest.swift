class Vehicle {
	var numberOfWheels: Int?
	var color: String?
	var doors: Int?

	init(numberOfWheels wheels: Int, andColor color: String) {
		//ahhhh okay, we dont need to unwrap yet I'm guessing because
		//the values havent been set, therefore we give it a value. 
		//My hypothesis is that if we, in a later function, change the values, 
		//we still wont have to unwrap the values?
		numberOfWheels = wheels
		self.color = color
		doors = 0
	}
	init(numberOfWheels wheels: Int, andColor color:String, andDoors doors:Int) {
		numberOfWheels = wheels
		self.color = color
		self.doors = doors
	}

	func printInfo() {
		println("This vehicle has \(numberOfWheels!) wheels and is \(color!) and has \(doors!) doors")
	}

	func changeProperties(numWheels: Int, color: String, doors: Int) {
		numberOfWheels = numWheels
		self.color = color
		self.doors = doors
	}
}



var toyota = Vehicle(numberOfWheels: 0, andColor: "Red", andDoors: 3)
var numberOfDoors: Int? = 4
toyota.changeProperties(1, color: "Blue", doors: numberOfDoors!)
toyota.printInfo()




//OKAY SO HERES WHATS GOING ON:
//when you call initializers, you actually have to list out all the parts of the function (i.e. numberOfWheels:andColor)
//when you call a function, you have to list out the parameter names for all parameters except the first

//Optionals review:
//If you have var varName: someType?, 
//you can always assign it a value of someType normally
//you are forced to unwrap only when you are accessing the value,
//so if i wanted to assigned to varName    var otherVar: someType?, i couldnt do 
//varName = someType  <-- because then I'd be assigning an optional. We always want either
//a someType value or nil. So we'd unwrap otherVar. 
//additionally, check our printInfo() - we want to print whats within the optionals 
//so we unwrap it - to access the value 

