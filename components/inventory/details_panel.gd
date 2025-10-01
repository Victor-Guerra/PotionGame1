extends TextureRect
class_name UIIngredientDetailsPanel

@onready var name_label: RichTextLabel = $h1/v1/IngredientNameLabel
@onready var type_label: RichTextLabel = $h1/v1/Details/TypeLabel
@onready var rarity_label: RichTextLabel = $h1/v1/Details/RarityLabel
@onready var value_label: RichTextLabel = $h1/v1/Details/ValueLabel

@onready var effect1_label: RichTextLabel =  $h1/v1/Effects/Effect1
@onready var effect2_label: RichTextLabel =  $h1/v1/Effects/Effect2
@onready var effect3_label: RichTextLabel =  $h1/v1/Effects/Effect3

var shown_ingredient: IngredientDetails

## Maybe add some icons next to the effects?

func clear_panel() -> void:
	name_label.text = ""
	type_label.text = ""
	rarity_label.text = ""
	value_label.text = ""

	effect1_label.text = ""
	effect2_label.text = ""
	effect3_label.text = ""

func set_labels(ingredient: IngredientDetails):
	name_label.text = ingredient.ingredient_name
	type_label.text = Globals.ObjectTypes.get_ingredient_type_from_int(ingredient.ingredient_type)
	rarity_label.text = Globals.ObjectTypes.get_item_rarity_from_int(ingredient.rarity)
	value_label.text = str(ingredient.base_value) + "G"

	effect1_label.text = Globals.ObjectTypes.get_potion_effect_from_int(ingredient.effects[0])
	effect2_label.text = Globals.ObjectTypes.get_potion_effect_from_int(ingredient.effects[1])
	effect3_label.text = Globals.ObjectTypes.get_potion_effect_from_int(ingredient.effects[2])
