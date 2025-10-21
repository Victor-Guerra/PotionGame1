extends Resource
class_name Inventory
## Will behave similar to a DB, where we will query this resource to fill up the 
## inventory UIs

## ToDo: Connect the fe with the resource

var max_size: int = 24
var inventory_content: Array[InventoryItem]

signal item_added
signal item_removed

func load_from_file(path: String) -> void:
	pass

func load_debug_contents() -> void: 

	self.inventory_content = [
		InventoryItem.new(Ingredient.new(load("res://resources/ingredient_types/example_shroom1.tres"))),
		InventoryItem.new(Ingredient.new(load("res://resources/ingredient_types/example_shroom2.tres"))),
		InventoryItem.new(Ingredient.new(load("res://resources/ingredient_types/salammoniac.tres"))),
		#Ingredient.new("ex_shroom2", effects2, "res://assets/sprites/shroom2.png"),
	]

func get_contents() -> Array[InventoryItem]:
	return self.inventory_content

func add_to_inventory(item: Ingredient) -> void: 
	### Possible issue: creating the InventoryItem here instead of simply receiving and appending?
	for invi in self.inventory_content:
		if invi.ingredient.details.ingredient_name == item.details.ingredient_name:
			invi.add_one()
			emit_signal("item_added")
			return
		
	inventory_content.append(InventoryItem.new(item))
	# 1. Go through current contents to see if the ingredient is already present
	# 2. If not, add to 'inventory_content' array
	# 	 If yes, add 1 to its qty
	emit_signal("item_added")

func remove_from_inventory(item: Ingredient) -> void:
	#print(self.inventory_content)
	for invi in self.inventory_content:
		if invi.ingredient.details.ingredient_name == item.details.ingredient_name:
			invi.sub_one()

			if invi.qty < 1:
				self.inventory_content.erase(invi)
				#print(self.inventory_content)

			emit_signal("item_removed")
			return

	emit_signal("item_removed")
		
