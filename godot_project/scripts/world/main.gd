extends Node3D

@onready var game_state: GameState = $GameState
@onready var build_system: BuildSystem = $BuildSystem

func _ready() -> void:
	build_system.game_state = game_state
	build_system.load_building_defs("res://data/buildings/buildings.json")
	print("Prototype ready. Startressourcen: %s" % game_state.resources)
