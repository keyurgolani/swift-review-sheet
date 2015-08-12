import Foundation

let notificationString = "SendPlay"

class GuitarPlayer {
	var name: String 

	init(name: String) {
		self.name = name 
	}

	func setObserver() {
		NSNotificationCenter.defaultCenter().addObserver(self, selector: "ply:", name: notificationString, object: nil)
	}

	func ply(notification: NSNotification) {
		println("\(name) is playing")
	}
}

class Orchestrator {

	func orchestrate() {
		NSNotificationCenter.defaultCenter().postNotificationName(notificationString, object: self)
	}
}

var jerry = GuitarPlayer(name: "Jerry")
var alex = GuitarPlayer(name: "Alex")
var mark = GuitarPlayer(name: "Mark")
var players = [jerry, alex, mark]
var myOrchestrator = Orchestrator()
for i in 0..<players.count {
	players[i].setObserver()
}
myOrchestrator.orchestrate()





