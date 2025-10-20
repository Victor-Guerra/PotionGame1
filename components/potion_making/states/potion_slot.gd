extends State
class_name PotionSlotState

@export var connected_states: Array[State]
@export var ui_element: SelectableUIElement

@onready var states_dict: Dictionary = {
	"up" = connected_states[0],
	"take_potion" = connected_states[1]

}

func enter() -> void:
	ui_element.enable_hand()
	GlobalSignals.enable_potion_details.emit()
	
func exit() -> void:
	ui_element.disable_hand()
	GlobalSignals.disable_potion_details.emit()

func process_input(event: InputEvent) -> State:
	if event.is_action_pressed("menu_up"):
		return states_dict["up"]
	elif event.is_action_pressed("menu_enter"):
		#emit_signal("take_potion")
		GlobalSignals.take_potion.emit()
		
	return null
