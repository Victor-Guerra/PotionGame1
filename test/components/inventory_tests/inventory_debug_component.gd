extends Control

@export var inventory_obj: Inventory
@export var avail_ingredients: IngredientList

@onready var label: Label = $Control/Display/Label

var idx: int = 0
var list_size: int
var selected_ingredient: IngredientDetails

func _ready() -> void:
	selected_ingredient = avail_ingredients.AvailableIngredients[idx]
	list_size = len(avail_ingredients.AvailableIngredients)

	update_label()

func increase_idx() -> void:
	idx = (idx + 1) % list_size

func decrease_idx() -> void:
	idx = (idx - 1) % list_size
	if idx < 0:
		idx = list_size + idx

func update_label() -> void: 
	label.text = avail_ingredients.AvailableIngredients[idx].ingredient_name

func toggle_debug_tooltip() -> void:
	visible = !visible

func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("debug_ui_left"):
		decrease_idx()
		update_label()
	elif event.is_action_pressed("debug_ui_right"):
		increase_idx()
		update_label()
	elif event.is_action_pressed("toggle_debug_info"):
		toggle_debug_tooltip()

	if event.is_action_pressed("inventory_debug_add_item"):
		inventory_obj.add_to_inventory(Ingredient.new(avail_ingredients.AvailableIngredients[idx]))
	if event.is_action_pressed("inventory_debug_sub_item"):
		inventory_obj.remove_from_inventory(Ingredient.new(avail_ingredients.AvailableIngredients[idx]))
