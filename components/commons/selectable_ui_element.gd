extends Control
class_name SelectableUIElement

@onready var hand: Sprite2D = $Hand

@export var content: Node

func enable_hand() -> void:
	hand.visible = true

func disable_hand() -> void:
	hand.visible = false
