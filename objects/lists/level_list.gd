extends Resource
class_name LevelList 

@export var list: Array[PackedScene]

var queue : Array[PackedScene] 

func shuffle() -> void:
    for i in list:
        queue.append(i)
    queue.shuffle()

func get_level() -> PackedScene:
    if queue.size() == 0:
        shuffle()
    
    return queue.pop_back()