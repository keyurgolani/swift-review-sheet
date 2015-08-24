import Foundation

var token: dispatch_once_t = 1

func test(num: Int) {
	dispatch_once(&token) {
		println("This is printed on the first call to test")
	}
	println("this is printing for call \(num)")
}

for i in 0..<4 {
	test(i)
}