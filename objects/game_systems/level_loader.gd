extends Node2D
class_name LevelLoader

@export var tutorial_list: TutorialLevelList
@export var level_list: LevelList

func _ready():
	load_scene()

func get_scene() -> PackedScene:
	var level = tutorial_list.get_level()

	if level == null:
		level = level_list.get_level()

	return level

func load_scene() -> void:
	for i in get_children():
		i.queue_free()
	
	add_child(get_scene().instantiate(),false)


enum LevelType {
	Tutorial,
	Basic,
}
