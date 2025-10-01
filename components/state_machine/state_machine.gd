extends Node
class_name StateMachine

@export var starting_state: State
var current_state:  State

func _process(delta: float) -> void:
	process_frame(delta)

func _physics_process(delta: float) -> void:
	process_physics(delta)
	
func _input(event: InputEvent) -> void:
	process_input(event)

func init(parent: Node) -> void:
	for child in get_children():
		child.parent = parent

	#Initialize default
	change_state(starting_state)

func change_state(new_state: State) -> void:
	if current_state:
		current_state.exit()
		
	current_state = new_state
	current_state.enter()

## For each possible way the node is processed we need to check whether it changes state
func process_physics(delta: float) -> void:
	var new_state = current_state.process_physics(delta)
	if new_state:
		change_state(new_state)

func process_input(event: InputEvent) -> void:
	var new_state = current_state.process_input(event)
	if new_state:
		change_state(new_state)

func process_frame(delta: float) -> void:
	var new_state = current_state.process_frame(delta)
	if new_state:
		change_state(new_state)
