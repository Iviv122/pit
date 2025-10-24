extends Area2D 
class_name Enemy 

@export var health : float = 5


func _ready():
	body_entered.connect(is_player)
	on_spawn()

func on_spawn() -> void:
	pass

func damage(amount : float) -> void:
	health -= amount
	if health <= 0:
		die()

func die() -> void:
	queue_free()

func is_player(a : Node2D) -> void:
	print("player", a)
	if a is CharacterMovement:
		damage_player()

func damage_player() -> void:
	PlayerStatsInstance.deal_damage(1)