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
	GlobalSignals.cook_potion.connect(cook_a_potion)
	GlobalSignals.take_potion.connect(handle_take_potion)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func add_ingredient_to_cauldron(ingredient: IngredientDetails) -> void:
	inventory_panel.disable_sm()
	potion_making_panel.enable_selection_sm()

	potion_making_panel.add_ingredient_to_cauldron(ingredient)

func enable_inventory_panel() -> void:
	potion_making_panel.disable_selection_sm()
	inventory_panel.enable_sm()

func cook_a_potion() -> void:
	if not potion_making_panel.can_potion_be_created():	
		return
	else:
		var new_potion: PotionDetails = PotionDetails.new(
			potion_making_panel.cauldron_ingredients["Slot1"], # Hardcoded?
			potion_making_panel.cauldron_ingredients["Slot2"],
			potion_making_panel.cauldron_ingredients["Slot3"],
		)

		new_potion.pprint()

		_consume_ingredients_from_inventory()

		potion_making_panel.set_potion_slot_potion(new_potion)
		potion_making_panel.clear_slots()
		inventory_panel.clear_slots_info()
		inventory_panel.render_items()

func handle_take_potion() -> void:
	potion_making_panel.clear_potion_slot()

func _consume_ingredients_from_inventory() -> void:
	for slot in potion_making_panel.cauldron_ingredients.keys():
		inventory_panel.inventory_resource.remove_from_inventory(Ingredient.new(potion_making_panel.cauldron_ingredients[slot]))
