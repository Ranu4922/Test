extends Node
class_name BuildSystem

@export var game_state: GameState
var building_defs: Dictionary = {}

func load_building_defs(path: String) -> void:
	var file := FileAccess.open(path, FileAccess.READ)
	if file == null:
		push_error("Could not open building definitions: %s" % path)
		return
	var parsed = JSON.parse_string(file.get_as_text())
	if typeof(parsed) == TYPE_DICTIONARY:
		building_defs = parsed

func can_place(building_id: String, terrain_type: String) -> bool:
	if not building_defs.has(building_id):
		return false
	var allowed: Array = building_defs[building_id].get("allowed_terrain", [])
	return terrain_type in allowed

func place_building(building_id: String, terrain_type: String) -> bool:
	if not can_place(building_id, terrain_type):
		return false
	var cost: Dictionary = building_defs[building_id].get("cost", {})
	return game_state.spend(cost)
