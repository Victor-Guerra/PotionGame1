extends Control
class_name PotionIcon

@export_color_no_alpha var potion_color: Color

@onready var fg_icon: Sprite2D = $Foreground
@onready var bg_icon: Sprite2D = $Background

func populate_icons(potion_color: Color) -> void:
	self.bg_icon.modulate = potion_color
