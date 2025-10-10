extends State
class_name PauseState

@export_storage var connected_states: Array[State]

signal machine_paused

func enter() -> void:
	emit_signal("machine_paused")

