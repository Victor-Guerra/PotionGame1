extends State
class_name PotionMakingStateDefault

## The UI node to which this state is associated with,
## so that it can control it directly
@export var ui_element: SelectableUIElement
@export var connected_states: Array[State]

@export_storage var held_ingredient: IngredientDetails

@onready var states_dict: Dictionary = {
	"left" = connected_states[0],
	"up" = connected_states[1],
	"right" = connected_states[2],
	"down" = connected_states[3],
}

func enter() -> void:
	ui_element.enable_hand()
	
func exit() -> void:
	ui_element.disable_hand()

func process_input(event: InputEvent) -> State:
	if event.is_action_pressed("menu_left"):
		return states_dict["left"]
	elif event.is_action_pressed("menu_down"):
		return states_dict["down"]
	elif event.is_action_pressed("menu_right"):
		return states_dict["right"]
	elif event.is_action_pressed("menu_up"):
		return states_dict["up"]
		
	return null

func process_unhandled_input(event: InputEvent) -> State:
	if event.is_action_pressed("menu_enter"):
		print(event.as_text())
		GlobalSignals.open_inventory.emit()
		get_viewport().set_input_as_handled()

	return null
