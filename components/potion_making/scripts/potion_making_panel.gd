extends Control
class_name UIPotionMakingPanel

@export var selection_state_machine: StateMachine
@export var ingredient_state_machine: StateMachine

@export_storage var cauldron_ingredients: Dictionary[String, IngredientDetails] = {
	"Slot1" = null,
	"Slot2" = null,
	"Slot3" = null
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	selection_state_machine.init(self)
	#dingredient_state_machine.init(self)



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
		
