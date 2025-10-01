extends Resource
class_name IngredientDetails

@export var ingredient_name: String

@export var ingredient_type: Globals.ObjectTypes.IngredientType
@export var base_potency: float
@export var base_value: int
@export var base_stability: float
@export var effects: Array[Globals.ObjectTypes.PotionEffect]
@export var rarity: Globals.ObjectTypes.ItemRarity

@export var sprite_texture: Texture2D
