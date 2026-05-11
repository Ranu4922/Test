extends Node
class_name GameState

var resources := {
	"wood": 30,
	"food": 20,
	"stone": 10
}

func can_afford(cost: Dictionary) -> bool:
	for key in cost.keys():
		if resources.get(key, 0) < int(cost[key]):
			return false
	return true

func spend(cost: Dictionary) -> bool:
	if not can_afford(cost):
		return false
	for key in cost.keys():
		resources[key] -= int(cost[key])
	return true
