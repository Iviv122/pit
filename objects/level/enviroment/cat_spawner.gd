extends Sprite2D 
class_name CatSpawner 

@export var cat_prefab : PackedScene

func spawn() -> void:
	var cat = cat_prefab.instantiate()
	cat.global_position = global_position
	get_parent().add_child.call_deferred(cat)

func _ready():
	if get_tree().current_scene is MapEditor:
		return
	else:
		spawn()
		texture = null