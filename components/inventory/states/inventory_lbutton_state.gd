extends State

@export var next_state: State

func enter() -> void:
	parent.previous_page()

func process_frame(delta: float) -> State:
	return next_state
