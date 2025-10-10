extends State
class_name PotionSlotState

@export_storage var held_ingredient: IngredientDetails

@export var connected_states: Array[State]
@export var ui_element: SelectableUIElement
@onready var states_dict: Dictionary = {
	"up" = connected_states[0],
	"take_potion" = connected_states[1]

}

signal take_potion(ingredient: IngredientDetails)

func enter() -> void:
	ui_element.enable_hand()
	
func exit() -> void:
	ui_element.disable_hand()

func process_input(event: InputEvent) -> State:
	if event.is_action_pressed("menu_up"):
		return states_dict["up"]
	elif event.is_action_pressed("menu_enter"):
		emit_signal("take_potion")
		
	return null

