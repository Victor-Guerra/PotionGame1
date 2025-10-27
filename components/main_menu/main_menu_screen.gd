extends Control

@onready var start_button: Button = $"./v1/h1/MenuOptions/SBBG/StartButton"
@onready var tutorial_button: Button = $"./v1/h1/MenuOptions/TBBG/TutorialButton"
@onready var quit_button: Button = $"./v1/h1/MenuOptions/QBBG/QuitButton"

@onready var tutorial_screen: Control = $TutorialScreen

@export var sm: StateMachine 
@export var tutorial_state: State

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	quit_button.pressed.connect(_quit_game)
	start_button.pressed.connect(_start_game)
	tutorial_button.pressed.connect(_toggle_tutorial)
	
	sm.init(self)

func _quit_game() -> void:
	get_tree().quit()

func _start_game() -> void:
	get_tree().change_scene_to_file("res://components/main_screen/main_crafting_screen.tscn")

func _toggle_tutorial() -> void:
	get_viewport().set_input_as_handled()
	sm.change_state(tutorial_state)
	tutorial_button.disabled = true
