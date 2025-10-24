extends Area2D 
class_name JumpPad

@export var jump_power : float

func _ready():
	body_entered.connect(throw)

func throw(a : Node2D):
	if a is CharacterMovement:
		print("bonk")
		a.velocity.y = jump_power
