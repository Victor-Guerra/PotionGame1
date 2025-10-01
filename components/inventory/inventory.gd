extends Control
class_name UIInventoryPanel

var selected_slot: int = 0
var current_page: int = 1

const MAX_SLOTS: int = 24
const SLOTS_PER_PAGE: int = 8

@export var inventory_resource: Inventory
@export var state_machine: StateMachine

@onready var slots = get_node("tabs/Control/Panel/Bottom/Slots/RowA").get_children() + get_node("tabs/Control/Panel/Bottom/Slots/RowB").get_children() 
@onready var details_panel = $tabs/Control/Panel/DetailsPanel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	## Only debug:
	inventory_resource.load_debug_contents()
	inventory_resource.item_added.connect(render_items)
	inventory_resource.item_removed.connect(render_items)

	_connect_paging_buttons()
	render_items()
	state_machine.init(self)

func _connect_paging_buttons() -> void:
	var lbutton = $tabs/Control/Panel/Bottom/LButtonContainer/ButtonLeft
	var rbutton = $tabs/Control/Panel/Bottom/RButtonContainer/ButtonRight

	lbutton.pressed.connect(previous_page)
	rbutton.pressed.connect(next_page)

func render_items() -> void:
	var inv_contents: Array = inventory_resource.get_contents()


	for i in SLOTS_PER_PAGE:
		var inv_index = i + (SLOTS_PER_PAGE * (current_page - 1))

		if inv_index >= len(inv_contents):
			slots[i].disable_icon()
			continue

		slots[i].set_texture(inv_contents[inv_index].ingredient.details.sprite_texture) 
		slots[i].set_qty_text(str(inv_contents[inv_index].get_qty()))
		slots[i].set_stored_ingredient(inv_contents[inv_index].ingredient.details) ## 
		slots[i].enable_icon()
		slots[i].enable_qty_panel()

func next_page() -> void:
	current_page += 1
	if current_page > ceili(float(MAX_SLOTS) / float(SLOTS_PER_PAGE)):
		current_page = 1

	clear_slots_info()
	render_items()

func previous_page() -> void:
	current_page -= 1
	if current_page < 1 :
		current_page = ceili(float(MAX_SLOTS) / float(SLOTS_PER_PAGE))

	clear_slots_info()
	render_items()

func populate_details_panel(ingredient: IngredientDetails) -> void:
	details_panel.set_labels(ingredient)

func clear_details_panel() -> void:
	details_panel.clear_panel()

func clear_slots_info() -> void:
	for slot in slots:
		slot.clear_stored_ingredient()
