extends Control
class_name UIPotionMakingPanel

@export var selection_state_machine: StateMachine

@export_storage var cauldron_ingredients: Dictionary[String, IngredientDetails] = {
	"Slot1" = null,
	"Slot2" = null,
	"Slot3" = null
}

@export var potion_result_slot: InventorySlot
@export var potion_details_panel: UIPotionDetailsPanel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	selection_state_machine.init(self)

	GlobalSignals.enable_potion_details.connect(_enable_potion_details_panel)
	GlobalSignals.disable_potion_details.connect(_disable_potion_details_panel)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#func make_new_potion()
func enable_selection_sm() -> void:
	selection_state_machine.enable()

func disable_selection_sm() -> void:
	selection_state_machine.disable()

func add_ingredient_to_cauldron(ingredient: IngredientDetails) -> void:
	cauldron_ingredients[selection_state_machine.current_state.name] = ingredient
	render_slots()

func render_slots() -> void:
	for slot in cauldron_ingredients.keys():
		var ui_slot = get_node("SelectionStateMachine/" + slot).ui_element
		if cauldron_ingredients[slot]:
			ui_slot.content.set_texture(cauldron_ingredients[slot].sprite_texture)
			ui_slot.content.enable_icon()
		else:
			ui_slot.content.clear_texture()
			#ui_slot.content.clear_stored_item()

func clear_slots() -> void:
	for slot in cauldron_ingredients.keys():
		cauldron_ingredients[slot] = null

	render_slots()

func can_potion_be_created() -> bool:
	# An 'assume true' approach might be problematic, but it works for now
	for slot in cauldron_ingredients.keys():
		if cauldron_ingredients[slot]:
			continue
		else:
			return false

	return true

func render_potion_slot() -> void:
	pass

func clear_potion_slot() -> void:
	potion_result_slot.clear_stored_item()
	potion_result_slot.clear_texture()

func set_potion_slot_potion(potion: PotionDetails) -> void:
	potion_result_slot.set_stored_item(potion)
	potion_result_slot.set_texture(Globals.DefaultPotionTexture)

func _enable_potion_details_panel() -> void:
	if potion_result_slot.stored_item:
		potion_details_panel.enable(potion_result_slot.stored_item)
	
func _disable_potion_details_panel() -> void:
	potion_details_panel.disable()
