extends Node2D
class_name PlayerShooter

func _input(event):
	if Engine.time_scale == 0:
		return
	if event.is_action_pressed("shoot"):
		if PlayerInventoryInstance.weapon != null:
			PlayerInventoryInstance.weapon.shoot(get_parent())

