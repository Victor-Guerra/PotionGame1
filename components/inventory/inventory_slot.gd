extends Panel
class_name InventorySlot

@onready var item_icon: TextureRect = $ItemIcon
@onready var qty_panel: Panel = $ItemIcon/QtyPanel
@onready var qty_label: RichTextLabel = $ItemIcon/QtyPanel/RTL
@onready var hand: Sprite2D = $Hand

var is_selected: bool = false
var stored_ingredient: IngredientDetails

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

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

func enable_hand() -> void:
	hand.visible = true

func disable_hand() -> void:
	hand.visible = false

func set_stored_ingredient(ingredient: IngredientDetails) -> void:
	stored_ingredient = ingredient

func get_stored_ingredient() -> IngredientDetails:
	return stored_ingredient

func clear_stored_ingredient() -> void:
	stored_ingredient = null

# ToDo: add an 'item count' label that updates qhen more than one of
# 	an item is in the inventory
