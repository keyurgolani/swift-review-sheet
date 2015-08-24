class SomeManager { //supported bc on lazy initialization
	//if there wasnt lazy initialization, upon initialization this property would be set with an instance 
	//of SomeManager and thus that instance would also have a property named sharedInstance which would 
	//be initialization immediately and thus would cause a never ending loop of initializing SomeManger instances 

	//because of the static keyword, sharedInstance is a type property which means it is lazily initialized (initialized only when it is first needed)
	//so this means that the sharedInstance will be initialized with a SomeManager instance, and that instance will have a sharedInstance property as well 
	//but in theory that property should never be initialized (unless we try to access it in which case it will be 
		//lazily initialized)
	//the above is for newer versions of swift than the one im using evidently

	class var sharedInstance: SomeManager {
		struct Static {
			static let instance = SomeManager()
		}
		return Static.instance
	}

	var abe: Int?
	var babe: Int?
	init() {
		println("did init")
	}
}

var a = SomeManager()
var b = SomeManager.sharedInstance
b.abe = 5
b.babe = 75
let c = b
let d = SomeManager.sharedInstance
println("d's abe: \(d.abe!), d's babe: \(d.babe!)")