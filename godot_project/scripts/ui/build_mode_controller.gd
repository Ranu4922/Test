extends Node
class_name BuildModeController

signal build_mode_changed(enabled: bool)

var is_build_mode := false

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("toggle_build_mode"):
		is_build_mode = !is_build_mode
		build_mode_changed.emit(is_build_mode)
