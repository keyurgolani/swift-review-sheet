import Foundation

//handling user input 
//var fh = NSFileHandle.fileHandleWithStandardInput()
//println("Whatis your name?")
//var idata = fh.availableData
//println( NSString(data: idata, encoding: NSUTF8StringEncoding)!  )


struct School {
	var numberOfTeachers: Int 
	var numberOfStudents: Int 
	var nameOfSchool: String
	/*init() {
		numberOfStudents = 2000
		numberOfTeachers = 245
		nameOfSchool = "McVey"
	}
	init(name: String, andNoStudents students:Int, andNoTeachers teachers:Int) {
		nameOfSchool = name
		numberOfTeachers = teachers 
		numberOfStudents = students
	}*/
}

let mySchool = School(numberOfTeachers: 20, numberOfStudents: 200, nameOfSchool: "McVey")
println(mySchool.nameOfSchool)

/*let mySchool = School()
println(mySchool.nameOfSchool)

let yourSchool = School(name: "Woodland", andNoStudents: 5000, andNoTeachers: 20)
println(yourSchool.nameOfSchool)*/


class School1 {
	var numberOfStudents = 100
	var numberOfTeachers = 20
	var nameOfSchool = "McVey"
	var teacher: String?
	//init () {}
}
var yourSchool = School1()
var yerSchool = yourSchool
yerSchool.nameOfSchool = "Candlewood"
println(yourSchool.nameOfSchool)

//couple different scenarios going on here:
//If we initialize all our instance variables upon declaring them, theres no need for a class initializer
//Any optional types do not need to be initialized since they just take on nil until they are set.
//Swift wont let program run if you have any instance variables that havent been initialized yet, either through init 
//or by giving it an initial value

//another thing: with structs, you can omit an init() and simply initialize it by calling
// TypeName(parameter1: value, parameter2: value, ...). You cannot do that with classes.