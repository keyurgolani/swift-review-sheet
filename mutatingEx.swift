protocol Colorable {
	var color: String { get set }
	mutating func changeColor(newColor: String)
}

struct Rect: Colorable {
	var width: Int
	var height: Int 
	var color: String

	mutating func changeColor(newColor: String) {
		color = newColor
	}

	mutating func changeWidth(newWidth: Int) {
		width = newWidth
	}

	func getArea() -> Int {
		return width * height
	}
}

var rect = Rect(width: 10, height: 5, color: "Red")
rect.changeWidth(7)
println(rect.getArea())

var somethingToColor: Colorable = rect
somethingToColor.color = "Green"
println(somethingToColor.color)
var aRectInstance: Rect = somethingToColor as Rect
println(aRectInstance.color)

