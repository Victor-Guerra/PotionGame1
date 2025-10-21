extends Panel
class_name InventorySlot

@onready var item_icon: TextureRect = $ItemIcon
@onready var qty_panel: Panel = $ItemIcon/QtyPanel
@onready var qty_label: RichTextLabel = $ItemIcon/QtyPanel/RTL

var is_selected: bool = false
var stored_item: Resource

func set_texture(new_texture: Texture) -> void:
	item_icon.texture = new_texture

func clear_texture() -> void: 
	item_icon.texture = null

func set_qty_text(text: String) -> void: 
	qty_label.text = text

func enable_qty_panel() -> void:
	qty_panel.visible = true

func disable_qty_panel() -> void:
	qty_panel.visible = false

func enable_icon() -> void: 
	item_icon.visible = true

func disable_icon() -> void:
	item_icon.visible = false

func set_stored_item(item: Resource) -> void:
	stored_item = item

func get_stored_item() -> Resource:
	return stored_item

func clear_stored_item() -> void:
	stored_item = null

# ToDo: add an 'item count' label that updates qhen more than one of
# 	an item is in the inventory
