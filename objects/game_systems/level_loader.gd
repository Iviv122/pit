extends Node2D
class_name LevelLoader

@export var tutorial_list: TutorialLevelList
@export var level_list: LevelList

func restart() -> void:
	tutorial_list.restart()
	load_scene()

func _ready():
	if get_tree().current_scene is MapEditor:
		return
	load_scene()
	add_to_group("restart")

func get_scene() -> PackedScene:
	var level = tutorial_list.get_level()

	if level == null:
		level = level_list.get_level()

	return level

func load_scene() -> void:
	for i in get_children():
		i.queue_free()
	
	add_child.call_deferred(get_scene().instantiate(),false)


enum LevelType {
	Tutorial,
	Basic,
}
