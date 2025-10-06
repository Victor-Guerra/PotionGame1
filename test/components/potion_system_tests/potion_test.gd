extends Node2D
class_name TestPotionSystem

@export var ingredient_list: IngredientList


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(ingredient_list.IngredientDict)
	var new_potion = PotionDetails.new(ingredient_list.get_ingredient("White Vitriol"), 
									   ingredient_list.get_ingredient("Blue Vitriol"),
									   ingredient_list.get_ingredient("Red Vitriol"))
	print("***********")
	print("pot:" + str(new_potion.potency))
	print("str:" + str(new_potion.strength))
	print("sta:" + str(new_potion.stability))
	print("val:" + str(new_potion.value))
	print("^^effects:")
	for pe in new_potion.effects:
		print(Globals.ObjectTypes.PotionEffect.find_key(pe))
	print("^^hidden effects:")
	for pe in new_potion.hidden_effects:
		print(Globals.ObjectTypes.PotionEffect.find_key(pe))
	print("***********")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
