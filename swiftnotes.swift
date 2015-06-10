println("Hello world")

//creates a variable - CAN change 
var age = 21
println(age)
age = 22
println(age)
//creates a constant - CANT change
let numberOfFriends = 5
println(numberOfFriends)
//-----> WRONG ----> numberOfFriends = 6 <---- cant change constant

//Swift can infer type by value assigned to variable, but if theres not enough
//information we can always explicitly declare the type
let explicitlyDefinedDouble: Double = 70

//we can include nonStrings in strings with the following notation: \()
var apples = 3
var oranges = 5
println("Johnny has \(apples + oranges) fruit")


//Arrays
var cars = ["lambo", "merc", "rari", "bmw"]
cars.append("bently")
println(cars[4])
//Dictionaries
var occupations = ["Alex": "actuary", "Mark": "brokeboi", "Myself": "trep"]
println(occupations["Alex"]!)







