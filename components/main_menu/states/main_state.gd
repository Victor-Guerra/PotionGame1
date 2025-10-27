extends State

@export var tutorial_state: State
@export var tutorial_button: Button

func enter() -> void:
	tutorial_button.disabled = false
	pass
	
func exit() -> void:
	pass
	
