extends Area2D
class_name Interactor

var interactibles : Array[Interactable]

func target_sorting(target1, target2):
	var distance1 = target1.position.distance_squared_to(global_position)
	var distance2 = target2.position.distance_squared_to(global_position)
	return distance1 <= distance2

func _ready() -> void:
	area_entered.connect(add)
	area_exited.connect(remove)

func _input(event):
	if event.is_action_pressed("interact"):
		act()

func act() -> void:

	interactibles.sort_custom(target_sorting)

	for i in interactibles:
		print(i)	

func add(a : Node2D) -> void:
	interactibles.append(a)
func remove(a : Node2D) -> void:
	interactibles.erase(a)
