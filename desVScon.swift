import Foundation

class Message {
	var sender: String 
	var recipient: String 
	var timeStamp: NSDate

	init(sender: String, recipient: String) {
		self.sender = sender
		self.recipient = recipient

		timeStamp = NSDate()
	}
}

var mess = Message(sender: "Jerry", recipient: "Mark")


//convenience/designated init rules:

//1. Designated inits must call a designated init of its direct superclass
//2. convenience init must call another init from its class 
//3. convenience init must ultimately call designated init 

//so if we have a convenience init that called a convenience init that called a designated init, and if our class had a super class, 
//then the designated init ultimately called would also have to call a designated init from its super class 

//Also note that a subclass must set ALL of its properties BEFORE it calls its superclasses' init 


//convenience inits are prefixed with convenience before the keyword init 