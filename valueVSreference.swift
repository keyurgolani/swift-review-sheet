struct Animal {
	var name: String
	var legs: Int 
} 

class Animals {
	var name: String
	var legs: Int 
	init(name: String, andLegs legs: Int) {
		self.name = name
		self.legs = legs
	}
}

func changeProperty(var animal: Animal) {   //you'll notice that since struct is a value type,
	animal.legs = 5  				//1) it is copied  2) its copy is a constant
}

func changeProperty(animal: Animals) { //since Animals is a reference type since its a class,
    animal.legs = 5					//1) it's referenced within the function   2) you can change 
}									//it's properties and stuff because youre dealing with a reference not a copy

var structAnimal = Animal(name: "Lion", legs: 4)
var classAnimal = Animals(name: "Lion", andLegs: 4)
changeProperty(structAnimal)
changeProperty(classAnimal)

println(structAnimal.legs)
println(classAnimal.legs)

//structs, enums, tuples are all value types:
//value types have their own unique copy of data
//reference types share a single copy of their data - if another instance is assigned that reference
struct A { var data = -1 }
//we've defined a struct, which is a value type
var a = A() //initialize a, an instance of A
var b = a //initialize b with a copy of a, copying all of a's data but NOT sharing it
a.data = 47 //since a and b have their own copies, changing a's data does not affect b's data at all
println("\(a.data), \(b.data)") //as proven by this sanity check 

class C { var data = -1 } //a reference type.
var c = C() //initialize C, store in c
var d = c  //create variable d, give it reference to c, so they share data
d.data = 92 //changing d's shared data is changing c's shared data, so both c and d refer to the same one thing that is being changed
println("\(c.data), \(d.data)") //proven by our sanity check

//this becomes relevant because it's safer to use value types since you can rest assured 
//no values are going to be changed under the hood 
//but remember, only classes allow inheritance, and inheriting from NSObject is useful and provides alot of
//functionality, so this leads to a complication
//Array, String, Dictionary are value types
var dict = ["Jerry" : 5, "Mark" : 4, "Alex" : 14]
func changeDict(var dic: [String : Int]) {
	for (k, v) in dic {
		dic[k] = 7
		println(dic[k])
	}
}
for (k, v) in dict {
	println(v)
}
//our dictionary type was copied in changeDict() as predicted.
var dic1 = dict
dict["Jerry"] = 100
var jer = "Jerry"
println("\(dict[jer]!), \(dic1[jer]!)")
//now what if we do something like this: assign the value of a dictionary to a function that returns an altered dictionary?
func changeAndReturnDict(var dic: [String : Int]) -> [String : Int] {
	for (k, v) in dic {
		dic[k] = 7
	}
	return dic
}
dict = changeAndReturnDict(dict)
for (k, v) in dict {
	println(v)
}



