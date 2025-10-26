extends Sprite2D 
class_name PlayerSpawn

@export var player_prefab : PackedScene

func _input(event):
	if Input.is_action_just_pressed('restart'):
		if get_tree().current_scene is MapEditor:
			spawn()

func spawn() -> void:
	var player : CharacterMovement = player_prefab.instantiate()
	player.global_position = global_position
	get_parent().add_child.call_deferred(player)

func _ready():
	if get_tree().current_scene is MapEditor:
		global_position.y = -336
	else:
		spawn()
		texture = null