extends Resource
class_name PotionDetails

@export var potion_name: String

@export var potency: float
@export var strength: float
@export var stability: float
@export var value: int

@export var potion_color: Color

@export var effects: Array[Globals.ObjectTypes.PotionEffect]
@export var hidden_effects: Array[Globals.ObjectTypes.PotionEffect]

const e: float = 2.7182

func _init(ing1: IngredientDetails = Globals.DefaultIngredient,
		   ing2: IngredientDetails = Globals.DefaultIngredient, 
		   ing3: IngredientDetails = Globals.DefaultIngredient):
	create_potion(ing1, ing2, ing3)
	derive_effects(ing1, ing2, ing3)
	generate_name()
	generate_potion_color()

func create_potion(ing1: IngredientDetails, 
				   ing2: IngredientDetails, 
				   ing3: IngredientDetails) -> void:
	strength = calculate_strength(ing1.rarity, 
								  ing2.rarity, 
								  ing3.rarity)
	potency = calculate_potency(strength, 
								ing1.base_potency, 
								ing2.base_potency, 
								ing3.base_potency)
	stability = calculate_stability(ing1.base_stability, 
									ing2.base_stability, 
									ing3.base_stability)

	value = calculate_value(ing1, ing2, ing3, stability)




func calculate_strength(r1: Globals.ObjectTypes.ItemRarity, 
						r2: Globals.ObjectTypes.ItemRarity, 
						r3: Globals.ObjectTypes.ItemRarity) -> float:
	var combined_rarity: float = float(r1+r2+r3)
	return (combined_rarity/15) + 0.2

func calculate_potency(s: float, 
					   p1: float, 
					   p2: float, 
					   p3: float) -> float:
	var PIpn: float = (p1*p2*p3)

	return (pow(e, PIpn))/(1 + PIpn - (s*PIpn))

func calculate_stability(s1: float, 
						 s2: float, 
						 s3: float) -> float:
	var s = [s1, s2, s3]
	var avg: float = (s1+s2+s3)/3
	var sum: float = 0

	for i in range(0,3):
		sum += pow((s[i]-avg), 2)

	return 101.0 - pow(100.0, sqrt(sum / len(s)))

func calculate_value(ing1: IngredientDetails, 
					 ing2: IngredientDetails, 
					 ing3: IngredientDetails, st: float) -> int:
	var svi: int = ing1.base_value + ing2.base_value + ing3.base_value
	#var cra: int = ing1.rarity + ing2.rarity + ing3.rarity
	var epi: float = pow(e, ing1.base_potency*ing2.base_potency*ing3.base_potency)

	return floori(svi*((strength*st*epi)/100))

func derive_effects(ing1: IngredientDetails,
					ing2: IngredientDetails,
					ing3: IngredientDetails) -> void:
	effects = intersect_arrays(ing1.effects, ing2.effects, ing3.effects)
	hidden_effects = substract_arrays([effects, merge_arrays([ing1.effects, ing2.effects, ing3.effects])])


func intersect_arrays(a1: Array, a2: Array, a3: Array) -> Array[Globals.ObjectTypes.PotionEffect]:
	## Honestly not a good impl, but it works for now
	var tempa: Array[Globals.ObjectTypes.PotionEffect] = []

	for i in range(0, len(a1)):
		if a2.has(a1[i]) or a3.has(a1[i]):
			if not tempa.has(a1[i]):
				tempa.append(a1[i])

	for i in range(0, len(a2)):
		if a1.has(a2[i]) or a3.has(a2[i]):
			if not tempa.has(a2[i]):
				tempa.append(a2[i])

	for i in range(0, len(a3)):
		if a1.has(a3[i]) or a2.has(a3[i]):
			if not tempa.has(a3[i]):
				tempa.append(a3[i])

	return tempa

func merge_arrays(arrs: Array[Array]) -> Array[Globals.ObjectTypes.PotionEffect]:
	var tempa: Array[Globals.ObjectTypes.PotionEffect] = []

	for a in arrs:
		for i in range(0, len(a)):
			if not tempa.has(a[i]):
				tempa.append(a[i])

	return tempa

func substract_arrays(arrs: Array[Array]) -> Array[Globals.ObjectTypes.PotionEffect]:
	var result: Array[Globals.ObjectTypes.PotionEffect] = []
	var repeated: Array[Globals.ObjectTypes.PotionEffect] = []
	for a in arrs:
		for i in a:
			if not result.has(i) and not repeated.has(i):
				result.append(i)
			elif result.has(i) and not repeated.has(i):
				result.erase(i) 
				repeated.append(i)
	
	return result

func generate_name() -> void:
	var new_name: PackedStringArray = []

	# Add the strength to the name
	if strength <= 0.2:
		new_name.append("Weak")
	elif strength <= 0.4:
		new_name.append("Regular")
	elif strength <= 0.6:
		new_name.append("Strong")
	elif strength <= 0.8:
		new_name.append("Impressive")
	else: 
		new_name.append("Mythical")

	# Add a word for potion
	var words = ["Potion", "Brew", "Tincture", "Mixture", "Infusion", "Draught", "Elixir"]
	new_name.append(words.pick_random())
	new_name.append("of")

	# Add one of the effects to the title
	new_name.append(Globals.ObjectTypes.PotionEffect.find_key(effects[0]))

	potion_name = " ".join(new_name)

func generate_potion_color() -> void:
	potion_color = Color.from_hsv(randf(), randf(), randf(), 1.0)

func pprint() -> void:
	print("***********")
	print("pot:" + str(potency))
	print("str:" + str(strength))
	print("sta:" + str(stability))
	print("val:" + str(value))
	print("^^effects:")
	for pe in effects:
		print(Globals.ObjectTypes.PotionEffect.find_key(pe))
	print("^^hidden effects:")
	for pe in hidden_effects:
		print(Globals.ObjectTypes.PotionEffect.find_key(pe))
	print("***********")
