extends State
class_name PotionMakingCookButtonState

## The UI node to which this state is associated with,
## so that it can control it directly
@export var ui_element: Control
@export var connected_states: Array[State]

@onready var states_dict: Dictionary = {
	"down" = connected_states[0]
}

signal cook_potion

func enter() -> void:
	ui_element.enable_hand()
	
func exit() -> void:
	ui_element.disable_hand()

func process_input(event: InputEvent) -> State:
	if event.is_action_pressed("menu_down"):
		return states_dict["down"]
	elif event.is_action_pressed("menu_enter"):
		emit_signal("cook_potion")
		
	return null
