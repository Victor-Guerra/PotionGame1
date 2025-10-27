extends State

@export var tutorial_screen: Control 

@export var main_state: State

func enter() -> void:
	# enable the tutorial screen
	tutorial_screen.visible = true
	pass
	
func exit() -> void:
	#disable the tutorial screen
	tutorial_screen.visible = false
	pass
	
func process_unhandled_input(event: InputEvent) -> State:
	#check if event is a mouse click, if so, get the next page/ close the tutorial screen
	if event.is_action_pressed("menu_enter"):
		get_viewport().set_input_as_handled()
		return main_state


	return null
