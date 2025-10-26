extends Area2D
class_name EnemyProjectile

var dir : Vector2
var speed : float 

## ??????????
var damage : float 

func _input(event):
	if event.is_action_pressed('esc'):
		queue_free()

func _ready():
	body_entered.connect(on_collide)
	area_entered.connect(on_collide)

func on_collide(_a : Node2D):
	if _a is Bullet || _a is EnemyProjectile:
		return
	if _a is Interactor:
		return
	if _a is Enemy:
		return 
	if _a is CharacterMovement:
		PlayerStatsInstance.deal_damage(1) 
	queue_free()

func _process(delta):
	if dir:
		global_position += dir*delta*speed
