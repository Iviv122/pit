extends LevelList
class_name TutorialLevelList 

var i : int = 0

func _init():
	pass

func get_level() -> PackedScene:
	if i >= list.size():
		return null 

	var scene = list[i]
	i+=1
	return scene 