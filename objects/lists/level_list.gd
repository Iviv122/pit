extends Resource
class_name LevelList 

var list: Array[PackedScene]

var queue : Array[PackedScene] 

func _init():
    var path = "res://scenes/num_levels/"
    var dir = DirAccess.open(path)

    for i in dir.get_files():
        var file_path = path + i
        var loaded = load(file_path)
        if !list.has(loaded):
            list.append(loaded)

func shuffle() -> void:
    queue.clear()
    for i in list:
        queue.append(i)
    queue.shuffle()

func get_level() -> PackedScene:
    
    if queue.size() == 0:
        shuffle()
    
    return queue.pop_back()