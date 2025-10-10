extends Control
class_name MainScreenManager

@export var inventory_panel: UIInventoryPanel
@export var potion_making_panel: UIPotionMakingPanel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	inventory_panel.disable_sm()
	potion_making_panel.enable_selection_sm()

	GlobalSignals.add_ingredient.connect(add_ingredient_to_cauldron)
	GlobalSignals.open_inventory.connect(enable_inventory_panel)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func add_ingredient_to_cauldron(ingredient: IngredientDetails) -> void:
	print("add_ingredient")
	inventory_panel.disable_sm()
	potion_making_panel.enable_selection_sm()

	potion_making_panel.add_ingredient_to_cauldron(ingredient)

func enable_inventory_panel() -> void:
	print("open_inventory")
	potion_making_panel.disable_selection_sm()
	inventory_panel.enable_sm()

func selected_an_ingredient_from_inv(ingredient: IngredientDetails) -> void:
	pass
