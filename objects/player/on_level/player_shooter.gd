extends Node2D
class_name PlayerShooter

func _input(event):
	if event.is_action_pressed("shoot"):
		if PlayerInventoryInstance.weapon != null:
			PlayerInventoryInstance.weapon.shoot()

func _ready():
	pass
