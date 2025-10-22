extends Activateable
class_name SideDoor

var up : int = 0 
var init_pos : Vector2

@export_range(-1,1) var side : int = -1 

func _ready():
	init_pos = global_position

var tween := create_tween()

func act() -> void:
	up = !up

	if tween:
		tween.kill()

	tween = create_tween()

	tween.tween_property(self,"global_position",init_pos+Vector2.RIGHT*128*up*side,1)
	
