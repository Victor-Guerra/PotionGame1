extends Node

var DefaultIngredient: IngredientDetails = preload("res://resources/ingredient_types/default_ingredient.tres")

class ObjectTypes: ## Name subject to change
	enum IngredientType {
		MUSHROOM = 0,
		HERB,
		ROOT,
		MINERAL,
		METAL,
		LIQUID
	}

	static func get_ingredient_type_from_int(type: IngredientType) -> String:
		return IngredientType.keys()[type]

	enum PotionEffect {
		## HealthAndAttributes
		AlleviatePain = 0,
		ProvokePain,
		Poison,
		FortifyStrength,
		Weaken,
		FortifyIntelligence,
		Endumben,

		## FunctionAcceleration
		HealWounds,
		ProvokeSleep,
		SatiateHunger,
		ProvokeHunger,
		RestoreStamina,
		DamageStamina,
		Paralyze,
		HealParalysis,
		Blindness,
		CureDiseaseI, # Basically something like Antibiotics, Antivirals, and Antifungals
		CureDiseaseII, # Curing of Vitamin and Mineral deficiencies
		CureDiseaseIII, # Names subject to change though
		AntidoteBase, ## Can be combined with another ingredient to create a specific antidote

		## ExtranaturalFunctions
		Glow,
		StoneSkin,
		ShiftingSkin, # Camouflage
		WebbedAppendages, # For faster swimming n shi
		WaterBreathing,
		HeatDetection,
		Regeneration,
		Growth,
		Shrinking,
		TransformationBase, ## Can be combined with another ingredient to specify the target transformation
		
		## ExternalEffects
		GenerateSmoke, # Gunpowder babeyy
		Light,
		Lascerate,
		Transparency,
		Flame,
		Consumption, # Basically an acid-like substance
		Binding, # Glue
		Staining, # Dyes and paints

		Cleansing,
		BlockMyasma,
		AntiFlame,

	}

	static func get_potion_effect_from_int(effect: PotionEffect) -> String:
		return PotionEffect.keys()[effect]
	
	enum ItemRarity {
		COMMON = 0,
		UNCOMMON,
		RARE,
		SUPER_RARE,
		UNIQUE
	}

	static func get_item_rarity_from_int(rarity: ItemRarity) -> String:
		return ItemRarity.keys()[rarity]
