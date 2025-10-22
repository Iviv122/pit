extends Interactable
class_name Chest

@export var on_open: Array[Activateable]

var activated = false

func drop_item() -> void:
	pass

func act() -> void:
	if activated:
		return

	activated = true

	for i in on_open:
		i.act()

