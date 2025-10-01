extends State

@export var next_state: State

func enter() -> void:
	parent.next_page()

func process_frame(delta: float) -> State:
	return next_state
