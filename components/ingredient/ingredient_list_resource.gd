extends Resource
class_name IngredientList

@export var AvailableIngredients: Array[IngredientDetails]

@export_storage var IngredientDict: Dictionary[String, int]

func _init() -> void:
	#print("AAAAAAAAA")
	for ing in AvailableIngredients:
		print(ing.ingredient_name)
		IngredientDict[ing.ingredient_name] = AvailableIngredients.find(ing)

func get_ingredient(iname: String) -> IngredientDetails:
	print(IngredientDict)
	return AvailableIngredients[IngredientDict.get(iname)]
