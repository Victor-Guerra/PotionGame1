extends Control
class_name Ingredient

@export var details: IngredientDetails

var sprite_texture_path: String

@onready var icon: TextureRect = $Icon

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(details.ingredient_name)
	icon.set_texture(details.sprite_texture)


func _init(details: IngredientDetails) -> void:
	self.details = details
	#preload()
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

static func _from_json(o: JSON) -> void: #Ingredient:
	## For parsing the Ingredients from a json file or smth
	#return Ingredient.new()
	pass
