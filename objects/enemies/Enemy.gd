extends CharacterBody2D 
class_name Enemy 

@export var health : float = 5

func damage(amount : float) -> void:
	health -= amount
	if health <= 0:
		die()

func die() -> void:
	queue_free()

func damage_player(a : float) -> void:
	pass