extends Control
class_name UIPotionDetailsPanel

@export var potion_title: RichTextLabel
@export var potion_icon: InventorySlot

@export var potency_label: RichTextLabel
@export var strength_label: RichTextLabel
@export var stability_label: RichTextLabel
@export var value_label: RichTextLabel

@export var effect_labels: Array[RichTextLabel]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func populate_details(details: PotionDetails, texture: Texture2D = Globals.DefaultPotionTexture) -> void:
	potion_title.text = "New Potion"
	potion_icon.set_texture(texture)

	potency_label.text = "%.3f" % details.potency
	strength_label.text = ("%.1f" % (details.strength * 100)) + "%"
	stability_label.text = ("%.3f" % details.stability) + "%"
	value_label.text = str(details.value) + "G"

	_populate_effects(details.effects)


func _populate_effects(effect_list: Array[Globals.ObjectTypes.PotionEffect]) -> void:
	for idx in range(0, len(effect_labels)):
	#for label in effect_labels:
		#print(Globals.ObjectTypes.PotionEffect.find_key(effect_list.get(idx)))
		#print(idx)
		if effect_list.get(idx) != null:
			effect_labels.get(idx).text = Globals.ObjectTypes.PotionEffect.find_key(effect_list[idx])
		else:
			effect_labels.get(idx).text = ""

func disable() -> void:
	self.visible = false

func enable(potion: PotionDetails) -> void:
	populate_details(potion)
	self.visible = true
