//to check the type of an instance or to treat an instance as if it were a different superclass or subclass from
//somewhere in its class hierarchy

// ***** Defining a Class Hierarchy for Type Casting *****
class MediaItem {
	var name: String
	init(name: String) {
		self.name = name
	}
}

class Movie: MediaItem {
	var director: String 
	init(name: String, director: String) {
		self.director = director
		super.init(name: name)
	}
}

class Song: MediaItem {
	var artist: String
	init(name: String, artist: String) {
		self.artist = artist
		super.init(name: name)
	}
}

let song = Song(name: "Song", artist: "me")
let mi = song as MediaItem
if mi is Song {
	print("mi is song") //prints 
}
if mi is MediaItem {
	print("mi is media item") //prints also
}

let library = [
    Movie(name: "Casablanca", director: "Michael curtiz"),
    Song(name: "Blue suede shoes", artist: "elvis presley"),
    Movie(name: "Citize kane", director: "orson welles"),
    Song(name: "The one and only", artist: "shesney hawkes"),
    Song(name: "never gonna give you up", artist: "rick astley")
]

//items stored in library are still Song and Movie instances but swift is smart enough to know that they all have a common superclass: MediaItem, 
//so library is itself of type [MediaItem]

for item in library {
	print(item.name)
}
//this works because all the elements of library are treated as MediaItem instances because we havent 
// type casted yet. 


// ***** Checking Type *****
//the type check operator: is - returns true if instance is of the subclass type we're checking for
//returns false if it isnt
var movieCount = 0
var songCount = 0
for item in library {
	if item is Movie {
		++movieCount
	} else if item is Song {
		++songCount
	}
}
print("\(movieCount) \(songCount)")
//however, note that is is the type check operator, not a caster. We wont be able to treat each item like
//a movie or song instance in that block of code because we havent cast it to another type, we've only check if one of its underlying 
//types is either movie or song.


// ***** Downcasting *****
//we can downcast to a subclass type with the type cast operator (as)
//1. optional form: as? returns optional value of the type we're trying to downcast to 
//2. forced form: as forces the downcast and unwraps the result in a single action

//needless to say, use as? when you arent sure if downcast will succeed
for item in library {
    if let movie = item as? Movie {
        print(movie.director)
    }
    else if let song = item as? Song {
        print(song.artist)
    }
}
//heres why this works:
	//we iterate through each element in the array library, and assign it to item in each iteration
	//we return a Movie? instance and store it in movie. movie is nil if item wasnt a Movie instance, and thus the code following if doesnt run 
	//movie is a Movie instance if item was a Movie Instance, and thus movie can be treated like one in the code that follows without having to unwrap it (optional binding)
	//important note that you may have not been able to articulate before learning this: casting doesnt change the instance, 
	//it simply changes how an instance is treated and accessed.
let moviesInTheater: [Movie] = [
Movie(name: "Spike", director: "Lee"), 
Movie(name: "Air Bud", director: "robert e lee")]
for mov in moviesInTheater {
	print((mov as MediaItem).name)
}
 

// ***** Type Casting for Any and AnyObject *****
//1. AnyObject can represent instances of any class type
//2. Any can represent instances of any type at all, including structs and functions

let movies: [AnyObject] = [Movie(name: "Gremlins", director: "Jim Carrey"),
							Movie(name: "Dark night", director: "m n shammy"),
							Movie(name: "peanutes", director: "jukes")]

for movie in movies as! [Movie] {
	print("\(movie.director) directed \(movie.name)")
}


var things = [Any]()
things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append(Movie(name: "Ghost busters", director: "Ivan"))
things.append( { (name: String) -> String in "Hello, \(name)" } )

for thing in things {
	switch thing {
		case 0 as Int: print("zero as an int")
		case 0 as Double: print("zero as a double")
		case let someInt as Int: print("an integer value of \(someInt)")
		case let someDouble as Double where someDouble > 0: 
			print("a positive double value of \(someDouble)")
		case is Double: print("some other double value that i dont want to print")
		case let someString as String: print("a string value of \(someString)")
		case let (x, y) as (Double, Double): print("x y point")
		case let movie as Movie: print("a movie called \(movie.name)")
		case let stringConverter as String -> String: print(stringConverter("Michale"))
		default: break
		}
}




