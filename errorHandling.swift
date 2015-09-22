//you can throw, catch, propogate, or manipulate errors 
//when an operation fails, its useful to figure out what caused the error 
//ex. reading data from file on disk
//ways it could fail:   1) file doesnt exist at specified path  2) file doesnt have read permission  
//3) file not encoded in a compatible format 


// ***** Representing and Throwing Errors *****
//ErrorType protocol - indicates that an implementing type can be used for error handling 
//so errors are represented by values that conform to the ErrorType protocol 
//enums are useful for modelling a group of related errors: ex)

enum VendingMachineError: ErrorType {
	case InvalidSelection
	case InsufficientFunds(coinsNeeded: Int)
	case OutOfStock
}
//throwing error means something unexpected happen and normal execution cant continue
//use throw statement to throw an error as such:
//throw VendingMachineError.InsufficientFunds(coinsNeeded: 5)



// ***** Handling Errors *****
//when an error is thrown, surrounding code must be responsible for handling the error 
//4 ways to handle error: 
//1) propogate the error from function to code that calls the function
//2) assert that error will not occur
//3) handle error with do-catch statement 
//4) handle error as an optional value

//use try (or try? or try!) before a piece of code that calls a function that can throw an error

//Method 1. Propogating Errors using throwing functions

struct Item {
    var price: Int
    var count: Int
}
 
class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0
    func dispenseSnack(snack: String) {
        print("Dispensing \(snack)")
    }
    
    //this function can throw an error of the enum type we defined above.
    func vend(itemNamed name: String) throws {
        guard var item = inventory[name] else {
            throw VendingMachineError.InvalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.OutOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.InsufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        --item.count
        inventory[name] = item
        dispenseSnack(name)
    }
}

//to call the func vend:itemNamed which throws an error, we must call after the keyword try
//try vendingMachine.vend(itemNamed: snackName) -> this will propogate an error if one is thrown

//Method 2: Handling Errors Using do-catch
/*do {
    try expression
    statements
} catch pattern 1 {
    statements
} catch pattern 2 where condition {
    statements
}*/
//general formal of a do-catch sequence, in which the do block of code
//is where one would call a function that may throw an error, and if one is thrown 
//the catch statements are used to match against specific error throws to handle the error
//SO: if error is thrown by a try funcCall, execution immediately transfers to 
//catch block to handle the error
//if no error is thrown, remaining statements are executed in the do block


//Method 3: Converting Errors to Optionals
//use try? before a throwing function to return a nil 
//ex) func someThrowingFunction() throws -> Int { ... }
//let x = try? someThrowingFunction() //if an error is thrown, x is assigned nil to express that error was thrown

//let y: Int?
//do {
	//y = try someThrowingFunction() error thrown sends execution to catch, which will set y to nil
//} catch {
	//y = nil
//}

// Method 4: Disable Error Propagation 
//if we know FOR SURE that no error will be thrown, we can use try! to call an error throwing function 


// ***** Specifying Cleanup Action *****
//defer keyword used before sequence of statements that must be executed just before 
//execution leaves the current block 
//defer blocks defer execution of statements until the current scope is exited 
//ex) 
/*func processFile(filename: String) throws {
	if exists(filename) {
		let file = open(filename)
		defer {
			close(file)
		}
		while let line = try file.readline() {
			//
		}
		//close is called here cause were at the end of scope 	
	}
}*/








