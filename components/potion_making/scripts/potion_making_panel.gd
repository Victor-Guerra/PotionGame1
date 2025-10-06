extends Control
class_name UIPotionMakingPanel

@export var state_machine: StateMachine


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	state_machine.init(self)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
