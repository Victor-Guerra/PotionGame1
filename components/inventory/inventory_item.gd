extends Node
class_name InventoryItem

var ingredient: Ingredient
var qty: int = 1

func add_one() -> void:
    self.qty += 1

func sub_one() -> void:
    self.qty -= 1

func get_qty() -> int:
    return self.qty

func get_ingredient() -> Ingredient:
    return self.ingredient

func _init(new_ingredient: Ingredient) -> void:
    self.ingredient = new_ingredient

