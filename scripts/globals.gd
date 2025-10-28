extends Node

var DefaultIngredient: IngredientDetails = preload("res://resources/ingredient_types/default_ingredient.tres")
var DefaultPotionTexture: CompressedTexture2D = preload("res://assets/sprites/potion.png")

class ObjectTypes: ## Name subject to change
	enum IngredientType {
		MUSHROOM = 0,
		HERB,
		ROOT,
		MINERAL,
		METAL,
		LIQUID
	}

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
		DetectSpirits,
		GiftedVision,
		Myasma

	}
	
	enum ItemRarity {
		COMMON = 0,
		UNCOMMON,
		RARE,
		SUPER_RARE,
		UNIQUE
	}
