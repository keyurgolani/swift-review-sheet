class Cat {
	var furry = false
	func saySomething() {
		print(furry)
	}
}

var tiddles: AnyObject = Cat()
//tiddles.saySomething
(tiddles as! Cat).furry = true
(tiddles as! Cat).saySomething()