extends Node
## File should probably be called "CraftingSignals" or something to that effect

#class Crafting:
signal open_inventory()
signal add_ingredient(ingredient: IngredientDetails)
signal cook_potion()
signal take_potion()

signal enable_potion_details()
signal disable_potion_details()
