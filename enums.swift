var fact: Bool
fact = 11 < 3

switch fact {
	case 4 > 3:
		println("Yooo")
	case 2 == 20:
		println("Hah")
	default:
		println("Shouldnt")
}

enum FamilyMember {
	case Mother(String, Int), Father(String, Int), Uncle(String, Int), Aunt(String, Int), Brother(String, Int), Sister(String, Int), Cousin(String, Int)
}

var adam = FamilyMember.Father("Harry", 59)
var eve = FamilyMember.Mother("Nyeh Squidward", 60)
switch eve {
	case .Father(var name, _):
		println(name)
	default:
		println("not father")
}