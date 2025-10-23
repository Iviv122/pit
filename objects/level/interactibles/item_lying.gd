extends Interactable 
class_name LyingItem

@export var item : Item 
@export var weapon : Weapon 

@export var activate_things : Array[Activateable]

@export var sprite : Sprite2D

var sin_pos : float

func _ready():
	if weapon and item:
		assert(false,"Pickup have both item and weapon")
	if item:
		set_item(item)
	if weapon:
		set_weapon(weapon)

func set_weapon(w : Weapon) -> void:
	weapon = w
	sprite.texture = w.sprite

func set_item(i : Item) -> void:
	item = i
	sprite.texture = item.sprite

func act() -> void:
	for i in activate_things:
		i.act()

	if item:
		PlayerInventoryInstance.take_item(item.duplicate())
	else:
		PlayerInventoryInstance.take_weapon(weapon.duplicate())
	queue_free()

func _process(delta):
	sin_pos += delta
	sprite.position.y = sin(sin_pos)*15
